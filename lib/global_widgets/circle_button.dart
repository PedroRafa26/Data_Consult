import 'package:flutter/material.dart';

class CircleButton extends StatefulWidget{
  
  final VoidCallback onPressed;
  bool mini;
  var icon;
  double iconSize;
  var color;
  
  CircleButton(@required this.onPressed, this.mini, this.icon, this.iconSize, this.color);
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CircleButton();
  }
  
}

class _CircleButton extends State<CircleButton> {
  
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FloatingActionButton(
        backgroundColor: widget.color,
        mini: widget.mini,
        onPressed: widget.onPressed,
        child: Icon(
          widget.icon,
          size: widget.iconSize,
          color: Colors.greenAccent
        ),
      
    );
  }
  
}