import 'package:data_consult/user/bloc/bloc_user.dart';
import 'package:data_consult/user/model/user.dart';
import 'package:data_consult/user/ui/widgets/user_info.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class ProfileHeader extends StatelessWidget{
  
  UserBloc userBloc;
  User user;

  final title = Text(
        "Profile",
        style: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.bold
        ),
        );
  
  @override
  Widget build(BuildContext context) {
    
    userBloc = BlocProvider.of<UserBloc>(context);
    


    return StreamBuilder(

      stream: userBloc.streamFirebase, //Flujo de datos con el cual es esta alerta
      builder: (BuildContext context, AsyncSnapshot snapshot){
        switch(snapshot.connectionState){ //monitoreo del objeto snapshot, muestra una barra de progreso
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          case ConnectionState.none:
            return CircularProgressIndicator();
          case ConnectionState.active:
            return showProfileData(snapshot);
          case ConnectionState.done:
            return showProfileData(snapshot);  
        }
      }, //que se ejecuta cuando cambien los datos


    );
    
    
  }


  Widget showProfileData(AsyncSnapshot snapshot){ //validacion de presencia de data
    if(!snapshot.hasData || snapshot.hasError){
      print("No logeado");
      return Container(
        margin: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 50.0
        ),
        child: Column(
          children: <Widget>[
            CircularProgressIndicator(),
            Text("No se pudo cargar la informacion. Haz Login")
          ],
        ),
      );
    }else{
      print("Logeado");
      print(snapshot.data);
      user = User(name: snapshot.data.displayName,email: snapshot.data.email, photoURL: snapshot.data.photoUrl, uid: snapshot.data.uid);
      return Container(
        margin: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 50.0
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                title
              ],
            ),
            UserInfo(user),
          ],
        ),
      );
    }
  }

  
}