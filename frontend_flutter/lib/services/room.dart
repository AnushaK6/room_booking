import 'dart:convert';
import 'package:http/http.dart' as http;

class Room{
  static const baseUrl="http://10.0.2.2:8000/api/rooms";

  String name;
  String size;
  String club;
  String purpose;
  int num;
  String from;
  String to;
  String username;

  Room({required this.name, required this.size, required this.club, required this.purpose, required this.num, required this.from, required this.to, required this.username});

  factory Room.fromJson(Map<String,dynamic> json){
    return Room(size:json['size'], name:json['name'], club:json['club'], purpose:json['purpose'], num:json['num'], from:json['from'], to:json['to'], username: json['username']);
  }

  static Future<List> getAllRoom() async{
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

  static Future<List> getRooms(String uname) async {
    try {
      var response = await http.get(Uri.parse(baseUrl + "/" + uname));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
      else {
        return Future.error("Server error");
      }
    }
    catch (e) {
      return Future.error(e);
    }
  }

  static Future<Room> bookRoom(String name, String size, String club, String purpose, int num, String from, String to, String username) async{
    try{
      var response=await http.post(Uri.parse(baseUrl),
        headers: {'content-type':'application/json'},
        body: jsonEncode({"size":size, "name":name, "club":club, "purpose":purpose, "num":num, "from":from, "to":to, "username":username})
      );
      if(response.statusCode==200||response.statusCode==201){
        final dynamic json=jsonDecode(response.body);
        final Room room=Room.fromJson(json);
        return jsonDecode(response.body);
      }
      else{
        return Future.error("Failed to add room");
      }
    }
    catch(e){
      return Future.error(e);
    }
  }
}