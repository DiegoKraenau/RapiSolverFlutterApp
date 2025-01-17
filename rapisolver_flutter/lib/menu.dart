import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:rapisolver_flutter/UI/Original/buscar_servicio.dart';


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

