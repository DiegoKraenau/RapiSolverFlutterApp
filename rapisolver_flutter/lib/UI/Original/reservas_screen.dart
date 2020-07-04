import 'package:flutter/material.dart';
import 'package:rapisolver_flutter/Modelos/Reservation.dart';
import 'package:rapisolver_flutter/Modelos/Servicios/ReservationService.dart';
import 'package:rapisolver_flutter/Utiles/global.dart' as global;

import '../../Modelos/Reservation.dart';
import '../../Modelos/Servicios/ReservationService.dart';

class ReservasScreen extends StatefulWidget {
  @override
  _ReservasScreenState createState() => _ReservasScreenState();
}

class _ReservasScreenState extends State<ReservasScreen> {
  List<Reservation> reservas;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ReservationService.getReservetations(global.idUser),
      builder:
          (BuildContext context, AsyncSnapshot<List<Reservation>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
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
        elevation: 14,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text(
                "\n${element.servicioName}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                  "Proveedor: ${element.supplierName} ${element.supplierLastName}\nFecha: ${element.fecha}\nNota: ${element.note}"),
            ),
            ButtonBar(children: <Widget>[
              FlatButton(
                child: Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    ReservationService.delete(element.reservationId);
                  });
                },
              ),
            ])
          ],
        ),
      );
      reservas.add(cards);
    });

    return reservas;
  }
}
