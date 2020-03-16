import 'package:data_consult/client/model/client.dart';
import 'package:flutter/material.dart';

class ClientCard extends StatelessWidget{
 
  final Client client;

  ClientCard({Key key, this.client});
 
  @override
  Widget build(BuildContext context) {

  double screenWidth = MediaQuery.of(context).size.width;


  final clientName = Text(
    this.client.lastName,//+' '+this.client.name,
    style: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold
    ),
  );

  final clientDatos = Padding(
    
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(this.client.id),
          Text(this.client.cellphone)
        ],
      ),

    );

  final card = Container(
    width: screenWidth*0.65,
    /*insertar decoracion*/

    child: Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          clientName,
          clientDatos
        ],
      ), 
    ),


  );


  return Stack(
    alignment: Alignment(0.0, 0.8),
    children: <Widget>[
      card,
    ],
  );
  }


  
}