import 'dart:io';
import 'package:data_consult/client/ui/widgets/client_image.dart';
import 'package:data_consult/client/ui/widgets/title_input_location.dart';
import 'package:data_consult/global_widgets/submit_button.dart';
import 'package:data_consult/global_widgets/text_input.dart';
import 'package:data_consult/global_widgets/title_header.dart';
import 'package:data_consult/user/ui/widgets/gradient_back.dart';
import 'package:flutter/material.dart';

class AddClientScreen extends StatefulWidget {
  
  //preparacion de la pantalla para recibir la foto y mostrarla
  File image;
  AddClientScreen({Key key, this.image});

  @override
  State<StatefulWidget> createState() {
    return _AddPlaceScreen();
  }


}

class _AddPlaceScreen extends State<AddClientScreen> {
  @override
  Widget build(BuildContext context) {

    final _controllerTitleClient = TextEditingController();
    final _controllerDescriptionClient = TextEditingController();




    return Scaffold(
      body:Stack(
        children: <Widget>[
          GradientBack(height_screen: 270),
          Row( //App Bar personalizado
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top:25.0, left: 5.0),
                child: SizedBox(
                  height:45.0,
                  width: 45.0,
                  child: IconButton(icon: Icon(Icons.keyboard_arrow_left, color: Colors.white, size: 45,), 
                  onPressed: (){
                    Navigator.pop(context);
                  }),
                ),
              ),
              Flexible(child:
              Container(
                padding: EdgeInsets.only(top:45, left:20, right: 10.0),
                child: TitleHeader(title: "Agregar un nuevo cliente"),
              )
            )



            ]
          ),

          //Safe Area
          Container(
            margin: EdgeInsets.only(top:120, bottom:20),
            child: ListView(  //Nos permite hacer Scroll y no superponernos al AppBar
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: ClientImageWithFabIcon(
                    pathImage: "assets/images/cedula_abigail1.png", //widget.image.path,
                    height: 220.0,
                    width: 300.0,
                    iconData: Icons.directions_car,
                    color: Colors.greenAccent 
                    ),
                ), //Imagen
                Container(//TextField Title
                  margin: EdgeInsets.only(top:20.0,bottom: 20.0),
                  child: TextInput(
                    hintText: "Nombres y Apellidos",
                    inputType: null, 
                    controller: _controllerTitleClient, 
                    maxLines: 1,
                    ),
                ),
                TextInput(
                  hintText: "Description", 
                  inputType: TextInputType.multiline, 
                  controller: _controllerDescriptionClient,
                  maxLines: 4,
                  ),
                Container(
                  padding: EdgeInsets.only(top:20.0),
                  child: TextInputLocation(
                    hintText: "Add Location", 
                    controller: null, 
                    iconData: Icons.location_on),
                ),
                
                Container( //boton de submit
                  width: 70.0,
                  child: SubmitButton(
                    buttonText: "Agregar Cliente",
                    onPressed: (){
                      //1. Firebase Storage
                      //url
                      
                      
                      //2. Cloud Firestore
                      //Place - title, description, url, user



                    },
                  
                  ),
                ),
              ],

            ),
          )
        ],
      )
    );

  }

}