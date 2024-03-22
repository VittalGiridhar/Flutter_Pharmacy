import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import "package:pharmacy/app/login_signup/textfield1.dart";
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pharmacy/app/login_signup/textfield.dart';
import 'package:pharmacy/camera.dart';

class PharmacyLogin extends StatelessWidget {
  TextEditingController _controller1=TextEditingController();
  TextEditingController _controller2=TextEditingController();
  TextEditingController _controller3=TextEditingController();
  TextEditingController _controller4=TextEditingController();
  TextEditingController _controller5=TextEditingController();
  TextEditingController _controller6=TextEditingController();
  TextEditingController _controller7=TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("P H A R M A C Y",style: TextStyle(color: Colors.white,
        fontWeight: FontWeight.bold,fontSize: 30),),
        backgroundColor: Colors.blue[200],
        centerTitle: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        toolbarHeight: 100,
      ),
      backgroundColor: Colors.white,
      body:ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
        return Center(
                child: Column(
            children: [
              SizedBox(height: 50,),
              TextBox1(controller: _controller1, obscureText: false, autocorrect: true, hintText: "    Email Id"),
              SizedBox(height: 30,),
              TextBox1(controller: _controller2, obscureText: false, autocorrect: true, hintText: "    username "),
              SizedBox(height: 30,),    
              TextBox1(controller: _controller3, obscureText: false, autocorrect: true, hintText: "    password"),
              SizedBox(height: 30,),         
              TextBox1(controller: _controller4, obscureText: false, autocorrect: true, hintText: "    confirm password"),
              SizedBox(height: 30,), 
              TextBox1(controller: _controller5, obscureText: false, autocorrect: true, hintText: "     mobile number"),
              SizedBox(height: 30,),
              TextBox1(controller: _controller6, obscureText: false, autocorrect: true, hintText: "      address"),
              SizedBox(height: 30,),
              TextBox1(controller: _controller7, obscureText: false, autocorrect: true, hintText: "     Location(latitude,longitude)"),
              SizedBox(height: 30,),

              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context,"/camera");
                },
                child: Container(
                  color:Colors.grey[100],
                  margin: EdgeInsets.only(left:50,right:60 ),
                  child:Row(
                    children: [
                  Text("DRUG LICIENCE:",style: TextStyle(fontSize: 20),),
                  SizedBox(width:20 ,),
                  Container(
                    child:Icon(Icons.camera,size: 40,))
                ],)),
              ),
              
              SizedBox(height: 30,),
              Container(),

              GestureDetector(
                onTap: () => Navigator.pushNamed(context, "/"),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 60,vertical: 5),
                  decoration: BoxDecoration(color:Colors.white,border: Border.all(color: Colors.black,width: 2)),
                  child:Text("N E X T",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),),),
              ),
              SizedBox(height: 30,),                         
            ],
          ),
        );
      }
      )      
    );
  }
}