import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pharmacy/app/login_signup/textfield.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();

}

class _LoginState extends State<Login> {
  ScrollController _controller = ScrollController();
  TextEditingController _controller1=TextEditingController();
  TextEditingController _controller2=TextEditingController();
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
  }

  @override
  void dispose() {
    _controller.removeListener(_onScroll);
    _controller.dispose();
    super.dispose();
  }

  void _onScroll() {
    setState(() {
      _opacity = 1.0 - (_controller.offset / 400);
      _opacity = _opacity.clamp(0.0, 1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.grey[200],toolbarHeight: 1,),
      backgroundColor: Colors.grey[100],
      body: DefaultTabController(
        length: 1,
        child: NestedScrollView(
          controller: _controller,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: 600,
                toolbarHeight: 50,
                backgroundColor: Colors.grey[200],
                collapsedHeight: 100,
                flexibleSpace: FlexibleSpaceBar(
                  background: SingleChildScrollView(
                    child: Container(
                      color: Colors.grey[200],
                      child: Column(
                        children: [
                          SizedBox(height: 100,),
                          Container(
                            color:Colors.black,
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal:5,vertical:5),
                              color: Colors.grey[200],
                              child: const Column(
                                children: [
                                  Text("WELCOME",style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  ),),
                                                  
                              Text("TO",style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              ),),
                              Text("PHARMONY",style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              ),),
                                ],),
                            ),
                          ),
                          SizedBox(height: 50,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height:50,
                                width: 50,
                                color: Colors.amber,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                color: Colors.green,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                color: Colors.blue,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                color: Colors.red,
                              ),
                            ],
                          ),
                          SizedBox(height: 50,),
                    
                          Container(
                            color:Colors.black,
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                              color:Colors.grey[200],
                              child: Center(
                                child: Text("  This is a online medicine ordering app that   allows you to choose medicine, buy medicine and track them as they reach your footstep",
                                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ];
          },
          body: SingleChildScrollView(
            child: Container(
                color: Colors.grey[100],
                height: 900,
                child: Column(
                  children: [
                    Container(
                      color: Colors.pink,
                      height: 100,
                      width: 100,
                    ),
                    SizedBox(height: 70,),
                    Divider(color: Colors.black,thickness: 2,indent: 20,endIndent: 20,),
                    Container(
                      margin: EdgeInsets.only(top:0,right:100),
                      height: 60,
                      width: 300,
                      child:Text("             Login ",style:TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.black, ),)
                    ),
                    Divider(color: Colors.black,thickness: 2,indent: 20,endIndent: 20,),
                    SizedBox(height: 30,),
                    Container(
                      color: Colors.transparent,
                      height: 220,
                      child:Image.asset("asset/Icon.jpg")
                    ),
                    SizedBox(height: 20,),
                      TextBox(
                        controller:_controller1,
                        obscureText: false,
                        autocorrect: true,
                        hintText:" Email ID" ,
                      ),
                      SizedBox(height: 30,),
                      TextBox(
                        controller:_controller2,
                        obscureText: false,
                        autocorrect: true,
                        hintText:" password" ,
                      ),
                      SizedBox(height: 10,),
            
                      //submit
                      GestureDetector(
                        onTap:() => Navigator.pushReplacementNamed(context, "/home"),
                        child: Container(height: 100,width: 300,
                        child: Container(
                          margin: EdgeInsets.only(top:20,left:10),
                          child: Container(
                            margin: EdgeInsets.only(bottom: 25,right: 15,left:10,top: 10),
                            padding: EdgeInsets.only(left:10),
                            decoration: BoxDecoration(color:Colors.grey[100],border: Border.all(color: Colors.black,width: 2),borderRadius: BorderRadius.circular(20)),
                            child: Text("       S U B M I T",style: TextStyle(fontSize:27,fontWeight: FontWeight.bold,color: Colors.black),))),),
                      ),   
                        SizedBox(height: 40,),
                        Divider(color: Colors.black,thickness: 2,indent: 20,endIndent: 20,),
                        
                        //signup
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "/signup");
                          },
                          child: Container(child:Text("SIGNUP",style: TextStyle(color:Colors.black,
                          fontSize: 15,fontWeight: FontWeight.bold),)),
                        ), 
                        Divider(color: Colors.black,thickness: 2,indent: 20,endIndent: 20,),               
                  ],
                ),
              ),
          )
        ),
      ),
    );
  }
}
