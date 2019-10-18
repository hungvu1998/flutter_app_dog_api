import 'dart:async';
import 'package:flutter_app_dog_api/src/model/dog_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class DogService{
  static Future<List<String>> getName() async {
    String url="https://dog.ceo/api/breeds/list";
    var res= await http.get(url);
    if(res.statusCode == 200){
      return DogModel.getName(json.decode(res.body));
    }else{
      return new List();
    }
  }

  static Future<List<String>> getImageByName(String name) async {
    String url="https://dog.ceo/api/breed/"+
      Uri.encodeComponent(name)+"/images";
    var res= await http.get(url);
    if(res.statusCode == 200){
      return DogModel.getImage(json.decode(res.body));
    }else{
      return new List();
    }
  }


}