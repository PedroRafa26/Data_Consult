import 'package:flutter/material.dart';

class TextInput extends StatelessWidget{
  
  //pista o ayuda para el llando de los datos
  final String hintText;
  //definicion del tipo de texto esperado, single line o multi line
  final TextInputType inputType;
  //controlador de los datos ingresados
  final TextEditingController controller; 
  int maxLines=1;
  
  TextInput({
    Key key,
    @required this.hintText,
    @required this.inputType,
    @required this.controller,
    this.maxLines
  });

  @override
  Widget build(BuildContext context) {
 
    return Container(
      padding: EdgeInsets.all(10.0),
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        maxLines: maxLines,
        style: TextStyle(
          fontSize: 15.0,
          color: Colors.blueGrey,
          fontWeight: FontWeight.bold
        ),
        decoration: InputDecoration(
          filled:true,
          fillColor: Color(0xFFe5e5e5),
          border: InputBorder.none,
          hintText: hintText,

          //estilo cuando esta disponible
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFe5e5e5)),
            borderRadius: BorderRadius.all(Radius.circular(9.0))
          ),
          //estilo cuando esta siendo seleccionado
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFe5e5e5)),
            borderRadius: BorderRadius.all(Radius.circular(9.0))
          ),
        ),
      ),

    );
  
  }


  
}