import 'dart:async';

import 'package:flutter/material.dart';


class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  

  @override
  void initState() { 
    super.initState();
    Timer(Duration(seconds: 5), ()=>"");
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(254, 209, 54, 1),
        child: SafeArea(
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  
                ),
                const SizedBox(height: 10.0),
                Text("Loading", style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 18.0
                ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



