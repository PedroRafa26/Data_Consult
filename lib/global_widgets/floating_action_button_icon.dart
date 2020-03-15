import 'package:flutter/material.dart';

class FloatingActionButtonIcon extends StatefulWidget {

  final IconData iconData;
  final VoidCallback onPressed;
  final Color color;

  FloatingActionButtonIcon({
    Key key,
    @required this.iconData,
    @required this.onPressed,
    @required this.color
  });

  @override
  State<StatefulWidget> createState() {
    return _FloatingActionButtonIcon();
  }

}


class _FloatingActionButtonIcon extends State<FloatingActionButtonIcon> {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FloatingActionButton(
      backgroundColor: widget.color,
      mini: true,
      tooltip: "Fav",
      onPressed: widget.onPressed,
      child: Icon(widget.iconData),
      heroTag: null,
    );
  }

}