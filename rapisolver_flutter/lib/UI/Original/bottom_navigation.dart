import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

enum TabItem { miPerfil, buscarServicios, buscarProveedor, misReservas }

Map<TabItem, String> tabName = {
  TabItem.miPerfil: 'Mi Perfil',
  TabItem.buscarServicios: 'Servicios',
  TabItem.buscarProveedor: 'Proveedores',
  TabItem.misReservas: 'Reservas'
};


class BottomNavigation extends StatelessWidget {
  BottomNavigation({this.currentTab, this.onSelectTab});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
         height: 50.0,
        // index: _currentIndex,
         color: Color.fromRGBO(254, 209, 54, 1),
         backgroundColor: Colors.white,
         items:<Widget>[
           Icon(Icons.person,size: 20,color: Colors.black),
           Icon(Icons.search,size: 20,color: Colors.black),
           Icon(Icons.people,size: 20,color: Colors.black),
           Icon(Icons.assignment, size: 20, color: Colors.black)
         ],
        onTap: (index) => onSelectTab(
          TabItem.values[index],
        ),
         animationDuration: Duration(
           milliseconds: 200,
         ),
         animationCurve: Curves.bounceInOut,
       
    );
  }


}
