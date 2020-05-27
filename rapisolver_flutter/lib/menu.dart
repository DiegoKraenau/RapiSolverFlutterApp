import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:rapisolver_flutter/Modelos/ServiceDetail.dart';
import 'package:rapisolver_flutter/Modelos/Servicios/ServiceDetailsService.dart';

class Menu extends StatefulWidget {


  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  int _currentIndex=0;

  final tabs=[
    Center(child: Text("Eli y Andre")),
    Center(child: ListarServicios()),
    Center(child: Text("Luis"))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Servicios", style: TextStyle(color: Colors.black))),
        backgroundColor: Color.fromRGBO(254, 209, 54, 1),
        automaticallyImplyLeading: false,
      ),
       body: tabs[_currentIndex],
       bottomNavigationBar: CurvedNavigationBar(
         height: 50.0,
         index: _currentIndex,
         color: Color.fromRGBO(254, 209, 54, 1),
         backgroundColor: Colors.white,
         items:<Widget>[
           Icon(Icons.person,size: 20,color: Colors.black),
           Icon(Icons.search,size: 20,color: Colors.black),
           Icon(Icons.people,size: 20,color: Colors.black)
         ],
         onTap: (index){
           setState(() {
             _currentIndex=index;
           });
         },
         animationDuration: Duration(
           milliseconds: 200,
         ),
         animationCurve: Curves.bounceInOut,
       ),
    );
  }
}


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
          return CircularProgressIndicator();
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


