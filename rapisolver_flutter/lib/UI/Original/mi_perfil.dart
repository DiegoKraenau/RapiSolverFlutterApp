import 'package:flutter/material.dart';

class MiPerfil extends StatefulWidget {
  

  MiPerfil({Key key}) : super(key: key);

  @override
  _MiPerfilState createState() => _MiPerfilState();
}

class _MiPerfilState extends State<MiPerfil> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
       children: <Widget>[
         Center(
           child: Text("Eli y Andre"),
         )
       ],
    );
  }
}