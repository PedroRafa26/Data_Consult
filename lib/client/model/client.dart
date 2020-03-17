import 'package:data_consult/poliza/model/poliza.dart';
import 'package:flutter/material.dart';

class Client {

  final String id;
  final String name;
  final String lastName;
  final DateTime dateBirth;
  final String addres;
  final List<Poliza> polizas;
  final String cellphone;
  final String emailClient;


  Client({
    @required this.id,
    @required this.name,
    @required this.lastName,
    this.dateBirth,
    this.addres,
    this.polizas,
    @required this.cellphone,
    this.emailClient, 
    
  });

}