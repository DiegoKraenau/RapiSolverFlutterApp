

import 'package:flutter/material.dart';
import 'package:rapisolver_flutter/Animation/FadeAnimation.dart';
import 'package:rapisolver_flutter/Modelos/ServiceDetail.dart';
import 'package:rapisolver_flutter/Modelos/Servicios/ServiceDetailsService.dart';
import 'package:rapisolver_flutter/UI/Original/agregar_recomendacion.dart';
import 'package:rapisolver_flutter/UI/Original/agregar_reserva.dart';
import 'package:rapisolver_flutter/UI/Original/perfil_supplier.dart';

class DetalleServicio extends StatefulWidget {
  final int serviceDetailId;

  DetalleServicio(this.serviceDetailId);

  @override
  _DetalleServicioState createState() => _DetalleServicioState(serviceDetailId);
}

class _DetalleServicioState extends State<DetalleServicio> {


  int serviceDetailId;
  ServiceDetail sd=new ServiceDetail();
  String nombreCompleto="";

  _DetalleServicioState(this.serviceDetailId);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title:Text("Detalle", style: TextStyle(color: Colors.white)),
         backgroundColor: Color.fromRGBO(254, 209, 54, 1),
       ),
       body: Container(
         child: FutureBuilder(
           future: ServiceDetailsService.getServiceDetailById(serviceDetailId),
           builder: (BuildContext context,AsyncSnapshot<ServiceDetail> snapshot){
             if(snapshot.connectionState==ConnectionState.waiting){
               return Center(
                 child: CircularProgressIndicator(),
               );
             }else{
               sd=snapshot.data;
               //nombreCompleto=sd.name+sd.lastName;
               return _Detalle(sd);
             }
           },
         ),
       )
    );
  }



}

  class _Detalle extends StatefulWidget {
    final ServiceDetail sd;
   
    _Detalle(this.sd);
  
    @override
    __DetalleState createState() => __DetalleState(sd);
  }
  
  class __DetalleState extends State<_Detalle> {
    ServiceDetail sd;
    String nombreCompleto;
    String costo;
    double separador=50;
    var estilo=TextStyle(fontWeight: FontWeight.bold);

    __DetalleState(this.sd){
      this.nombreCompleto=sd.name+' '+sd.lastName;
      this.costo=sd.cost+' /S';
    }



    @override
    Widget build(BuildContext context) {
      return Column(
        children: <Widget>[
          SizedBox(height: 20),
          FadeAnimation(1.6, Center(
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/user.png'),
                  fit:BoxFit.fill,
                )
              ),
            ),
          )),
          SizedBox(height: 20),
          FadeAnimation(1.8, Center(
            child: Text(nombreCompleto,style: estilo),
          )),
          SizedBox(height: 20),
          FadeAnimation(2.0,Center(
            child: Row(
              children: <Widget>[
                SizedBox(width: separador),
                Text("Servicio: "),
                SizedBox(width: separador),
                Text(sd.serviceName,style: estilo)
              ],
            ),
          )),
          SizedBox(height: 20),
          FadeAnimation(2.2, Center(
            child: Row(
              children: <Widget>[
                SizedBox(width: separador),
                Text("Categoria: "),
                SizedBox(width: separador-10),
                Text(sd.categoryName,style: estilo)
              ],
            ),
          )),
          SizedBox(height: 20),
          FadeAnimation(2.4, Center(
            child: Row(
              children: <Widget>[
                SizedBox(width: separador),
                Text("Costo: "),
                SizedBox(width: separador+15),
                Text(costo,style: estilo)
              ],
            ),
          ))
          ,SizedBox(height: 20),
          FadeAnimation(2.6, Center(
            child: Row(
              children: <Widget>[
                SizedBox(width: separador),
                Text("Descripcion: "),
                SizedBox(width: separador-30),
                Flexible(child: Container(
                  margin: EdgeInsets.all(10),
                  child: Text(sd.description,style: estilo),
                ))
               // Text(sd.description)
              ],
            ),
          )),
          SizedBox(height: 20),
          FadeAnimation(2.8, Center(
            child: Row(
              children: <Widget>[
                SizedBox(width: separador),
                Text("Puntaje: "),
                SizedBox(width: separador+10),
                Text("Falta",style: estilo)
              ],
            ),
          )),
          SizedBox(height: 20),
          FadeAnimation(2.8, Center(
            child: InkWell(
              onTap: (){
                Navigator.push(context, 
                MaterialPageRoute(builder: (context)=>PerfilSupplier(sd.usuarioId)));
              },
              child: Text("Ver más...",style: TextStyle(
              color: Colors.blue,
              fontStyle: FontStyle.italic,
            )),
            )
          )),
          SizedBox(height: 40),
          FadeAnimation(3.0, Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  color: Color.fromRGBO(254, 209, 54, 1),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  onPressed: (){
                    print(sd.usuarioId);
                    print("99");
                    Navigator.push(context, 
                      MaterialPageRoute(builder:(context)=>AgregarReserva(sd.usuarioId,sd.servicioId))
                    );
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.contact_mail),
                      SizedBox(width: 10),
                      Text("Contactar")
                    ],
                  ),
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  color: Color.fromRGBO(254, 209, 54, 1),
                  onPressed: (){
                    print(sd.usuarioId);
                    Navigator.push(context, 
                      MaterialPageRoute(builder:(context)=>AgregarRecomendacion(sd.usuarioId))
                    );
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.check),
                      SizedBox(width: 10),
                      Text("Calificar")
                    ],
                  )
                )
              ],
            ),
          ))
        ],
      );
    }
  }

