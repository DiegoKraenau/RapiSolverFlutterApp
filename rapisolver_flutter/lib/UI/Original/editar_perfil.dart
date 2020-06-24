import 'package:flutter/material.dart';
import 'package:rapisolver_flutter/Animation/FadeAnimation.dart';

class EditarPerfil extends StatefulWidget {

  final int userId;
  
  EditarPerfil(this.userId);

  @override
  _EditarPerfilState createState() => _EditarPerfilState();
}

class _EditarPerfilState extends State<EditarPerfil> {


@override
  Widget build(BuildContext context) {
       return Column(
        children: <Widget>[
          SizedBox(height: 20),
          FadeAnimation(1.6, Center(
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/user.png'),
                  fit:BoxFit.fill,
                )
              ),
            ),
          )),
         
         
        
        SizedBox(height: 40),
          FadeAnimation(3.0, Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  color: Color.fromRGBO(254, 209, 54, 1),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  onPressed: (){},
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.create),
                      SizedBox(width: 10),
                      Text("Guardar")
                    ],
                  ),
                ),
              
              ],
            ),
          ))
        ]
       );
       
  }
}