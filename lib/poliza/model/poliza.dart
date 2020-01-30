import 'dart:ffi';

import 'package:flutter/material.dart';

class Poliza {

  final String id;
  final DateTime vigencia;
  final String company;
  final String ramo;
  final Double prima;
  final String clientId;
  Poliza polizaOwner;


  Poliza({
    Key key,

    @required this.id, 
    @required this.vigencia, 
    @required this.company, 
    this.ramo, 
    @required this.prima,     
    @required this.clientId,
    @required this.polizaOwner
  });

}