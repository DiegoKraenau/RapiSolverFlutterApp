import 'package:flutter/material.dart';
import 'package:rapisolver_flutter/Modelos/Reservation.dart';
import 'package:rapisolver_flutter/Modelos/Servicios/ReservationService.dart';
import 'package:rapisolver_flutter/Utiles/global.dart' as global;


class ReservasScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ReservationService.getReservetations(global.idUser),
        builder: (BuildContext context ,AsyncSnapshot<List<Reservation>> snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }else{
            return ListView(
              children: _cargarReservas(snapshot.data),
            );
          }
        },
      );
  }

  List<Widget> _cargarReservas(List<Reservation> lista) {
    final List<Widget> reservas = [];

    lista.forEach((element) {
      final cards = Card(
        child: Column(
          children:<Widget>[
            Text("Servicio: ${element.servicioName}"),
            Text("Proveedor: ${element.supplierName} ${element.supplierLastName}"),
            Text("Fecha: ${element.fecha}")
          ],
        ),
      );

      reservas.add(cards);
    });

    return reservas;
  }
}