import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image/image.dart' as img; // Import the image package
import 'package:web_socket_channel/io.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  runApp(MaterialApp(
    home: TakePictures(camera: firstCamera, cameras: cameras),
  ));
}

class TakePictures extends StatefulWidget {
  const TakePictures({Key? key, required this.camera, required this.cameras})
      : super(key: key);

  final CameraDescription camera;
  final List<CameraDescription> cameras;

  @override
  _TakePicturesState createState() => _TakePicturesState();
}

class _TakePicturesState extends State<TakePictures> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  final channel = IOWebSocketChannel.connect(Uri.parse("ws://pharmacy-3.onrender.com/image/ws/101"));

  @override
  void initState() {
    super.initState();
    _controller = CameraController(widget.camera, ResolutionPreset.medium);
    _initializeControllerFuture = _controller.initialize();
  }

  void call_websocket(){
      final channel = IOWebSocketChannel.connect(Uri.parse("ws://pharmacy-3.onrender.com/image/ws/101"));
  }

  Future<void> _flipCamera() async {
    await _controller.dispose();
    final newDescription = _controller.description == widget.camera
        ? widget.cameras.firstWhere(
            (camera) => camera.lensDirection != widget.camera.lensDirection)
        : widget.camera;
    _controller = CameraController(newDescription, ResolutionPreset.medium);
    _initializeControllerFuture = _controller.initialize();
    setState(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    channel.sink.close(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.8),
        title: Text(
          "Camera",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                final size = MediaQuery.of(context).size;
                final deviceRatio = size.width / size.height;
                return Transform.scale(
                  scale: _controller.value.aspectRatio / deviceRatio,
                  child: Center(
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: CameraPreview(_controller),
                    ),
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: _flipCamera,
                  icon: Icon(Icons.flip_outlined, color: Colors.white),
                  iconSize: 50.0,
                ),
                IconButton(
                  onPressed: () async {
                    setState(() {});
                    call_websocket();
                    try {
                      await _initializeControllerFuture;
                      final image = await _controller.takePicture();
                      final imageFile = File(image.path);
                      final bytes = await imageFile.readAsBytes();

                      final decodedImage = img.decodeImage(Uint8List.fromList(bytes));

                      final int width = decodedImage!.width;
                      final int height = decodedImage.height;

                      final List<List<dynamic>> lst = [];
                      for (int y = 0; y < height; y++) {
                        for (int x = 0; x < width; x++) {
                          final img.Pixel pixel = decodedImage.getPixel(x, y);
                          final r = pixel.r;
                          final g = pixel.g;
                          final b = pixel.b;
                          
                          lst.add([r, g, b]);
                        }
                      }
                      final json = jsonEncode(lst);
                      channel.sink.add(json);
                      print(lst);
                        StreamBuilder(
                  stream: channel.stream,
    builder: (context, snapshot) {
      print("${snapshot.data}");
    return Text(snapshot.hasData ? '${snapshot.data}' : '');
  },
);
 
                      
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return DisplayPicture(imagePath: image.path);
                        },
                      ));
                    } catch (e) {
                      print(e);
                    }
                  },
                
                  icon: Icon(Icons.camera_alt_outlined, color: Colors.white),
                  iconSize: 60.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DisplayPicture extends StatelessWidget {
  const DisplayPicture({Key? key, required this.imagePath}) : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Picture")),
      body: Image.file(File(imagePath)),
    );
  }
}
