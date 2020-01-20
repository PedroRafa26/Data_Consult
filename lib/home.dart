import 'package:flutter/material.dart';
import 'package:data_consult/add/add.dart';
import 'package:data_consult/consult/consult.dart';
import 'package:data_consult/database/database.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Home();
  }
  
}

class _Home extends State<Home>{

  int indexTap=0;
  final List<Widget> widgetsMenu = [
    Add(),
    Database(),
    Consult()
  ];

  void onTapTapped(int index) {

      setState(() { //controla el estado del widget
        indexTap = index;     
      });
    }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: widgetsMenu[indexTap],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
          primaryColor: Colors.lightBlueAccent
        ),
        child: BottomNavigationBar(
          onTap: onTapTapped,
          currentIndex: indexTap,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              title: Text("Add")
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              title: Text("Database")
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.loupe),
              title: Text("Consult")
            ),
          ],
        ),
      ),
    );
  }

}