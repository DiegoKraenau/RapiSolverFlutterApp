import 'package:flutter/material.dart';
import 'package:rapisolver_flutter/UI/Original/buscar_proveedor.dart';
import 'package:rapisolver_flutter/UI/Original/buscar_servicio.dart';
import 'package:rapisolver_flutter/UI/Original/mi_perfil.dart';
import 'package:rapisolver_flutter/Utiles/global.dart' as global;




class ControladorVistas extends StatelessWidget {
  ControladorVistas({this.title});
  
  final String title;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text(title, style: TextStyle(color: Colors.black))),
          backgroundColor: Color.fromRGBO(254, 209, 54, 1),
          automaticallyImplyLeading: false,
        ),
        body: Container(
          color: Colors.white,
          child: _crearBody(),
        ));
  }

  
  Widget _crearBody() {

    if(title=='Mi Perfil'){
      return MiPerfil(global.idUser);
    }
    else if(title=='Servicios'){
      return ListarServicios();
    }
    else{
      return BuscarProveedor();
    }
    
  }
}
