import 'dart:convert';

Customer customerFronJson(String str) => Customer.fromJson(json.decode(str));
String customerToJson(Customer data) => json.encode(data.toJson());

class Customer {
  int customerId;
  String name;
  String lastName;
  String email;
  String phone;
  String age;
  String genger;
  int usuarioId;
  int locationId;
  String userName;
  String country;

  Customer({
    this.customerId,
    this.name,
    this.lastName,
    this.email,
    this.phone,
    this.age,
    this.genger,
    this.usuarioId,
    this.locationId,
    this.userName,
    this.country,
  });

    factory Customer.fromJson(Map<String,dynamic> json) => Customer(
    customerId: json["customerId"],
    name: json["name"],
    lastName: json["lastName"],
    email: json["email"],
    phone: json["phone"],
    age: json["age"],
    genger: json["genger"],
    usuarioId: json["usuarioId"],
    locationId: json["locationId"],
    userName: json["userName"],
    country: json["country"],
  );

  Map<String,dynamic> toJson() => {
    "customerId": customerId,
    "name": name,
    "lastName": lastName,
    "email": email,
    "phone": phone,
    "age": age,
    "genger": genger,
    "usuarioId": usuarioId,
    "locationId": locationId,
    "userName": userName,
    "country": country,
  };
  
}