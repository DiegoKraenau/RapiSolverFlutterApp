import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rapisolver_flutter/Animation/FadeAnimation.dart';
import 'package:rapisolver_flutter/Modelos/Service.dart';
import 'package:rapisolver_flutter/Modelos/ServiceCategory.dart';
import 'package:rapisolver_flutter/Modelos/Servicios/RecommendationService.dart';
import 'package:rapisolver_flutter/Modelos/Servicios/ServiceCategoryService.dart';
import 'package:rapisolver_flutter/Modelos/Servicios/ServiceDetailsService.dart';
import 'package:rapisolver_flutter/Modelos/Servicios/SupplierService.dart';
import 'package:rapisolver_flutter/Modelos/Supplier.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart'; 
import 'package:rapisolver_flutter/Utiles/global.dart' as global;


class AgregarServicio extends StatefulWidget {

  AgregarServicio();

  @override
  _AgregarServicioState createState() => _AgregarServicioState();
}

class _AgregarServicioState extends State<AgregarServicio> {
  List<ServiceCategory> categorias;
  Supplier supplier;

  _AgregarServicioState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agregar Servicio"),
        backgroundColor: Color.fromRGBO(254, 209, 54, 1),
      ),
      body: FutureBuilder(
        future: ServiceCategoryService.getServiceCategories(),
        builder: (BuildContext context,AsyncSnapshot<List<ServiceCategory>> snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }else{
            categorias=snapshot.data;
            return _AgregarServicioSupplier(supplier,categorias);
          }
        },

      ),
    );
  }
}

class _AgregarServicioSupplier extends StatefulWidget {

  final Supplier supplier;
  final List<ServiceCategory> categorias;

 _AgregarServicioSupplier(this.supplier, this.categorias);

  @override
  __AgregarServicioSupplierState createState() => __AgregarServicioSupplierState(supplier,categorias);
}


class __AgregarServicioSupplierState extends State<_AgregarServicioSupplier> {

  Supplier supplier;
  List<ServiceCategory> categorias;

  __AgregarServicioSupplierState(this.supplier,this.categorias);

  @override
  Widget build(BuildContext context) {
    //Obtendra los servicios del supplier
    return FutureBuilder(
      future: SupplierService.getSupplierById(6),
      builder: (BuildContext context,AsyncSnapshot<Supplier> snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }else{
          supplier=snapshot.data;
          //print(listaServicios.length.toString());
          return _FormularioAgregarServicio(supplier,categorias);
        }
      },
    );
  }
}




class _FormularioAgregarServicio extends StatefulWidget{
  final List<ServiceCategory> categorias;
  final Supplier supplier;
  _FormularioAgregarServicio(this.supplier,this.categorias);

  @override
  __FormularioAgregarServicio createState() => __FormularioAgregarServicio(this.supplier,this.categorias);
}




class __FormularioAgregarServicio extends State<_FormularioAgregarServicio>{

  List<String> cats = new List();
  String selectedCategory = "";
  List<ServiceCategory> categorias;
  Supplier supplier;



  __FormularioAgregarServicio(this.supplier,this.categorias){
    for (var item in categorias) {
      cats.add(item.categoryName);
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
        SizedBox(height: 30),
        FadeAnimation(2.2,Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Nombre: "),
            Container(
              width: 200,
              child: TextField(
                controller: global.nombreServicio,
                decoration: InputDecoration(
                  
                ),
              ),
            )
          ],
        )),
        
        SizedBox(height: 30),
        FadeAnimation(2.2,Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Categoria: "),
            Container(
              width: 200,
              child: Column(
                children: <Widget>[
                  DropDownField(
                    controller: global.categoriaServicio,
                    hintText: "Categoria",
                    itemsVisibleInDropdown: cats.length,
                    enabled: true,
                    items: cats,
                    onValueChanged: (value){
                      setState(() {
                        selectedCategory = value;
                        print(selectedCategory);
                      });
                    },
                  )
                ],
              ),
            )
          ],
        )),


        SizedBox(height: 30),
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

        SizedBox(height: 30),
        FadeAnimation(2.2,Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Costo: "),
            Container(
              width: 200,
              child: TextField(
                controller: global.costoServicio,
                decoration: InputDecoration(
                  
                ),
              ),
            )
          ],
        )),
        SizedBox(height: 80),
          FadeAnimation(2.2, Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  color: Color.fromRGBO(254, 209, 54, 1),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  onPressed: () async {
                    var respuesta=await ServiceDetailsService.addServicieDetail(supplier.supplierId, global.nombreServicio.text, global.costoServicio.text, selectedCategory, global.noteController.text);
                      print(respuesta);
                      if(respuesta==true){
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("Se agrego correctamente"),
                        ));
                        
                        global.noteController.text="";
                        global.nombreServicio.text="";
                        global.categoriaServicio.text="";
                        global.costoServicio.text="";

                      }else{
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("No se agrego correctamente"),
                        ));
                      }
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.contact_mail),
                      SizedBox(width: 10),
                      Text("Agregar")
                    ],
                  ),
                ),
                
              ],
            ),
          ))

        ],
      );
  }
  
}

