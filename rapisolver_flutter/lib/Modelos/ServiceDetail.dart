// To parse this JSON data, do
//
//     final serviceDetail = serviceDetailFromJson(jsonString);

import 'dart:convert';

ServiceDetail serviceDetailFromJson(String str) => ServiceDetail.fromJson(json.decode(str));

String serviceDetailToJson(ServiceDetail data) => json.encode(data.toJson());

class ServiceDetail {
    int serviceDetailsId;
    int supplierId;
    int servicioId;
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
    String serviceName;
    String description;
    String cost;
    int serviceCategoryId;
    String categoryName;

    ServiceDetail({
        this.serviceDetailsId,
        this.supplierId,
        this.servicioId,
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
        this.serviceName,
        this.description,
        this.cost,
        this.serviceCategoryId,
        this.categoryName,
    });

    

    factory ServiceDetail.fromJson(Map<String, dynamic> json) => ServiceDetail(
        serviceDetailsId: json["serviceDetailsId"],
        supplierId: json["supplierId"],
        servicioId: json["servicioId"],
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
        serviceName: json["serviceName"],
        description: json["description"],
        cost: json["cost"],
        serviceCategoryId: json["serviceCategoryId"],
        categoryName: json["categoryName"],
    );

    Map<String, dynamic> toJson() => {
        "serviceDetailsId": serviceDetailsId,
        "supplierId": supplierId,
        "servicioId": servicioId,
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
        "serviceName": serviceName,
        "description": description,
        "cost": cost,
        "serviceCategoryId": serviceCategoryId,
        "categoryName": categoryName,
    };
}
