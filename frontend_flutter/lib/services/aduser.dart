import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Admin{
  static const baseUrl="http://10.0.2.2:8000/api/admins";

  String username;
  String password;

  Admin({required this.username, required this.password});

  factory Admin.fromJson(Map<String,dynamic> json){
    return Admin(username:json['username'], password:json['password']);
  }

  static Future<List> getAllAdmin() async{
    try{
      var response=await http.get(Uri.parse(baseUrl));
      if(response.statusCode==200){
        return jsonDecode(response.body);
      }
      else{
        return Future.error("Server error");
      }
    }
    catch(e){
      return Future.error(e);
    }
  }

  static Future<Admin> signAdmin(String uname, String pword) async{
    try{
      var response=await http.post(Uri.parse(baseUrl),
          headers: {'content-type':'application/json'},
          body: jsonEncode({"username":uname, "password":pword})
      );

      if(response.statusCode==200||response.statusCode==201){
        final dynamic json=jsonDecode(response.body);
        final Admin room=Admin.fromJson(json);
        return jsonDecode(response.body);
      }
      else{
        return Future.error("Failed to add user");
      }
    }
    catch(e){
      return Future.error(e);
    }
  }

  static Future<void> getAdmin(String uname, String pword, context) async {
    try {
      var response = await http.get(Uri.parse(baseUrl + "/" + uname));


      if (response.statusCode == 200) {
        if(response.body.isEmpty){
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Oops! Wrong username or password'),
                backgroundColor: Colors.red,
              )
          );
        }

        else if(jsonDecode(response.body)['password']==pword){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text('Yay! Successfully logged in'),
            backgroundColor: Colors.green,
          ));
          Navigator.pushReplacementNamed(context, '/adminview');
        }

        else{
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Oops! Wrong password. Try again'),
                backgroundColor: Colors.red,
              )
          );
        }
      }
      else {
        return Future.error("Server error");
      }
    }
    catch (e) {
      return Future.error(e);
    }
  }
}