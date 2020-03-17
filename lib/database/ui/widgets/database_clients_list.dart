import 'package:data_consult/user/bloc/bloc_user.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class DatabaseClientsList extends StatelessWidget{
  
  UserBloc userBloc;

  
  @override
  Widget build(BuildContext context) {

    userBloc =BlocProvider.of<UserBloc>(context);
  
    return Container(
      margin: EdgeInsets.only(
        top: 10.0,
        bottom: 10.0,
        right: 20.0, 
        left: 20.0 
      ),
      child: StreamBuilder(
        stream: userBloc.clientsStream,
        //Una vez que sucede algo en el Stream, se cae en el builder
        builder: (context, AsyncSnapshot snapshot){

          switch(snapshot.connectionState){
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            case ConnectionState.done:
              
              return Column(
                        children: userBloc.buildClient(snapshot.data.documents)
                      );
            case ConnectionState.active:
              return ListView(
                        children: userBloc.buildClient(snapshot.data.documents)
                      );
            case ConnectionState.none:
              return CircularProgressIndicator();
            default: return Column(
                        children: userBloc.buildClient(snapshot.data.documents)
                      );
          }
        }
      ),
    ); 
  }

  /**Column(
      children: <Widget>[
        //children1
        //children2
      ],
    ); 
    **/
}