

import 'package:application_1/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import '../../services/login/login_service.dart';
import 'login_screen.dart';

class CheckAuthScreen  extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: authService.readToken(),//el token almacenado
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            //preguntamos  si hay datos
            if(!snapshot.hasData)
                    return  CircularProgressIndicator(
                color: Colors.indigo,
              );
            if(snapshot.data==''){
              Future.microtask(() {
              Navigator.pushReplacement(context, PageRouteBuilder(
                  pageBuilder: (_, __, ___) => LoginScreen(),
                  transitionDuration: Duration(seconds: 0)
                  )
                ); 
              });
            }
            else{
               //Por si quieren mostrar homes diferentes dependiendo del rol                       
               Future.microtask(() async {
                 final idRol = await authService.readRol();
                 if(idRol == "1"){
                   Navigator.pushReplacement(context, PageRouteBuilder(
                    pageBuilder: (_, __, ___) => HomeScreen(),
                    transitionDuration: Duration(seconds: 0)
                    )
                  ); 
                 }
                 else{
                  Navigator.pushReplacement(context, PageRouteBuilder(
                    pageBuilder: (_, __, ___) => HomeScreen(),
                    transitionDuration: Duration(seconds: 0)
                    )
                  ); 
                 }   
               
              });
            }
             //la funcion que se ejecuta apenas el widget termine
            return Container();            
          },
          
          )
      ),
    );
  }
}