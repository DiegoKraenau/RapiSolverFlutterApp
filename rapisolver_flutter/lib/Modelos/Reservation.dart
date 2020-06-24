import 'dart:convert';

Reservation recommendationFromJson(String str) => Reservation.fromJson(json.decode(str));

String recommendationToJson(Reservation data) => json.encode(data.toJson());


class Reservation {
  
  Reservation({
    this.reservationId,
    this.servicioId,
    this.servicioName,
    this.usuarioId,
    this.supplierId,
    this.supplierName,
    this.supplierLastName,
    this.fecha,
    this.note,
  });

  int reservationId;
  int servicioId;
  int usuarioId;
  int supplierId;
  String servicioName;
  String supplierName;
  String supplierLastName;
  String fecha;
  String note;


  factory Reservation.fromJson(Map<String, dynamic> json) => Reservation(
    reservationId: json["reservationId"],
    servicioId: json["servicioId"],
    servicioName: json["servicioName"],
    usuarioId: json["usuarioId"],
    supplierId: json["supplierId"],
    supplierName: json["supplierName"],
    supplierLastName: json["supplierLastName"],
    fecha: json["fecha"],
    note: json["note"],

  );


  Map<String, dynamic> toJson() => {
    "reservationId" : reservationId,
    "servicioId" : servicioId,
    "usuarioId" : usuarioId,
    "supplierId" : supplierId,
    "fecha" : fecha,
    "note" : note,

  };

}