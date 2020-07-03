import 'package:flutter/material.dart';
import 'package:rapisolver_flutter/Modelos/Servicios/SupplierService.dart';
import 'package:rapisolver_flutter/Modelos/Supplier.dart';

class BuscarProveedor extends StatefulWidget {
  BuscarProveedor({Key key}) : super(key: key);

  @override
  _BuscarProveedorState createState() => _BuscarProveedorState();
}

class _BuscarProveedorState extends State<BuscarProveedor> {

  List<Supplier> listaSuppliers = List();
  List<Supplier> filtro = List();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SupplierService.getSuppliers(),
      builder: (BuildContext context,AsyncSnapshot<List<Supplier>> snapshot){

        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }else{
          
          listaSuppliers=snapshot.data;
          filtro=listaSuppliers;
         
          return _Lista(listaSuppliers);
        }
          
      },
    );
  }
}

class _Lista extends StatefulWidget {

  final List<Supplier> listaSuppliers;
  _Lista(this.listaSuppliers);

  @override
  __ListaState createState() => __ListaState(listaSuppliers);
  
  }
  
  class __ListaState extends State<_Lista>{

      List<Supplier> listaSuppliers=List();
      List<Supplier> filtro=List();


  __ListaState(this.listaSuppliers);

  @override
  void initState() {

    super.initState();
    filtro=listaSuppliers;
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
                            filtro=listaSuppliers.where((element) => (element.name.toLowerCase().contains(string.toLowerCase()))).toList();
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
                              title: Text(filtro[i].name,style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),),
                              subtitle: Text(filtro[i].lastName),
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





