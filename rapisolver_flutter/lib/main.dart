
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
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: new Container(
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
                        InkWell(
                          onTap: () => Navigator.pushNamed(context, "/menu"), 
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