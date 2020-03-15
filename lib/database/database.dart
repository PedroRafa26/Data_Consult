import 'dart:io';
import 'package:data_consult/client/ui/screens/add_client_screen.dart';
import 'package:data_consult/global_widgets/circle_button.dart';
import 'package:data_consult/user/ui/widgets/gradient_back.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Database extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        GradientBack(height_screen: 250.0,),
        Container(
          padding: EdgeInsets.only(top:50.0,left: 180.0),
          child: CircleButton(
        () {
          Future getImage() async{
              File image = await
              ImagePicker.pickImage(source: ImageSource.camera)
              .catchError((onError)=> print(onError));;
              if(image!=null){
                Navigator.push(context, 
                MaterialPageRoute(builder: (BuildContext context)=> AddClientScreen(image: image,camera: true,)));    
                }
              }
          //Prevenir perdida de datos
          Future<void> retrieveLostData() async{
            final LostDataResponse response = await
            ImagePicker.retrieveLostData();
            if(response==null){
              return;
            }
            if(response.file!=null){
              print("============FUNCIONO==============");
              Navigator.push(context, 
                MaterialPageRoute(builder: (BuildContext context)=> AddClientScreen(image: response.file)));    
                }
            
          }
          getImage();
          retrieveLostData();
          },
        
        
        false, Icons.add, 40.0, Colors.white,),
        )
      ],
      alignment: Alignment.topCenter,
    );
  }

  
}