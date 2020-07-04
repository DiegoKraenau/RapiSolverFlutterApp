import 'package:flutter/material.dart';
import 'package:rapisolver_flutter/Animation/FadeAnimation.dart';
import 'package:rapisolver_flutter/Modelos/Customer.dart';
import 'package:rapisolver_flutter/Modelos/Servicios/CustomerService.dart';
import 'package:rapisolver_flutter/Modelos/Servicios/SupplierService.dart';
import 'package:rapisolver_flutter/Modelos/Servicios/UserService.dart';
import 'package:rapisolver_flutter/Modelos/Supplier.dart';
import 'package:rapisolver_flutter/Modelos/User.dart';

class EditarPerfil extends StatefulWidget {

  final int userId;
  
  EditarPerfil(this.userId);

  @override
  _EditarPerfilState createState() => _EditarPerfilState(userId);

}

class _EditarPerfilState extends State<EditarPerfil> {

  Customer customer;
  int userId;
  _EditarPerfilState(this.userId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title:Text("Editar Perfil", style: TextStyle(color: Colors.white)),
         backgroundColor: Color.fromRGBO(254, 209, 54, 1),
       ),
       body: Container(
          child: FutureBuilder(
          future: CustomerService.getCustomerByUserId(userId),
          builder: (BuildContext context,AsyncSnapshot<Customer> snapshot){

          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }else{
            customer = snapshot.data;
            return _EditarPerfil(customer);
          }
         }
        ),
      )
    );
  }
}
class _EditarPerfil extends StatefulWidget{
  
  final Customer customer;
  _EditarPerfil(this.customer);

@override 
_EditarState createState() => _EditarState(customer);

}

class _EditarState extends State<_EditarPerfil>{
  Customer customer;
  double separador=50;
 

  var estilo=TextStyle(fontWeight: FontWeight.bold);
    
    _EditarState(this.customer){
      
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
          SizedBox(height: 30),
          FadeAnimation(2.2,Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text("Nombre: "),
              Container(
              width: 200,
              child: TextField(
                  
                  decoration: InputDecoration(     
                    hintText: customer.name,
                ),
              ),
            )
          ],
        )),

        SizedBox(height: 30),
          FadeAnimation(2.2,Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text("Apellido: "),
              Container(
              width: 200,
              child: TextField(
                  onChanged: (text){
                  print("${customer.lastName}");
                  },
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
            Text("Correo: "),
            Container(
              width: 200,
              child: TextField(
             // controller: global.noteController,
                decoration: InputDecoration(
                  hintText: customer.email,
                ),
              ),
            )
          ],
        )),

          SizedBox(height: 30),
          FadeAnimation(2.2,Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
              Text("Celular: "),
            Container(
              width: 200,
              child: TextField(
              //controller: global.noteController,
                decoration: InputDecoration(  
                  hintText: customer.phone,
                ),
              ),
            )
          ],
        )),
          SizedBox(height: 30),
          FadeAnimation(2.2,Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
            Text("País: "),
            Container(
              width: 200,
              child: TextField(
            //    controller: global.noteController,
                decoration: InputDecoration(
                  hintText: customer.country,
                ),
              ),
            )
          ],
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
                      Icon(Icons.save),
                      SizedBox(width: 10),
                      Text("Guardar")
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



