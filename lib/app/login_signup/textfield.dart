import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  final TextEditingController controller;
  final bool autocorrect;
  final bool obscureText;
  final String hintText; 
  TextBox({required this.controller,required this.obscureText,required this.autocorrect,required this.hintText});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 50,
      child: TextField(
        controller:controller,
          autocorrect: autocorrect,
          obscureText:obscureText,
          decoration: InputDecoration(
          enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(30),borderSide: BorderSide(color: Colors.black)),
          focusedBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.black)),
          enabled: true,
          focusColor: Colors.black,
          fillColor:Colors.white,
          filled:true ,
          hintText:hintText,
          hintStyle: TextStyle(color:Colors.grey[400],fontSize: 15,letterSpacing: 2),
          ),
          cursorColor: Colors.blue,cursorOpacityAnimates: true,
          cursorWidth: 2,
          cursorHeight: 28,
          style: TextStyle(color:Colors.black,fontSize: 20),
      ),
    );
  }
}