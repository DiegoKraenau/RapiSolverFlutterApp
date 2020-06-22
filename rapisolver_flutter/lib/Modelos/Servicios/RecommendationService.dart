import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rapisolver_flutter/Modelos/Recommendation.dart';

class RecommendationService{
  
   static Future<bool> addRecommendation(String note,int mark,int supplierId,int usuarioId) async {
     final resp= await http.post('http://rapisolverprueba.herokuapp.com/api/recommendations',
       headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
       'note':note,
       'mark':mark,
       'supplierId':supplierId,
       'usuarioId':usuarioId
      }));
     
     if(resp.statusCode==200){
       return true;
     }else{
       return false;
     }
   }


    static Future<List<Recommendation>> getRecommendationsBySupplierId(int supplierId) async {
     final resp= await http.get('http://rapisolverprueba.herokuapp.com/api/recommendations/'+supplierId.toString());
     List<Recommendation> recommendations = (json.decode(resp.body) as List)
      .map((data) => Recommendation.fromJson(data))
      .toList();
     return recommendations;
   }
}
