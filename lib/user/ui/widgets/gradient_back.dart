import 'package:flutter/material.dart';

class GradientBack extends StatelessWidget{
  
  String title = "Welcome to DataConsult";
  double height_screen = 0.0;

  GradientBack({Key key, this.height_screen});//height = null -> full screen
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    //MediaQuery es una clase que nos da la altura de la plataforma
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    if(height_screen == null){
      height_screen = screenHeight;
    }

    return Container(
      width: screenHeight,
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

      child: FittedBox(
        fit: BoxFit.none,
        alignment: Alignment(-1.5, -0.8),
        child: Container(
          width:screenHeight,
          height: screenHeight,
          decoration: BoxDecoration(
            color: Color.fromRGBO(0,0,155,0.15),
            borderRadius: BorderRadius.circular(screenHeight/2),
          ),
        ),
      ),
      /*Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold 
        ),
      ),
      */
      //alignment: Alignment(-0.9, -0.6),
    );

  }
}