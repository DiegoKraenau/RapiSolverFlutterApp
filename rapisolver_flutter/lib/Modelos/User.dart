//https://quicktype.io

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());



class User {
    User({
        this.usuarioId,
        this.userName,
        this.userPassword,
        this.rolId,
    });

    int usuarioId;
    String userName;
    String userPassword;
    int rolId;

    factory User.fromJson(Map<String, dynamic> json) => User(
        usuarioId: json["usuarioId"],
        userName: json["userName"],
        userPassword: json["userPassword"],
        rolId: json["rolId"],
    );

    Map<String, dynamic> toJson() => {
        "usuarioId": usuarioId,
        "userName": userName,
        "userPassword": userPassword,
        "rolId": rolId,
    };
}
