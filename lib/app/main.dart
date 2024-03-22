import "package:flutter/material.dart";
import "package:pharmacy/app/homepage/chatbot.dart";
import "package:pharmacy/app/homepage/home.dart";
import "package:pharmacy/app/login_signup/Login.dart";
import "package:pharmacy/app/login_signup/pharmacyLogin.dart";
import "package:pharmacy/app/login_signup/signup.dart";
import "package:pharmacy/camera.dart";

void main(){
  runApp(MaterialApp(
    routes:{
      "/":(context)=>Login(),
      "/signup":(context) =>Signup(), 
      "/home":(context) => Home(),
      "/pharmacyLogin":(context) => PharmacyLogin(),
      "/camera":(context) => CallingPage(),
      "/chatbox":(context) => ChatBox()
    }
  ));
}