import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rapisolver_flutter/Animation/FadeAnimation.dart';
import 'package:rapisolver_flutter/Modelos/Servicios/RecommendationService.dart';
import 'package:rapisolver_flutter/Modelos/Servicios/ReservationService.dart';
import 'package:rapisolver_flutter/Modelos/Servicios/SupplierService.dart';
import 'package:rapisolver_flutter/Modelos/Supplier.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart'; 
import 'package:rapisolver_flutter/Utiles/global.dart' as global;


class AgregarReserva extends StatefulWidget {
  final int userId;
  final int servicioId;
  AgregarReserva(this.userId,this.servicioId);

  @override
  _AgregarReservaState createState() => _AgregarReservaState(this.userId,this.servicioId);
    
}

class _AgregarReservaState extends State<AgregarReserva>{
    int userId;
    Supplier supplier;
    int servicioId;
  _AgregarReservaState(this.userId,this.servicioId);

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Reservar"),
          backgroundColor: Color.fromRGBO(254, 209, 54, 1),
        ),
        body: FutureBuilder(
          future: SupplierService.getSupplierById(userId),
          builder: (BuildContext context, AsyncSnapshot<Supplier> snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }else{
              supplier=snapshot.data;
              return _FormularioAgregarReserva(supplier);
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async{
            var respuesta = await ReservationService.addReservation(servicioId, global.idUser, supplier.supplierId, global.datetime.toString(), global.noteController.text);
            print(respuesta);
            if(respuesta==true){
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text("Se agrego correctamente"),
            ));
            
            global.noteController.text="";
          }else{
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text("No se agrego correctamente"),
            ));
          }
          },
          child: Icon(Icons.add),
          backgroundColor: Color.fromRGBO(254, 209, 54, 1),

        ),

      
      );

  }
    
  }


class _FormularioAgregarReserva extends StatefulWidget {
  final Supplier supplier;

  _FormularioAgregarReserva(this.supplier);

  @override
  __FormularioAgregarReservaState createState() => __FormularioAgregarReservaState(this.supplier);

}

class __FormularioAgregarReservaState extends State<_FormularioAgregarReserva> {

  Supplier supplier;

  __FormularioAgregarReservaState(this.supplier);


  @override
  Widget build(BuildContext context) {
    

    return Column(
      children: <Widget>[
        SizedBox(height: 30),
        FadeAnimation(1.6, Center(
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/user.png'),
                fit: BoxFit.fill
              )
            ),
          ),
        )),
        SizedBox(height: 20),
        FadeAnimation(1.8, Center(
          child: Text(supplier.name+' '+supplier.lastName,style: TextStyle(fontWeight: FontWeight.bold)),
        )),
        SizedBox(height: 90),
        FadeAnimation(2.2,Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Nota: "),
            Container(
              width: 200,
              child: TextField(
                controller: global.noteController,
                decoration: InputDecoration(
                  
                ),
              ),
            )
          ],
        )),
        SizedBox(height: 60),
        FadeAnimation(2.4,Column(children: <Widget>[
          Text(global.datetime == null  ? 'No ha seleccionado una fecha': global.datetime.toString()),
          RaisedButton(
          child: Text('Selecciona una fecha'),
          onPressed: (){
            showDatePicker(
                context: context, 
                initialDate: global.datetime == null ? DateTime.now() : global.datetime,
                firstDate: DateTime(2001),
                lastDate: DateTime(2050)
              ).then((date) {
                setState(() {
                  global.datetime = date;
                });
              });
          },

          )
        ],))






      ],


    );
  }

}