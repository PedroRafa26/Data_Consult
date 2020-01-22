import 'package:flutter/material.dart';

class GradientBack extends StatelessWidget{
  
  String title = "Welcome to DataConsult";
  double height_screen = 0.0;

  GradientBack(this.title,this.height_screen);
  
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: height_screen,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
            Color(0xff193f69),
            Color(0xffc1cad8)
            ],
          begin: FractionalOffset(0.2, 0.0),
          end: FractionalOffset(1.0, 0.6),
          stops: [0.0,0.6],
          tileMode: TileMode.clamp
        )
      ),

      child: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold 
        ),
      ),
      alignment: Alignment(-0.9, -0.6),
    );

  }
}