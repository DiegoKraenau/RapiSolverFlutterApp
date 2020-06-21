
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:rapisolver_flutter/Modelos/User.dart';

class UsuerService{
  static Future<List<User>> getUsers() async {
     final resp= await http.get('http://rapisolverprueba.herokuapp.com/api/rapiusers');
     List<User> users = (json.decode(resp.body) as List)
      .map((data) => User.fromJson(data))
      .toList();
     return users;
  }
}