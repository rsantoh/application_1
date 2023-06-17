// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class InputDecorations{

  static InputDecoration authInputDecoration({
    //Argumentos que reciben
    required String hintText,
     required String labelText,
     IconData? prefixIcon

  }){
    return InputDecoration(
         errorStyle: TextStyle(color: Color.fromARGB(255, 28, 29, 29)),
         errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: const BorderSide(
                      width: 1,
                      color: Color.fromARGB(255, 38, 40, 40),
                    )),
                    focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(
                    width: 1,
                    color: Color.fromARGB(255, 61, 62, 62),
                  ),
                ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 0, 0, 0)
          )
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 0, 0, 0),
            width: 2
          )
        ),
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(
          color: Color.fromARGB(255, 0, 0, 0)
        ),
        prefixIcon: prefixIcon != null
        ? Icon(prefixIcon, color: Color.fromARGB(255, 255, 255, 255), )
        : null
    );
  }
}