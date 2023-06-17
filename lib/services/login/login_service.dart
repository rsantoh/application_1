import 'dart:convert';


import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';


class AuthService extends ChangeNotifier{

  final storage = new FlutterSecureStorage();
 
  bool isLoading = true; 
  
  // AuthService() {
  //   this.selectRole();    
  // }

  Future<String?> singIn(String email, String password) async {
    try {
      //TODO: EJEMPLO DE COMO SE CONSUME UN API GET, ESTA COMENTADO
    
      //  var request = http.Request('GET', Uri.parse('http://direcciondeapiallamar.com/api/Usuarios?user='+email));   
      // EasyLoading.show(status: '');
      // http.StreamedResponse response = await request.send();
      // if (response.statusCode == 200) {
       //Asi se almacena una dato en flutter secure storage
       storage.write(key: 'idPersona', value: '1111'); 
       storage.write(key: 'idRol', value: '1'); 
           
      // }
      // else {
      //   EasyLoading.dismiss();
      //   return null;
      // }   
      //TODO: ASI SE RETORNA UN VALOR DE LAS VARIABLES GUARDADAS EN SECURE STORAGE
       return await storage.read(key: 'idPersona') ?? '';
    } catch (e) {
      EasyLoading.showError('Error HTTP:500');

    }
   
   
  }

  Future<String> readToken() async{
      return await storage.read(key: 'token') ?? '';
  }

  Future<String> readRol() async{    
      return await storage.read(key: 'idRol') ?? '';
  }

  Future<String> cantLoad() async{    
      return await storage.read(key: 'cantidad') ?? '';
  }

  

   Future<String> saveVariables(String idColegio, String idPersona, String nombreColegio, String idRol, String nombreRol) async{    

      storage.write(key: 'idColegio', value: idColegio);
      storage.write(key: 'idPersona', value: idPersona);
      storage.write(key: 'nombreColegio', value: nombreColegio);
      storage.write(key: 'idRol', value: idRol);
      storage.write(key: 'nombreRol', value: nombreRol);
      return await storage.read(key: 'idRol') ?? '';
  }

    Future<String> nombreRol() async{    
      return await storage.read(key: 'nombreRol') ?? '';
   }

    Future<String> nombreColegio() async{    
      return await storage.read(key: 'nombreColegio') ?? '';
   }
}



