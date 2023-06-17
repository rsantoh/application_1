

// ignore_for_file: prefer_const_constructors, use_build_context_synchronously


import 'package:application_1/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import '../../providers/login_form_provider.dart';
import '../../services/login/login_service.dart';
import '../../ui/input_decorations.dart';
import '../../widgets/login/auth_background.dart';
import '../../widgets/login/card_container.dart';




class LoginScreen extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        //Me permite hacer scrooll si los hijos sobrepasan el tamaño de la pantalla
        child: SingleChildScrollView(
          child: Column(
            children:[
             //Poner espacio para que los hijos parezcan unpñoco más abajo
             SizedBox(height: 250),
             CardContainer(
               child: Column(
                 children: [
                   SizedBox(height: 10),
                   Text('logIn', style:  TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold ), ),
                   SizedBox(height: 30),

                  //Crea instancia de loginFormPovider que puede redibujar cuando sea necesario y solo funcionara en login form
                   ChangeNotifierProvider(
                     create: (_) => LoginFormProvider(),
                     child: _LoginForm(),
                   ),
                   

                 ],
               )
             ),
             SizedBox(height: 50),             

             SizedBox(height: 50),
            ]
          )

        )
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    //con este login form ahora tengo acceso a todo lo que esta clase me ofrece
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Container(
      
      child: Form(//Hace una referencia al widget interno
      
        key: loginForm.formKey,

       

        child: Column(
          children:[
            TextFormField(
               autovalidateMode: AutovalidateMode.onUserInteraction,
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255)
              ),
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,//para poner teclado con @
              decoration: InputDecorations.authInputDecoration(
                hintText: 'user',
                labelText: 'user',
                prefixIcon: Icons.perm_identity,    
                          
                
              ),//Consumimos el imput
              //Asignar valores a los providers
              onChanged: (value) => loginForm.email = value,
              validator: (value) {
                  
                  return (value != null && value.length >= 3) //siempre se ejecuta la primer condicion value != null y si se cumple se ejecuta value.length >= 6
                  ? null
                  : 'error';                    
                  
              },
            ),
            
            SizedBox(height: 30,),

             TextFormField(
               
               style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255)
              ),
               autovalidateMode: AutovalidateMode.onUserInteraction,
              autocorrect: false,
              obscureText: true,//para que la persona no pueda ver lo que escribe
              keyboardType: TextInputType.emailAddress,//para poner teclado con @
              decoration: InputDecorations.authInputDecoration(
                hintText: 'password',
                labelText: 'password',
                prefixIcon: Icons.lock_outline,
                
              ),//Consumimos el imput
              //Asignar valores a los providers
              onChanged: (value) {
                loginForm.password = value;
                loginForm.isLoading = false;

              } ,
               validator: (value) {
                 return (value != null && value.length >= 5) //siempre se ejecuta la primer condicion value != null y si se cumple se ejecuta value.length >= 6
                  ? null
                  : 'error';   
              },
            ),
            SizedBox(height: 30,),

           

            SizedBox(height: 30,),

            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              disabledColor: Color.fromARGB(255, 191, 185, 185),
              elevation: 0,
              color: Color.fromARGB(255, 11, 11, 11),
              //botón
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: Text(    
                                
                  loginForm.isLoading
                    ? 'Login'
                    : 'Login',
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))
                )
              ),
              //para desactivar el botón, si esta cargando regreso un null
              //si esta cargando regreso un null, caso contrario la funcion
              onPressed: loginForm.isLoading ? null : () async {
                //Para quitar el teclado
                FocusScope.of(context).unfocus();     
                  final authService = Provider.of<AuthService>(context, listen: false);          
                // final String? user = await authService.singIn(loginForm.email, loginForm.password);
                if(loginForm.isValidForm())
                {
                  EasyLoading.show(status: 'Cargando..');
                  loginForm.isLoading = true;   

                  final String? id = await authService.singIn(loginForm.email, loginForm.password);
                  print(id);
                  
                  if(id != null ){
                    // ignore: unnecessary_nullable_for_final_variable_declarations
                    final String? rol = await authService.readRol();                   
                    EasyLoading.dismiss();   
                     if(rol == '1'){                       
                      Navigator.pushReplacement(context, PageRouteBuilder(
                        pageBuilder: (_, __, ___) => HomeScreen(),
                        transitionDuration: Duration(seconds: 0)
                        )
                      );                        
                     }
                     else{                       
                        Navigator.pushReplacementNamed(context, 'login');
                         EasyLoading.showError('Perfil sin configurar');    
                        
                     }
                      loginForm.isLoading = false; 
                  }
                  else
                  {
                     EasyLoading.showError('Error');
                     loginForm.isLoading = false;    
                  }                                               
                }
                else
                {
                  EasyLoading.showError('Error');
                  return;
                }
              }
              
            )
          ]
          
        )
        ),
    );
  }
}