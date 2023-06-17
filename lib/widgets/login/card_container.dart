// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
 
  final Widget child;

  const CardContainer({
    Key? key, 
    required this.child
    }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),//para que nada quede tan pegado a los bordes
        decoration: _createCardShape(),
        child: child,
      ),
    );
  }

  BoxDecoration _createCardShape() {
    return BoxDecoration(
      color: Color.fromARGB(255, 133, 136, 139),
      borderRadius: BorderRadius.circular(25),//redondea las esquinas
      // ignore: prefer_const_literals_to_create_immutables
      boxShadow: [
        const BoxShadow(
          color: Colors.black38,//color de la sombra
          blurRadius: 15,//que tanto quiero expandir el blur
          offset: const Offset(0,5),//Posición a la que quiero mover la sombra
        )
      ]

    );
  }
}