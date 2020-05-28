import 'package:flutter/material.dart';

class DetalleServicio extends StatefulWidget {
  final int serviceDetailId;

  DetalleServicio(this.serviceDetailId);

  @override
  _DetalleServicioState createState() => _DetalleServicioState(serviceDetailId);
}

class _DetalleServicioState extends State<DetalleServicio> {


  int serviceDetailId;

  _DetalleServicioState(this.serviceDetailId);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Detalle"),
       ),
       body: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: <Widget>[
           Center(
             child: Text(serviceDetailId.toString()),
           )
         ],
       ),
    );
  }
}