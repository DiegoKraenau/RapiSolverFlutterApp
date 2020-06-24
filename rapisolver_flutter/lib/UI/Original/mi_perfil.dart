import 'package:flutter/material.dart';
import 'package:rapisolver_flutter/Animation/FadeAnimation.dart';
import 'package:rapisolver_flutter/Modelos/Servicios/UserService.dart';
import 'package:rapisolver_flutter/Modelos/User.dart';

class MiPerfil extends StatefulWidget {
  
  final int userId;

  MiPerfil(this.userId);
  @override
  _MiPerfilState createState() => _MiPerfilState(this.userId);
}

class _MiPerfilState extends State<MiPerfil> {

  int userId;
  User user;
  List<User> users = List();
  List<User> filtro = List();
  _MiPerfilState(this.userId);

   @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: FutureBuilder(
        future: UsuerService.getUsers(),
        builder: (BuildContext context,AsyncSnapshot<List<User>> snapshot){

        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }else{
          users = snapshot.data;
          filtro = users;
          return _MiPerfil(users);
        }
          
        },
      ),
    );
  }
}


class _MiPerfil extends StatefulWidget {

  final List<User> users;
 
 _MiPerfil(this.users);

  @override
  __PerfilState createState() => __PerfilState(users);
}

class __PerfilState extends State<_MiPerfil> {

  User user;
  String nombreCompleto = "";
  double separador=50;
  List<User> users = List();
  List<User> filtro = List();

  var estilo=TextStyle(fontWeight: FontWeight.bold);

  __PerfilState(this.users){
    this.nombreCompleto = "Diego Kraenau";
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
        
        SizedBox(height: 40),
          FadeAnimation(3.0, Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  color: Color.fromRGBO(254, 209, 54, 1),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  onPressed: (){},
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.create),
                      SizedBox(width: 10),
                      Text("Editar")
                    ],
                  ),
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  color: Color.fromRGBO(254, 209, 54, 1),
                  //onPressed: (){
                   // Navigator.push(context, 
                     // MaterialPageRoute(builder:(context)=>AgregarRecomendacion(sd.usuarioId))
                   // );
                  //},
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.assignment),
                      SizedBox(width: 10),
                      Text("Reservas")
                    ],
                  )
                )
              ],
            ),
          ))
        ]
       );
       
  }
}