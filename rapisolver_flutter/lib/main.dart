
import 'package:async_loader/async_loader.dart';
import 'package:flutter/material.dart';
import 'package:rapisolver_flutter/Animation/FadeAnimation.dart';
import 'package:flutter/services.dart';
import 'package:rapisolver_flutter/menu.dart';

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
      '/menu':(context)=> Menu(),
    },
  )
  );
}



class HomePage extends StatelessWidget {
  

  final GlobalKey<AsyncLoaderState> _asyncLoaderState =
    new GlobalKey<AsyncLoaderState>();

  @override
  Widget build(BuildContext context) {
    

     var _asyncLoader = new AsyncLoader(
      key: _asyncLoaderState,
      initState: () async => await getMessage(),
      renderLoad: () => new CircularProgressIndicator(),
      renderError: ([error]) =>
          new Text('No se pudo cargar'),
      renderSuccess: ({data}) => new Text(data),
     );


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
                                offset: Offset(0,10)
                              )
                            ]
                          ),
                          child: TextField(
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
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Contraseña",
                              hintStyle: TextStyle(color: Colors.grey[400])
                            ),
                          ),
                        ),
                        ),
                        SizedBox(height: 30),
                        Center(
                          child: _asyncLoader,
                        ),
                        InkWell(
                          onTap: () => _asyncLoaderState.currentState
                                        .reloadState()
                                        .whenComplete(() => Navigator.pushNamed(context, "/menu")), 
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

const TIMEOUT = const Duration(seconds: 5);

getMessage() async {
  return new Future.delayed(TIMEOUT, () => '');
}