import 'package:data_consult/add/add.dart';
import 'package:data_consult/consult/consult.dart';
import 'package:data_consult/database/database.dart';
import 'package:data_consult/user/bloc/bloc_user.dart';
import 'package:data_consult/user/ui/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class HomeCupertino extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              title: Text("Add"),
              backgroundColor: Colors.black
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              title: Text("Database"),
              backgroundColor: Colors.blueGrey
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.loupe),
              title: Text("Consult"),
              backgroundColor: Colors.yellow
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              title: Text("Profile"),
              backgroundColor: Colors.greenAccent
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index){
          switch (index){
            case 0:
              return CupertinoTabView(
                builder: (BuildContext context) => Add(),
              );
            case 1:
              return CupertinoTabView(
                builder: (BuildContext context) => Database(),
              );
            case 2:
              return CupertinoTabView(
                builder: (BuildContext context) => Consult(),
              );
            case 3:
              return CupertinoTabView(
                builder: (BuildContext context){
                  return BlocProvider<UserBloc>(
                    bloc: UserBloc(),
                    child: Profile(),
                  );
                },
              );
              break;
          }
        },
      ),
    );
  }

  
}