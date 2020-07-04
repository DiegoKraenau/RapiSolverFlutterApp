import 'package:flutter/material.dart';
import 'package:rapisolver_flutter/Animation/FadeAnimation.dart';
import 'package:rapisolver_flutter/Modelos/Servicios/SupplierService.dart';
import 'package:rapisolver_flutter/Modelos/Servicios/UserService.dart';
import 'package:rapisolver_flutter/Modelos/Supplier.dart';
import 'package:rapisolver_flutter/Modelos/User.dart';

class EditarPerfil extends StatefulWidget {
  final int userId;

  EditarPerfil(this.userId);

  @override
  _EditarPerfilState createState() => _EditarPerfilState(userId);
}

class _EditarPerfilState extends State<EditarPerfil> {
  int userId;
  User user;
  List<User> users = List();
  List<User> filtro = List();
  _EditarPerfilState(this.userId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("Editar Perfil", style: TextStyle(color: Colors.white)),
          backgroundColor: Color.fromRGBO(254, 209, 54, 1),
        ),
        body: Container(
          child: FutureBuilder(
              future: UsuerService.getUsers(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  users = snapshot.data;
                  filtro = users;
                  return _EditarPerfil(users);
                }
              }),
        ));
  }
}

class _EditarPerfil extends StatefulWidget {
  final List<User> users;

  _EditarPerfil(this.users);

  @override
  _EditarState createState() => _EditarState(users);
}

class _EditarState extends State<_EditarPerfil> {
  User user;
  String nombreCompleto = "";
  double separador = 50;
  List<User> users = List();
  List<User> filtro = List();

  var estilo = TextStyle(fontWeight: FontWeight.bold);

  _EditarState(this.users) {
    this.nombreCompleto = "";
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SizedBox(height: 20),
      FadeAnimation(
          1.6,
          Center(
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/user.png'),
                fit: BoxFit.fill,
              )),
            ),
          )),
      Padding(
          padding: EdgeInsets.all(5.0),
          child: new Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: new Column(
                  children: <Widget>[
                    FadeAnimation(
                      1.6,
                      Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.grey[400])),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(244, 244, 244, .9),
                                blurRadius: 20.0,
                                offset: Offset(0, 10),
                              )
                            ]),
                        child: TextField(
                          //  controller: correoCon,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Nombre:",
                              hintStyle: TextStyle(color: Colors.black)),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    FadeAnimation(
                      1.8,
                      Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.grey[400])),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(244, 244, 244, .9),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10))
                            ]),
                        child: TextField(
                          //  controller: contraCon,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Correo",
                              hintStyle: TextStyle(color: Colors.black)),
                          obscureText: true,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    FadeAnimation(
                      1.8,
                      Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.grey[400])),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(244, 244, 244, .9),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10))
                            ]),
                        child: TextField(
                          //  controller: contraCon,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Telefono",
                              hintStyle: TextStyle(color: Colors.black)),
                          obscureText: true,
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    FadeAnimation(
                        3.0,
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              RaisedButton(
                                color: Color.fromRGBO(254, 209, 54, 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                onPressed: () {},
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.save),
                                    SizedBox(width: 10),
                                    Text("Guardar")
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              ), //Container
            ],
          ))
    ]);
  }
}
