import 'dart:convert';

Service serviceFromJson(String str) => Service.fromJson(json.decode(str));

String serviceToJson(Service data) => json.encode(data.toJson());

class Service {
    Service({
        this.servicioId,
        this.name,
        this.description,
        this.cost,
        this.serviceCategoryId,
        this.categoryName,
    });

    int servicioId;
    String name;
    String description;
    String cost;
    int serviceCategoryId;
    String categoryName;

    factory Service.fromJson(Map<String, dynamic> json) => Service(
        servicioId: json["servicioId"],
        name: json["name"],
        description: json["description"],
        cost: json["cost"],
        serviceCategoryId: json["serviceCategoryId"],
        categoryName: json["categoryName"],
    );

    Map<String, dynamic> toJson() => {
        "servicioId": servicioId,
        "name": name,
        "description": description,
        "cost": cost,
        "serviceCategoryId": serviceCategoryId,
        "categoryName": categoryName,
    };
}
