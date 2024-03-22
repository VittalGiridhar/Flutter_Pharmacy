import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:pharmacy/app/login_signup/textfield.dart";


class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("S I G N U P",style: TextStyle(color: Colors.white,
        fontWeight: FontWeight.bold,fontSize: 30),),
        backgroundColor: Colors.blue[200],
        centerTitle: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        toolbarHeight: 100,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(height:60),
            Container(
              child: Image.asset("asset/CreateAccount.png"),
            ),
            Container(
              child:Text("CREATE ACCOUNT",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 25))
            ),
            SizedBox(height: 10,),
            Divider(thickness: 2,indent: 30,endIndent: 30,),
            SizedBox(height: 30,),
            Row(
              children: [
                SizedBox(width:15),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, "/pharmacyLogin"),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                    decoration: BoxDecoration(color:Colors.white,border: Border.all(color: Colors.black,width: 2)),
                    child:Text("P H A R M A C Y",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.black),),),
                ),       
                SizedBox(width: 50,),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, "/pharmacyLogin"),
                  child: Container(
                    margin: EdgeInsets.only(),
                    padding: EdgeInsets.symmetric(horizontal: 13,vertical: 11),
                    decoration: BoxDecoration(color:Colors.white,border: Border.all(color: Colors.black,width: 2)),
                    child:Text("    U S E R     ",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.black),),),
                ),                     
              ],              
            ),
              SizedBox(height: 30,),
              Divider(thickness: 2,indent: 30,endIndent: 30,),
              Container(
                child:Text("")
              )
          ],
        ),
      ),
    );
  }
}
