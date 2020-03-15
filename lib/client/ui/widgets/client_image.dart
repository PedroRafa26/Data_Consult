import 'package:data_consult/global_widgets/floating_action_button_icon.dart';
import 'package:flutter/material.dart';


class ClientImageWithFabIcon extends StatelessWidget{
 
  final double height ;
  final double width ;
  double left=20.0;
  final String pathImage;
  final VoidCallback onPressedFabIcon;
  final IconData iconData;
  Color color = Colors.white;

  ClientImageWithFabIcon({
    Key key,
    @required this.pathImage,
    @required this.height,
    @required this.width,
    @required this.onPressedFabIcon,
    @required this.iconData,
    this.color
  });
  

 
  @override
  Widget build(BuildContext context) {
   
    final card = Container(
      height: height,
      width: width,
      margin: EdgeInsets.only(left: left),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(pathImage)
      ),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      shape: BoxShape.rectangle,
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black12,
          blurRadius: 15.0,
          offset: Offset(0.0, 7.0)
        )
      ]
    )
    );

    return Stack(
      alignment: Alignment(0.0, 1.1),
      children: <Widget>[
        card,
        Row(
          children: <Widget>[
            FloatingActionButtonIcon(iconData: iconData, onPressed: onPressedFabIcon, color: color),
            FloatingActionButtonIcon(iconData: Icons.local_hospital, onPressed: onPressedFabIcon, color: Colors.blueGrey
            )
          ],
        ),
      ],
    );
  }
  
}