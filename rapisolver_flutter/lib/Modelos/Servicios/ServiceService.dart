import 'dart:convert';

import 'package:rapisolver_flutter/Modelos/Service.dart';
import 'package:http/http.dart' as http;

class ServiceService{
   static Future<List<Service>> getServicesByUserId(int userId) async {
     final resp= await http.get('http://rapisolverprueba.herokuapp.com/api/rapiservices/user/'+userId.toString());
     List<Service> servicios = (json.decode(resp.body) as List)
      .map((data) => Service.fromJson(data))
      .toList();
     return servicios;
   }
}