import 'package:flutter/material.dart';

class BuscarProveedor extends StatefulWidget {
  BuscarProveedor({Key key}) : super(key: key);

  @override
  _BuscarProveedorState createState() => _BuscarProveedorState();
}

class _BuscarProveedorState extends State<BuscarProveedor> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
       children: <Widget>[
         Center(
           child: Text("Luis"),
         )
       ],
    );
  }
}