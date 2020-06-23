import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:rapisolver_flutter/Modelos/ServiceCategory.dart';

class ServiceCategoryService {

  static Future<List<ServiceCategory>> getServiceCategories( ) async {
    final resp= await   http.get('https://rapisolverprueba.herokuapp.com/api/servicecategories');
      List<ServiceCategory> servicecategories = (json.decode(resp.body) as List)
      .map((data) => ServiceCategory.fromJson(data))
      .toList();
     return servicecategories;

  }

  


}