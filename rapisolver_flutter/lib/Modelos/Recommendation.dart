import 'dart:convert';

Recommendation recommendationFromJson(String str) => Recommendation.fromJson(json.decode(str));

String recommendationToJson(Recommendation data) => json.encode(data.toJson());

class Recommendation {
    Recommendation({
        this.recommendationId,
        this.note,
        this.mark,
        this.supplierId,
        this.nameSupllier,
        this.lastNameSupllier,
        this.emailSupllier,
        this.usuarioId,
        this.userName,
    });

    int recommendationId;
    String note;
    int mark;
    int supplierId;
    String nameSupllier;
    String lastNameSupllier;
    String emailSupllier;
    int usuarioId;
    String userName;

    factory Recommendation.fromJson(Map<String, dynamic> json) => Recommendation(
        recommendationId: json["recommendationId"],
        note: json["note"],
        mark: json["mark"],
        supplierId: json["supplierId"],
        nameSupllier: json["nameSupllier"],
        lastNameSupllier: json["lastNameSupllier"],
        emailSupllier: json["emailSupllier"],
        usuarioId: json["usuarioId"],
        userName: json["userName"],
    );

    Map<String, dynamic> toJson() => {
        "recommendationId": recommendationId,
        "note": note,
        "mark": mark,
        "supplierId": supplierId,
        "nameSupllier": nameSupllier,
        "lastNameSupllier": lastNameSupllier,
        "emailSupllier": emailSupllier,
        "usuarioId": usuarioId,
        "userName": userName,
    };
}
