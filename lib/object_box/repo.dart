import 'dart:convert';

import 'package:flutter_learn_13/object_box/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepo{
  static Future<List<UserModel>> fetchFromApi() async{
    try{
      dynamic response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((item) => UserModel.fromJson(item)).toList();
    }catch(e){
      rethrow;
    }
  }


}