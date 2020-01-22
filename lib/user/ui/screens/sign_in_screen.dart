import 'package:data_consult/user/ui/widgets/button_green.dart';
import 'package:data_consult/user/ui/widgets/gradient_back.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SignInScreen();
  }

}

class _SignInScreen extends State<SignInScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return signInGoogleUI();
  }

  Widget signInGoogleUI(){
    return Scaffold(
      body:Stack(
        alignment: Alignment.center,
        children: <Widget>[
         GradientBack("", null),
         Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             Text("Welcome \n This is your DataConsult App",
             style: TextStyle(
               fontSize: 37.0,
               fontWeight: FontWeight.bold,
               color: Colors.white
             ),
             ),

             ButtonGreen(
               text: "Login with Gmail",
               onPressed: (){

               },
               widht: 300.0,
               height: 60.0,
               )
           ],
         )
        ],
      ),
    );
  }

}