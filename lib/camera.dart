import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image/image.dart' as img; // Import the image package

void main() {
  runApp(MaterialApp(
    home: CallingPage(),
  ));
}

class CallingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calling Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TakePictures()),
            );
          },
          child: Text('Open Camera'),
        ),
      ),
    );
  }
}

class TakePictures extends StatefulWidget {
  @override
  _TakePicturesState createState() => _TakePicturesState();
}

class _TakePicturesState extends State<TakePictures> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  late List<CameraDescription> _cameras;
  late CameraDescription _camera;
  bool _isCameraReady = false; // To control the visibility of circular progress indicator

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    _cameras = await availableCameras();
    _camera = _cameras.first;

    _controller = CameraController(_camera, ResolutionPreset.medium);
    _initializeControllerFuture = _controller.initialize().then((_) {
      setState(() {
        _isCameraReady = true; // Set to true once initialization is complete
      });
    }).catchError((error) {
      print('Error initializing camera: $error');
    });
  }

  Future<void> _flipCamera() async {
    await _controller.dispose();
    final newDescription = _controller.description == _camera
        ? _cameras.firstWhere((camera) => camera.lensDirection != _camera.lensDirection)
        : _camera;
    setState(() {
      _camera = newDescription;
      _controller = CameraController(_camera, ResolutionPreset.medium);
      _initializeControllerFuture = _controller.initialize();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Take Pictures'),
      ),
      body: Stack(
        children: [
          _isCameraReady
              ? FutureBuilder<void>(
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
                )
              : Center(child: CircularProgressIndicator()), // Show circular progress indicator while initializing
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: _flipCamera,
                  icon: Icon(Icons.flip_outlined),
                  iconSize: 50.0,
                ),
                IconButton(
                  onPressed: () async {
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

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ImageContainer(imagePath: image.path, rgbValues: lst),
                        ),
                      );
                    } catch (e) {
                      print(e);
                    }
                  },
                  icon: Icon(Icons.camera_alt_outlined),
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

class ImageContainer extends StatelessWidget {
  final String imagePath;
  final List<List<dynamic>> rgbValues;

  const ImageContainer({required this.imagePath, required this.rgbValues});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Container'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Image.file(File(imagePath)),
            ),
          ),
        ],
      ),
    );
  }
}
