import 'package:data_consult/database/ui/widgets/database_clients_list.dart';
import 'package:data_consult/user/bloc/bloc_user.dart';
import 'package:data_consult/user/model/user.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class Consult extends StatelessWidget{
  
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {

    userBloc = BlocProvider.of<UserBloc>(context);
    
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        switch (snapshot.connectionState){
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          case ConnectionState.none:
            return CircularProgressIndicator();
          case ConnectionState.active:
            return showProfileData(snapshot);
          case ConnectionState.done:
            return showProfileData(snapshot);
          default: 

        }
      },
      );
  }

Widget showProfileData(AsyncSnapshot snapshot){
  if(!snapshot.hasData||snapshot.hasError){
    print('No Logueado');
    return Text("No logeeado vete po");
  }else{
    print("Logeadox3");
    var user = User(
      uid: snapshot.data.uid,
      name: snapshot.data.displayName,
      email: snapshot.data.email,
      photoURL: snapshot.data.photoUrl
    );
    return Stack(
              children: <Widget>[
                //Text('data'),
                DatabaseClientsList(user)
              ],
            );
  }
}


}