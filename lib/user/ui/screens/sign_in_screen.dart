import 'package:data_consult/home.dart';
import 'package:data_consult/user/bloc/bloc_user.dart';
import 'package:data_consult/user/model/user.dart';
import 'package:data_consult/user/ui/widgets/button_green.dart';
import 'package:data_consult/user/ui/widgets/gradient_back.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import '../../../home_Cuppertino.dart';

class SignInScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SignInScreen();
  }

}

class _SignInScreen extends State<SignInScreen>{
  
  UserBloc userBloc;
  double screenWidth;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    double screenWidth = MediaQuery.of(context).size.width;

    //El objeto userBloc Se instancia a traves del Provider que se aloja en el Main.dart
    //Es importante recordar crear la variable antes de la funcion inner linea 19
    
    userBloc = BlocProvider.of(context);
    return _handleCurrentSession();
  }


  //Aqui se decide que pantalla mostrar en base al Stream
  Widget _handleCurrentSession(){
    return StreamBuilder(
      //recepcion del estatus proveniente del Bloc
      stream: userBloc.authStatus,
      //Respuesta al stream
      builder: (BuildContext context, AsyncSnapshot snapshot){
        //snapshot - contiene nuestra data  - nuestro Object User traido desde el Firebase
        if(!snapshot.hasData || snapshot.hasError){
          return signInGoogleUI();
        }else{
          return HomeCupertino();
        }
      },
    );
  }

  Widget signInGoogleUI(){
    return Scaffold(
      body:Stack(
        alignment: Alignment.center,
        children: <Widget>[
         GradientBack(height_screen: null),
         Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             Flexible(
               child: Container(
                 width: screenWidth,
                 child: Text("Welcome \n This is your \nDataConsult App",
                      style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                      
                    ),
                    textAlign: TextAlign.center,
                    ),
             )
             ),
             
             ButtonGreen(
               text: "Login with Gmail",
               onPressed: (){
                 //el then se esta usando para testeo, no es necesario incluirlo
                 //tampoco es necesaria la libreria auth_firebase porque rmpa el patron BLoC
                 //userBloc.signOut();
                 userBloc.signIn().then((FirebaseUser user){
                   userBloc.updateUserData(User(
                     uid: user.uid,
                     name: user.displayName,
                     email: user.email,
                     photoURL: user.photoUrl 
                   ));
                 });
               },
               widht: 300.0,
               height: 60.0,
               )
           ],
         )
        ],
      ),
    );
  }

}