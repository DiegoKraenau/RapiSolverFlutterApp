import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rapisolver_flutter/Modelos/ServiceDetail.dart';

class ServiceDetailsService {

   static Future<List<ServiceDetail>> getServiceDetails() async {
     final resp= await http.get('https://rapisolverprueba.herokuapp.com/api/servicedetails');
     List<ServiceDetail> servicesDetails = (json.decode(resp.body) as List)
      .map((data) => ServiceDetail.fromJson(data))
      .toList();
     return servicesDetails;
   }

}