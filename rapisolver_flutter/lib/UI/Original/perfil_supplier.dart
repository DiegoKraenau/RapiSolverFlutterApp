import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rapisolver_flutter/Animation/FadeAnimation.dart';
import 'package:rapisolver_flutter/Modelos/Service.dart';
import 'package:rapisolver_flutter/Modelos/Servicios/ServiceService.dart';
import 'package:rapisolver_flutter/Modelos/Servicios/SupplierService.dart';
import 'package:rapisolver_flutter/Modelos/Supplier.dart';
import 'package:rapisolver_flutter/UI/Original/buscar_servicio.dart';
import 'package:rapisolver_flutter/UI/Original/recommendaciones_supplier.dart';


class PerfilSupplier extends StatefulWidget {

  final int userId;

  PerfilSupplier(this.userId);

  @override
  _PerfilSupplierState createState() => _PerfilSupplierState(this.userId);
}

class _PerfilSupplierState extends State<PerfilSupplier> {

  int userId;
  Supplier supplier;
  List<Service> listaServicios;

  _PerfilSupplierState(this.userId);



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Proveedor"),
        backgroundColor: Color.fromRGBO(254, 209, 54, 1),
      ),
      body: FutureBuilder(
        future: SupplierService.getSupplierById(userId),
        builder: (BuildContext context,AsyncSnapshot<Supplier> snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){
          return  Center(child: CircularProgressIndicator());
        }else{
          supplier=snapshot.data;
          return _PerfilSupplier(supplier);
        }

      }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, 
          MaterialPageRoute(builder: (context)=>RecommendacionesSupplier(supplier.supplierId))
          );
        },
        child: Icon(Icons.star),
        backgroundColor: Color.fromRGBO(254, 209, 54, 1),
      ),
    );
    
  }
}

class _PerfilSupplier extends StatefulWidget {

  final Supplier supplier;
 

 _PerfilSupplier(this.supplier);

  @override
  __PerfilSupplierState createState() => __PerfilSupplierState(this.supplier);
}

class __PerfilSupplierState extends State<_PerfilSupplier> {

  Supplier supplier;
  double separador=80;
  //int _index=0;
  List<Service> listaServicios;

  __PerfilSupplierState(this.supplier);

  @override
  Widget build(BuildContext context) {
    //Obtendra los servicios del supplier
    return FutureBuilder(
      future: ServiceService.getServicesByUserId(supplier.usuarioId),
      builder: (BuildContext context,AsyncSnapshot<List<Service>> snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }else{
          listaServicios=snapshot.data;
          //print(listaServicios.length.toString());
          return InfoSupplier(supplier,listaServicios);
        }
      },
    );
  }
}

class InfoSupplier extends StatefulWidget {
  final Supplier supplier;
  final List<Service> listaServicios;

  InfoSupplier(this.supplier,this.listaServicios);

  @override
  _InfoSupplierState createState() => _InfoSupplierState(this.supplier,this.listaServicios);
}

class _InfoSupplierState extends State<InfoSupplier> {
  Supplier supplier;
  List<Service> listaServicios;
  int _index=0;
  double separador=80;

  _InfoSupplierState(this.supplier,this.listaServicios);

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
       SizedBox(height: 10),
       FadeAnimation(2.0,Center(
        child: Row(
          
          children: <Widget>[
            SizedBox(width: separador),
            Text("Correo: "),
            SizedBox(width: separador-30),
            Flexible(child: Container(
              margin: EdgeInsets.all(10),
              child: Text(supplier.userName,style: TextStyle(
                fontWeight: FontWeight.bold
              )),
            ))
          ]
        ),
       )),
       SizedBox(height: 0),
       FadeAnimation(2.2, Center(
         child: Row(
           children: <Widget>[
             SizedBox(width: separador),
             Text("Telefono: "),
             SizedBox(width: separador-40),
             Flexible(child: Container(
               margin: EdgeInsets.all(10),
               child: Text(supplier.phone,style: TextStyle(
                 fontWeight: FontWeight.bold
               )),
             ))
             
           ],
         ),
       )),
       //Servicios del supplier
       SizedBox(height: 20),
       FadeAnimation(2.2, Center(
         child: Text("Servicios"),
       )),
       SizedBox(height: 50),
        //Muestra los servicios
       FadeAnimation(2.4,Center(
         child: SizedBox(
           height: 200,
           child: PageView.builder(
             itemCount: listaServicios.length,
             controller: PageController(viewportFraction: 0.7),
             onPageChanged: (int index)=>setState(()=>_index=index),
             itemBuilder: (_,i){
               return Transform.scale(
                 scale: i==_index?1:0.9,
                 child: InkWell(
                   
                   onTap: (){print("object");},
                   child: Card(
                     color: Color.fromRGBO(254, 209, 54, 80),
                     elevation: 6,
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20),
                        Text(listaServicios[i].name,style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text("Categoria :"),
                            Flexible(
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: Text(listaServicios[i].categoryName,style: TextStyle(fontWeight: FontWeight.bold)),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text("Costo: "),
                            Text(listaServicios[i].cost+' '+'/S',style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        )

                      ],
                    ),
                  ),
                ),
                 ),
                
               );
             },
           ),
         ),
       ) ),
    


      ],
    );
  }
}

