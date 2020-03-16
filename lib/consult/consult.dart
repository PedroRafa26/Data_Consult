import 'package:data_consult/database/ui/widgets/database_clients_list.dart';
import 'package:flutter/material.dart';

class Consult extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.blueGrey,
      child: DatabaseClientsList(),
    );
  }

}