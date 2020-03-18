import 'package:data_consult/user/bloc/bloc_user.dart';
import 'package:data_consult/user/model/user.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class DatabaseClientsList extends StatelessWidget{
  
  UserBloc userBloc;
  User user;

  DatabaseClientsList(@required user);
  
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
        stream: userBloc.myClientsListStream(user.uid),
        //Una vez que sucede algo en el Stream, se cae en el builder
        builder: (context, AsyncSnapshot snapshot){

          switch(snapshot.connectionState){
            case ConnectionState.waiting:
              return Container(
                height: 100,
                width: 100,
                child: CircularProgressIndicator()
              );
            case ConnectionState.done:
              
              return Column(
                        children: userBloc.buildClient(snapshot.data.documents)
                      );
            case ConnectionState.active:
              return ListView(
                        children: userBloc.buildClient(snapshot.data.documents)
                      );
            case ConnectionState.none:
              return Container(
                height: 100,
                width: 100,
                child: CircularProgressIndicator()
              );
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