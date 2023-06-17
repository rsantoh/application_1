import 'package:flutter/material.dart';
//ChangeNotifier va permitinos que la clase sea puesta en un multiprovider o un checkprovider
class LoginFormProvider extends ChangeNotifier{

  //para conectar los valores del login con esta clase
  //si stroy dentro de un form es FormState y si es scaffold ScafoldState etc
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String email = '';
  String password = '';
  //Para cuando esta cargando la petición http
  bool _isLoading = true;
  bool get isLoading => _isLoading;
  //cuando le establezca un nuevo valor al isloading, va ha notificarse a los widgets que estan escuchando los cambios
  set isLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm(){//regresa un true si el formulario es valido
    //para saber si el formulario es valido
    print(formKey.currentState?.validate());
    print('$email - $password');
    notifyListeners();
    return formKey.currentState?.validate() ?? false;
  }

   bool _terminos = true;
  bool get terminos => _terminos;
  set terminos(bool value){
    if(email.length>3 && password.length>3){
       if(value){
          _isLoading = false;
        }
        else{
          _isLoading = true;
        }
    }
    _terminos = value;
   
    notifyListeners();
  }

}