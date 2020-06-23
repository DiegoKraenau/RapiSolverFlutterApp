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

   static Future<ServiceDetail> getServiceDetailById(int id) async{
     final resp=await http.get('http://rapisolverprueba.herokuapp.com/api/servicedetails/'+id.toString());
     ServiceDetail sd=(json.decode(resp.body) as List)
                  .map((data) => ServiceDetail.fromJson(data))
                  .toList().first;
                  
     return sd;

   }

  static Future<bool> addServicieDetail(int supplierId, String serviceName, String cost, String categoryName, String description) async {
     final resp= await http.post('http://rapisolverprueba.herokuapp.com/api/servicedetails',
       headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "supplierId": supplierId,
        "serviceName": serviceName,
        "cost": cost,
        "categoryName": categoryName,
        "description":description
      }));
     
     if(resp.statusCode==200){
       return true;
     }else{
       return false;
     }
   }



}