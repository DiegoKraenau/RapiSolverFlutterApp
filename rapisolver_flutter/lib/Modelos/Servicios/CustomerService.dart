import 'dart:convert';

import 'package:http/http.dart' as http;
import '../Customer.dart';


class CustomerService {
  static Future<Customer> getCustomerByUserId(int userId) async {
    final resp = await http.get('http://rapisolverprueba.herokuapp.com/api/customers/'+userId.toString());
    Customer customer = (json.decode(resp.body) as List).map((e) => Customer.fromJson(e)).toList().first;
    return customer;
  }
}