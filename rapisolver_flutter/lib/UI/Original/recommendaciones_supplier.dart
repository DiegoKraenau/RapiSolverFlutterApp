import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rapisolver_flutter/Animation/FadeAnimation.dart';
import 'package:rapisolver_flutter/Modelos/Recommendation.dart';
import 'package:rapisolver_flutter/Modelos/Servicios/RecommendationService.dart';
import 'package:rapisolver_flutter/Modelos/Supplier.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class RecommendacionesSupplier extends StatefulWidget {
  final int supplierId;
  RecommendacionesSupplier(this.supplierId);

  @override
  _RecommendacionesSupplierState createState() => _RecommendacionesSupplierState(this.supplierId);
}

class _RecommendacionesSupplierState extends State<RecommendacionesSupplier> {

   int supplierId;
   List<Recommendation> listaRecomendaciones;
  _RecommendacionesSupplierState(this.supplierId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text("Recomendaciones"),
      backgroundColor: Color.fromRGBO(254, 209, 54, 1),
    ),
    body: FutureBuilder(
      future: RecommendationService.getRecommendationsBySupplierId(supplierId),
      builder: (BuildContext context ,AsyncSnapshot<List<Recommendation>> snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }else{
          listaRecomendaciones=snapshot.data;
          return _ArmarRecomendaciones(listaRecomendaciones);
        }
      },
    ),
    );
  }
}

class _ArmarRecomendaciones extends StatefulWidget {
  final List<Recommendation> listaRecomendaciones;
  _ArmarRecomendaciones(this.listaRecomendaciones);

  @override
  __ArmarRecomendacionesState createState() => __ArmarRecomendacionesState(this.listaRecomendaciones);
}

class __ArmarRecomendacionesState extends State<_ArmarRecomendaciones> {

  List<Recommendation> listaRecomendaciones;
  __ArmarRecomendacionesState(this.listaRecomendaciones);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          padding: EdgeInsets.all(10.0),
          itemCount: listaRecomendaciones.length,
          itemBuilder: (BuildContext context,int i){
            return Card(
                      elevation: 14,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                           Text(listaRecomendaciones[i].note,style: TextStyle(fontWeight: FontWeight.bold)),
                           SizedBox(height: 20),
                           SmoothStarRating(
                             isReadOnly: true,
                             allowHalfRating: false,
                             starCount: 5,
                             rating: listaRecomendaciones[i].mark.toDouble(),
                             size: 40.0,
                             filledIconData: Icons.star,
                             halfFilledIconData: Icons.blur_on,
                             color: Color.fromRGBO(254, 209, 54, 1),
                             borderColor: Colors.black,
                             spacing: 0.0,
                          ),
                          SizedBox(height: 20)
                      ],
                  ),
                ),
              );
          },
        );
  }
}