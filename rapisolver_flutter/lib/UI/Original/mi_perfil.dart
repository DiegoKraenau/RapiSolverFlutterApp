import 'package:flutter/material.dart';
import 'package:rapisolver_flutter/Modelos/Servicios/UserService.dart';
import 'package:rapisolver_flutter/Modelos/User.dart';

import '../../Animation/FadeAnimation.dart';
import '../../Modelos/Servicios/CustomerService.dart';
import '../../Modelos/Servicios/SupplierService.dart';
import 'package:rapisolver_flutter/Modelos/Supplier.dart';
import 'package:rapisolver_flutter/Modelos/Customer.dart';
import 'editar_perfil.dart';

class MiPerfil extends StatefulWidget {
  final int userId;

  MiPerfil(this.userId);
  @override
  _MiPerfilState createState() => _MiPerfilState(this.userId);
}

class _MiPerfilState extends State<MiPerfil> {
  int userId;
  User usuario;
  _MiPerfilState(this.userId);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: FutureBuilder(
        future: UsuerService.getUserById(userId),
        builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            usuario = snapshot.data;
            return _MiPerfil(usuario);
          }
        },
      ),
    );
  }
}

class _MiPerfil extends StatefulWidget {
  final usuario;

  _MiPerfil(this.usuario);

  @override
  __MiPerfilState createState() => __MiPerfilState(usuario);
}

class __MiPerfilState extends State<_MiPerfil> {
  User usuario;

  __MiPerfilState(this.usuario);

  @override
  Widget build(BuildContext context) {
    if (usuario.rolId == 2) {
      return FutureBuilder(
        future: SupplierService.getSupplierById(usuario.usuarioId),
        builder: (context, AsyncSnapshot<Supplier> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return _cargarDatos(
                "${snapshot.data.name} ${snapshot.data.lastName}",
                "${snapshot.data.email}",
                "${snapshot.data.phone}",
                "${snapshot.data.country}",
                "Proveedor");
          }
        },
      );
    } else {
      return FutureBuilder(
        future: CustomerService.getCustomerByUserId(usuario.usuarioId),
        builder: (context, AsyncSnapshot<Customer> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return _cargarDatos(
                "${snapshot.data.name} ${snapshot.data.lastName}",
                "${snapshot.data.email}",
                "${snapshot.data.phone}",
                "${snapshot.data.country}",
                "Cliente");
          }
        },
      );
    }
  }

  Widget _cargarDatos(String nombreCompleto, String email, String phone,
      String country, String rol) {
    final separador = 50.0;
    final estilo = TextStyle(fontWeight: FontWeight.bold);
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
      SizedBox(height: 20),
      FadeAnimation(
          1.8,
          Center(
            child: Text(nombreCompleto, style: estilo),
          )),
      SizedBox(height: 20),
      FadeAnimation(
          2.0,
          Center(
            child: Row(
              children: <Widget>[
                SizedBox(width: separador),
                Text("Correo: "),
                SizedBox(width: separador),
                Text(email, style: estilo)
              ],
            ),
          )),
      SizedBox(height: 20),
      FadeAnimation(
          2.0,
          Center(
            child: Row(
              children: <Widget>[
                SizedBox(width: separador),
                Text("Celular: "),
                SizedBox(width: separador),
                Text(phone, style: estilo)
              ],
            ),
          )),
      SizedBox(height: 20),
      FadeAnimation(
          2.0,
          Center(
            child: Row(
              children: <Widget>[
                SizedBox(width: separador + 20),
                Text("Pais: "),
                SizedBox(width: separador),
<<<<<<< HEAD
                Text("    ${customer.country}",style: estilo)
=======
                Text(country, style: estilo)
>>>>>>> fa87fca46a8fa441d079a9ac88e651610a0ad2ad
              ],
            ),
          )),
      SizedBox(height: 20),
      FadeAnimation(
          2.0,
          Center(
            child: Row(
              children: <Widget>[
                SizedBox(width: separador + 30),
                Text("Rol: "),
                SizedBox(width: separador),
                Text(rol, style: estilo)
              ],
            ),
          )),
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
                  onPressed: () {
                    print(1);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditarPerfil(1)));
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.create),
                      SizedBox(width: 10),
                      Text("Editar")
                    ],
                  ),
                ),
              ],
            ),
          ))
    ]);
  }
}
