import 'dart:io';
import 'package:data_consult/client/model/client.dart';
import 'package:data_consult/client/ui/widgets/client_image.dart';
import 'package:data_consult/client/ui/widgets/title_input_location.dart';
import 'package:data_consult/global_widgets/submit_button.dart';
import 'package:data_consult/global_widgets/text_input.dart';
import 'package:data_consult/global_widgets/title_header.dart';
import 'package:data_consult/user/bloc/bloc_user.dart';
import 'package:data_consult/user/ui/widgets/gradient_back.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class AddClientScreen extends StatefulWidget {
  
  //preparacion de la pantalla para recibir la foto y mostrarla
  File image;
  bool camera = false;
  AddClientScreen({Key key, this.image, this.camera});

  @override
  State<StatefulWidget> createState() {
    return _AddPlaceScreen();
  }


}

class _AddPlaceScreen extends State<AddClientScreen> {
  @override
  Widget build(BuildContext context) {

    final _controllerName = TextEditingController();
    final _controllerLastName = TextEditingController();
    final _controllerCellphone = TextEditingController();
    final _controllerEmail = TextEditingController();
    final _controllerId = TextEditingController();
    final _controllerAdress = TextEditingController();
        
    
    
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);



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
                    pathImage: widget.image.path, //"assets/images/cedula_abigail1.png",
                    height: 220.0,
                    width: 300.0,
                    iconData: Icons.directions_car,
                    color: Colors.greenAccent,
                    onPressedFabIcon: (){}, 
                    image: widget.image,
                    
                    ),
                ), //Imagen
                Container(//TextField Title
                  margin: EdgeInsets.only(top:20.0,bottom: 05.0),
                  child: TextInput(
                    hintText: "Nombre",
                    inputType: null, 
                    controller: _controllerName, 
                    maxLines: 1,
                    ),
                    /*TextInput(
                    hintText: "Apellido",
                    inputType: null, 
                    controller: _controllerLastName, 
                    maxLines: 1,
                    ),*/
                  
                    
                ),
                TextInput(
                    hintText: "Apellido",
                    inputType: null, 
                    controller: _controllerLastName, 
                    maxLines: 1,
                    ),
                TextInput(
                  hintText: "Cedula de Identidad", 
                  inputType: null, 
                  controller: _controllerId,
                  maxLines: 1,
                  ),
                  TextInput(
                  hintText: "Numero de Telefono", 
                  inputType: null, 
                  controller: _controllerCellphone,
                  maxLines: 1,
                  ),
                  TextInput(
                  hintText: "Correo Electronico", 
                  inputType: null, 
                  controller: _controllerEmail,
                  maxLines: 1,
                  ),
                Container(
                  padding: EdgeInsets.only(top:20.0),
                  child: TextInputLocation(
                    hintText: "Add Location", 
                    controller: _controllerAdress, 
                    iconData: Icons.location_on),
                ),
                
                Container( //boton de submit
                  width: 70.0,
                  child: SubmitButton(
                    buttonText: "Agregar Cliente",
                    onPressed: (){

                      //ID usuario logeado actualmente
                      userBloc.currentUser.then((FirebaseUser user){
                        if(user!=null){
                          
                          String uid = user.uid;

                          String path = "${uid}/${DateTime.now().toString()}.jpg";


                          //1. Firebase Storage
                          //url subida del archivo
                          userBloc.uploadFile(path, widget.image)
                          .then((StorageUploadTask storageUploadTask){
                            //recuperacion de la URL de la imagen despues de subida
                            CircularProgressIndicator();
                            storageUploadTask.onComplete.then((StorageTaskSnapshot snapshot) {

                              snapshot.ref.getDownloadURL().then((urlImage){
                                print("URL Image: ${urlImage}");
                              
                              //2. Cloud Firestore
                              //Place - title, description, url, user
                              userBloc.updateClientDate(Client(
                                name: _controllerName.text,
                                lastName: _controllerLastName.text,
                                cellphone: _controllerCellphone.text,
                                id: _controllerId.text,
                                addres: _controllerAdress.text, 
                                emailClient: _controllerEmail.text,
                                    

                              )).whenComplete((){
                                print("Termino");
                                Navigator.pop(context);
                              });

                              

                              });
                            });
                          });
                        }
                      });
                      
                      

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