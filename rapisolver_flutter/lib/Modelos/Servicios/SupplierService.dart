import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rapisolver_flutter/Modelos/Supplier.dart';

class SupplierService {
  static Future<List<Supplier>> getSuppliers() async {
    final resp= await   http.get('https://rapisolverprueba.herokuapp.com/api/suppliers');
     List<Supplier> suppliers = (json.decode(resp.body) as List)
      .map((data) => Supplier.fromJson(data))
      .toList();
     return suppliers;
  }

  static Future<Supplier> getSupplierById(int userId) async{
    final resp=await http.get('http://rapisolverprueba.herokuapp.com/api/suppliers/'+userId.toString());
    Supplier supplier=(json.decode(resp.body) as List)
                    .map((data) => Supplier.fromJson(data))
                    .toList().first;
    return supplier;
  }
}