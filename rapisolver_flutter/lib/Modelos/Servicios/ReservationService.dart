import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rapisolver_flutter/Modelos/Reservation.dart';


class ReservationService {

  static Future<bool> addReservation(int servicioId, int usuarioId, int supplierId, String fecha, String note) async {
    final resp = await http.post('http://rapisolverprueba.herokuapp.com/api/reservations',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
      body: jsonEncode({
        'servicioId': servicioId,
        'usuarioId': usuarioId,
        'supplierId': supplierId,
        'fecha': fecha,
        'note': note
      }));

      if(resp.statusCode == 200){
        return true;

      }else{
        return false;
      }
  }

  static Future<List<Reservation>> getReservetations(int userId) async {
    final resp = await http.get("http://rapisolverprueba.herokuapp.com/api/reservations/user/"+userId.toString());
       if(resp.statusCode == 200) {
           return (json.decode(resp.body) as List).map((data) => Reservation.fromJson(data)).toList();
      }else {
        return [];
      }
  }
}