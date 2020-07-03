import 'package:flutter/material.dart';
import 'package:rapisolver_flutter/Animation/FadeAnimation.dart';
import 'package:rapisolver_flutter/Modelos/Customer.dart';
import 'package:rapisolver_flutter/Modelos/Servicios/CustomerService.dart';
import 'package:rapisolver_flutter/Modelos/Servicios/UserService.dart';
import 'package:rapisolver_flutter/Modelos/User.dart';
import 'package:rapisolver_flutter/UI/Original/editar_perfil.dart';

class MiPerfil extends StatefulWidget {
  
  final int userId;

  MiPerfil(this.userId);
  @override
  _MiPerfilState createState() => _MiPerfilState(this.userId);
}

class _MiPerfilState extends State<MiPerfil> {

  int userId;
  Customer customer;
  _MiPerfilState(this.userId);

   @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: FutureBuilder(
        future: CustomerService.getCustomerByUserId(userId),
        builder: (BuildContext context,AsyncSnapshot<Customer> snapshot){

        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }else{
          customer = snapshot.data;
          return _MiPerfil(customer);
        }
          
        },
      ),
    );
  }
}


class _MiPerfil extends StatefulWidget {

  final customer;
 
 _MiPerfil(this.customer);

  @override
  __PerfilState createState() => __PerfilState(customer);
}

class __PerfilState extends State<_MiPerfil> {

  double separador=50;
  Customer customer;

  var estilo=TextStyle(fontWeight: FontWeight.bold);

  __PerfilState(this.customer){
    //this.nombreCompleto = "Diego Kraenau";
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
            child: Text("${customer.name} ${customer.lastName}",style: estilo),
          )),
          SizedBox(height: 20),
          FadeAnimation(2.0,Center(
            child: Row(
              children: <Widget>[
                SizedBox(width: separador),
                Text("Correo: "),
                SizedBox(width: separador),
                Text("${customer.email}",style: estilo)
              ],
            ),
          )),
          SizedBox(height: 20),
          FadeAnimation(2.0,Center(
            child: Row(
              children: <Widget>[
                SizedBox(width: separador),
                Text("Celular: "),
                SizedBox(width: separador),
                Text("${customer.phone}",style: estilo)
              ],
            ),
          )),
          SizedBox(height: 20),
          FadeAnimation(2.0,Center(
            child: Row(
              children: <Widget>[
                SizedBox(width: separador),
                Text("Pais: "),
                SizedBox(width: separador),
                Text("${customer.country}",style: estilo)
              ],
            ),
          )),
        
        SizedBox(height: 40),
          FadeAnimation(3.0, Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  color: Color.fromRGBO(254, 209, 54, 1),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  onPressed: (){
                    print(1);
                    Navigator.push(context, 
                      MaterialPageRoute(builder:(context)=>EditarPerfil(1))
                    );
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.create),
                      SizedBox(width: 10),
                      Text("Editar")
                    ],
                  ),
                ),
              ],
            ),
          ))
        ]
       );      
  }
}