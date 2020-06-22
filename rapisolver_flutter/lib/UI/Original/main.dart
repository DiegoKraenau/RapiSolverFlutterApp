
import 'package:flutter/material.dart';
import 'package:rapisolver_flutter/Animation/FadeAnimation.dart';
import 'package:flutter/services.dart';
import 'package:rapisolver_flutter/Modelos/Servicios/UserService.dart';
import 'package:rapisolver_flutter/Modelos/User.dart';
import 'package:rapisolver_flutter/UI/Original/app.dart';
import 'package:rapisolver_flutter/UI/Original/splash.dart';
import 'package:toast/toast.dart' ;
import 'package:rapisolver_flutter/Utiles/global.dart' as global;



void main(){
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light
  ));
   
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    initialRoute: "/",
    routes: {
      '/menu':(context)=> App(),
      '/splash':(context)=> SplashPage(),
    },
  )
  );

}



class HomePage extends StatelessWidget {
  
  /*
  final GlobalKey<AsyncLoaderState> _asyncLoaderState =
    new GlobalKey<AsyncLoaderState>();
    */
  final idUser = 0;

  @override
  Widget build(BuildContext context) {
    
    /*
     var _asyncLoader = new AsyncLoader(
      key: _asyncLoaderState,
      initState: () async => await getMessage(),
      renderLoad: () => new CircularProgressIndicator(),
      renderError: ([error]) =>
          new Text('No se pudo cargar'),
      renderSuccess: ({data}) => new Text(data),
     );
    */

    var correo;
    var contra;
    

    final correoCon=new TextEditingController();
    final contraCon=new TextEditingController();

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body:
       new Container(
        child: new Column(
          children: <Widget>[
            FadeAnimation(1.6,Container(
              height: 400,
              decoration: BoxDecoration(
                 image: DecorationImage(
                   image: AssetImage('assets/images/fondonuevo.png'),
                   fit:BoxFit.fill
                 )
              ),
            ),
            ),
            Padding(
              padding:  EdgeInsets.all(5.0),
              child: new Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: new Column(
                      children: <Widget>[
                        FadeAnimation(1.6,Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color: Colors.grey[400])),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(244, 244, 244, .9),
                                blurRadius: 20.0,
                                offset: Offset(0,10),
                              )
                            ]
                          ),
                          child: TextField(
                            controller: correoCon,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Email",
                              hintStyle: TextStyle(color: Colors.grey[400])
                            ),
                          ),
                        ),
                        ),
                        SizedBox(height: 20),
                        FadeAnimation(1.8,Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color: Colors.grey[400])),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(244, 244, 244, .9),
                                blurRadius: 20.0,
                                offset: Offset(0,10)
                              )
                            ]
                          ),
                          child: TextField(
                            controller: contraCon,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Contraseña",
                              hintStyle: TextStyle(color: Colors.grey[400])
                            ),
                            obscureText: true,
                          ),
                        ),
                        ),
                        SizedBox(height: 30),
                        InkWell(
                          onTap: () => {
                           // Navigator.pushNamed(context, "/splash"),
                            correo=correoCon.text,
                            contra=contraCon.text,
                            verificarCorreo(correo,contra,context),
 
                          }, 
                          child:FadeAnimation(2.0,Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromRGBO(254, 209, 54, 1)
                          ),
                          child: Center(
                            child: Text("Ingresar",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold))
                          )
                        )
                        )
                       ),
                       SizedBox(height: 70),
                       FadeAnimation(2.2,Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: <Widget>[
                           Text("¿Aún no te registras?"),
                           Text("Registrate.",style: TextStyle(color: Colors.blueAccent),)
                         ],
                       )
                       )
                      ],
                    )
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


/*
const TIMEOUT = const Duration(seconds: 5);

getMessage() async {
  return new Future.delayed(TIMEOUT, () => '');
}
*/

Future<void> verificarCorreo(String correo,String contra,BuildContext context)async {
  
  Navigator.pushNamed(context, "/splash");
  
  List<User> listaUsuarios=List<User>();
  User usuario=null;

  UsuerService.getUsers()
              .then((value) =>{
                //Obtienes la lista
                listaUsuarios=value,
                //Recorres la lista
                listaUsuarios.forEach((element) {
                  if(element.userName==correo && element.userPassword==contra){
                    usuario=element;
                  }
                }),
                //Verificas
                if(usuario!=null){
                  global.idUser=usuario.usuarioId,
                  //print(global.idUser),
                  Navigator.pushNamed(context, "/menu")
   
                }else{
                  Toast.show("Usuario incorrecto", context,duration: Toast.LENGTH_SHORT,gravity: Toast.BOTTOM),
                  Navigator.pushNamed(context, "/")
                }
              }    
              ).catchError(
                ()=>print("No se puede conectar.")
              );
              

  
}