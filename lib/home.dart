import 'package:data_consult/user/bloc/bloc_user.dart';
import 'package:data_consult/user/ui/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:data_consult/add/add.dart';
import 'package:data_consult/consult/consult.dart';
import 'package:data_consult/database/database.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Home();
  }
  
}

class _Home extends State<Home>{

  UserBloc userBloc;

  int indexTap=0;
  final List<Widget> widgetsMenu = [
    Add(),
    Database(),
    Consult(),
    Profile()
  ];

  void onTapTapped(int index) {

      setState(() { //controla el estado del widget
        indexTap = index;     
      });
    }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    userBloc = BlocProvider.of(context);
    return Scaffold(
      body: widgetsMenu[indexTap],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.yellow,
          primaryColor: Colors.black
        ),
        
        child: BottomNavigationBar(
          onTap: onTapTapped,
          currentIndex: indexTap,
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
      ),
    );
  }

}