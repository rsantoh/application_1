import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {

  final Widget child;

  const AuthBackground({
    Key? key, 
  required this.child
  }) ;

  @override
  Widget build(BuildContext context) {
    return Container(
       //color : Colors.red,
        width : double.infinity,
        height: double.infinity, 
        //El stak es una columna pero pone widgets uno dentro de otro como si fueran cartas    
        child: Stack(
          children: [
            _PurpleBox(),

            _HeaderIcon(),

            this.child,

          ],
        ),
      
    );
  }
}

class _HeaderIcon extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        
        child: Container(
        width: double.infinity,
        height: 120,
        margin: EdgeInsets.only(top: 30),
      //  child: Icon(Icons.settings_input_svideo_outlined, color:Colors.white, size: 100),
        child: Image(
          image: AssetImage('assets/logo.png'),
          fit: BoxFit.cover,
        )
                       
      ),
    );
  }
}

class _PurpleBox extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;//obtener el tamaño de la pantalla
    return Container(
      width: double.infinity,
      height: size.height*0.4,//el 40% de la pantalla      
      decoration: _purpleBackground(),
      child: Stack(//Para poner widgets sobre otros
        children: [

         
         
        ],
      ),
    );
  }

  BoxDecoration _purpleBackground() {
    return BoxDecoration(
      //Metodo en el cual se pone lo del 40%
      gradient: LinearGradient(//gradiente
        colors: [
          Color.fromARGB(0, 65, 160, 237),
            // Color.fromARGB(155, 47, 69, 102),
          Color.fromARGB(0, 163, 165, 167)
        ]
      )
    );
  }
}

class _Bubble extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Color.fromARGB(23, 225, 219, 219)
      ),
    );
    
  }
}