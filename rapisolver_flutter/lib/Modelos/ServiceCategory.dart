

import 'dart:convert';

ServiceCategory serviceCategoryFromJson(String str) => ServiceCategory.fromJson(json.decode(str));

String serviceCategoryToJson(ServiceCategory data) => json.encode(data.toJson());

class ServiceCategory {
    ServiceCategory({
        this.serviceCategoryId,
        this.categoryName,
        this.categoryDescription,
        this.servicios,
    });

    int serviceCategoryId;
    String categoryName;
    String categoryDescription;
    dynamic servicios;

    factory ServiceCategory.fromJson(Map<String, dynamic> json) => ServiceCategory(
        serviceCategoryId: json["serviceCategoryId"],
        categoryName: json["categoryName"],
        categoryDescription: json["categoryDescription"],
        servicios: json["servicios"],
    );

    Map<String, dynamic> toJson() => {
        "serviceCategoryId": serviceCategoryId,
        "categoryName": categoryName,
        "categoryDescription": categoryDescription,
        "servicios": servicios,
    };
}
