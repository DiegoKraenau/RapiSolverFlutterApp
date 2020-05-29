import 'dart:convert';

Supplier supplierFronJson(String str) => Supplier.fromJson(json.decode(str));
String supplierToJson(Supplier data) => json.encode(data.toJson());


class Supplier{

  int supplierId;
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

  Supplier({
    this.supplierId,
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

  factory Supplier.fromJson(Map<String,dynamic> json) => Supplier(
    supplierId: json["supplierId"],
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
    "supplierId": supplierId,
    "name": name,
    "lastName": lastName,
    "email": email,
    "phone": phone,
    "age": age,
    "genger": genger,
    "usuarioId": usuarioId,
    "userName": userName,
    "country": country,


  };
  


}