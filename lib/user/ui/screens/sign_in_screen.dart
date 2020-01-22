import 'package:data_consult/user/bloc/bloc_user.dart';
import 'package:data_consult/user/ui/widgets/button_green.dart';
import 'package:data_consult/user/ui/widgets/gradient_back.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class SignInScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SignInScreen();
  }

}

class _SignInScreen extends State<SignInScreen>{
  
  UserBloc userBloc;
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    //El objeto userBloc Se instancia a traves del Provider que se aloja en el Main.dart
    //Es importante recordar crear la variable antes de la funcion inner linea 19
    
    userBloc = BlocProvider.of(context);
    return signInGoogleUI();
  }

  Widget signInGoogleUI(){
    return Scaffold(
      body:Stack(
        alignment: Alignment.center,
        children: <Widget>[
         GradientBack("", null),
         Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             Text("Welcome \n This is your DataConsult App",
             style: TextStyle(
               fontSize: 37.0,
               fontWeight: FontWeight.bold,
               color: Colors.white
             ),
             ),

             ButtonGreen(
               text: "Login with Gmail",
               onPressed: (){
                 //el then se esta usando para testeo, no es necesario incluirlo
                 //tampoco es necesaria la libreria auth_firebase porque rmpa el patron BLoC
                 userBloc.signIn().then((FirebaseUser user)=> print("El usuario es ${user.displayName}"));
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