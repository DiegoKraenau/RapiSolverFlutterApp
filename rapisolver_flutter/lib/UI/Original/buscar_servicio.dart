import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rapisolver_flutter/Modelos/ServiceDetail.dart';
import 'package:rapisolver_flutter/Modelos/Servicios/ServiceDetailsService.dart';
import 'package:rapisolver_flutter/UI/Original/detalle_servicio.dart';

class ListarServicios extends StatefulWidget {
  ListarServicios({Key key}) : super(key: key);

  @override
  _ListarServiciosState createState() => _ListarServiciosState();
}

class _ListarServiciosState extends State<ListarServicios> {

  List<ServiceDetail> listaServicios=List();
  List<ServiceDetail> filtro=List();


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ServiceDetailsService.getServiceDetails(),
      builder: (BuildContext context,AsyncSnapshot<List<ServiceDetail>> snapshot){

        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }else{
          
          listaServicios=snapshot.data;
          filtro=listaServicios;
         
          return _Lista(listaServicios);
        }
          
      },
    );
  }
}


class _Lista extends StatefulWidget {

  final List<ServiceDetail> listaServicios;
  _Lista(this.listaServicios);

  @override
  __ListaState createState() => __ListaState(listaServicios);
}

class __ListaState extends State<_Lista> {


   List<ServiceDetail> listaServicios=List();
  List<ServiceDetail> filtro=List();

  __ListaState(this.listaServicios);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filtro=listaServicios;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
            children: <Widget>[
              SizedBox(height: 10),
              Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 12.0,right: 12.0),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(30.0),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search,color: Colors.grey,size: 25.0,),
                            contentPadding: EdgeInsets.only(left: 10.0,top: 12.0),
                            hintText: "Buscar",
                            hintStyle: TextStyle(color: Colors.grey)
                          ),
                          onChanged: (string){
                            setState(() {
                            filtro=listaServicios.where((element) => (element.serviceName.toLowerCase().contains(string.toLowerCase()))).toList();
                            });
                          },
                        ),
                      ),
                    )
                  ],
                ),

              ),
              
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(10.0),
                  itemCount: filtro.length,
                  itemBuilder: (BuildContext context,int i){
                    return Card(
                      elevation: 14,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ListTile(
                              title: Text(filtro[i].serviceName,style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),),
                              subtitle: Text(filtro[i].cost+' S/'),
                              trailing: Image.network('https://static-2.gumroad.com/res/gumroad/1211634803146/asset_previews/0117e60f054c218e172a1c160031f0a1/retina/support-notes-colour-thumbnail.png'),
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => 
                                  DetalleServicio(filtro[i].serviceDetailsId))
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          );
      }
      
}