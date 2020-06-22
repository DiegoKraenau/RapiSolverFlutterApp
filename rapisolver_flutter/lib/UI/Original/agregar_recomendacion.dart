import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rapisolver_flutter/Animation/FadeAnimation.dart';
import 'package:rapisolver_flutter/Modelos/Servicios/RecommendationService.dart';
import 'package:rapisolver_flutter/Modelos/Servicios/SupplierService.dart';
import 'package:rapisolver_flutter/Modelos/Supplier.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart'; 
import 'package:rapisolver_flutter/Utiles/global.dart' as global;

class AgregarRecomendacion extends StatefulWidget {
  final int userId;
  AgregarRecomendacion(this.userId);

  @override
  _AgregarRecomendacionState createState() => _AgregarRecomendacionState(this.userId);
}

class _AgregarRecomendacionState extends State<AgregarRecomendacion> {
  int userId;
  Supplier supplier;
  _AgregarRecomendacionState(this.userId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calificar"),
        backgroundColor: Color.fromRGBO(254, 209, 54, 1),
      ),
      body: FutureBuilder(
        future: SupplierService.getSupplierById(userId),
        builder: (BuildContext context,AsyncSnapshot<Supplier> snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }else{
            supplier=snapshot.data;
            return _FormularioAgregarRecomendacion(supplier);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var respuesta=await RecommendationService.addRecommendation(global.noteController.text,global.mark, supplier.supplierId, global.idUser);
          print(respuesta);
          if(respuesta==true){
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text("Se agrego correctamente"),
            ));
            global.mark=0;
            global.noteController.text="";
          }else{
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text("No se agrego correctamente"),
            ));
          }
          
        },
        child: Icon(Icons.add),
        backgroundColor: Color.fromRGBO(254, 209, 54, 1),
      )
    );
  }
}

class _FormularioAgregarRecomendacion extends StatefulWidget {
  final Supplier supplier;


  _FormularioAgregarRecomendacion(this.supplier);

  @override
  __FormularioAgregarRecomendacionState createState() => __FormularioAgregarRecomendacionState(this.supplier);
}

class __FormularioAgregarRecomendacionState extends State<_FormularioAgregarRecomendacion> {

  Supplier supplier;
  //TextEditingController noteController = new TextEditingController();

  __FormularioAgregarRecomendacionState(this.supplier);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 20),
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
       FadeAnimation(2.0,Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Puntaje: "),
            SmoothStarRating(
              allowHalfRating: false,
              onRated: (v)=>{
                global.mark=v.toInt()
              },
              starCount: 5,
              rating: 0,
              size: 40.0,
              filledIconData: Icons.star,
              halfFilledIconData: Icons.blur_on,
              color: Color.fromRGBO(254, 209, 54, 1),
              borderColor: Colors.black,
              spacing: 0.0,
            )
          ],
        )),
        SizedBox(height: 90),
        FadeAnimation(2.2,Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Descripcion: "),
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
        SizedBox(height: 20),

      ],
    );
  }
}