import 'package:flutter/material.dart';
import 'package:rapisolver_flutter/UI/Original/agregar_servicio.dart';
import 'package:rapisolver_flutter/UI/Original/buscar_proveedor.dart';
import 'package:rapisolver_flutter/UI/Original/buscar_servicio.dart';
import 'package:rapisolver_flutter/UI/Original/mi_perfil.dart';
import 'package:rapisolver_flutter/UI/Original/reservas_screen.dart';
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
          
        ),
        floatingActionButton: _crearboton(context)
      );

  }

  
  Widget _crearBody() {

    if(title=='Mi Perfil'){
      return MiPerfil(global.idUser);
    }
    else if(title=='Servicios'){
      return ListarServicios();
    }
    else if(title == 'Reservas') {
      return ReservasScreen();
    }
    else{
      return BuscarProveedor();
    }
    
  }

  Widget _crearboton(BuildContext context) {

    if(title=='Mi Perfil'){
      return Visibility(
          child: Text("hola"),
          visible: false, // set it to false
        );
    }
    else if(title=='Servicios'){
      return Visibility(
          child: FloatingActionButton(
            
            onPressed: ()  {

              if (global.rolUser == 2) {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context)=>AgregarServicio()));
              }
              else{
                Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("Debe comprar una suscipcion"),
                        ));
              }

              

            },
            child: Icon(Icons.add),
            backgroundColor: Color.fromRGBO(254, 209, 54, 1),
          ),
          visible: true, // set it to false
        );
    }
    else{
      return Visibility(
          child: Text("hola2"),
          visible: false, // set it to false
        );
    }
    
  }
}


