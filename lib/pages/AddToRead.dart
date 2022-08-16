import 'dart:convert';

import 'package:http/http.dart' as http;

Future addRead(String bookId , String fid) async{
  String url = "https://frigid-fox.herokuapp.com/v1/users/toRead/post";
   Map jsonMap = {
     "email":"app@book.club",
     "password":"android@superUser",
     "fid":fid,
     "toRead":[bookId]
   };
   var body = json.encode(jsonMap);
  final response = await http.post(url,headers: {"Content-Type" : "application/json"},body: body);
  if (response.statusCode==201){
    return response.body;
  }
  else{
    return null;
  }
}
Future getRead(String fid) async{
  String url = "https://frigid-fox.herokuapp.com/v1/users/toRead/get";
  Map jsonMap = {
    "email":"app@book.club",
    "password":"android@superUser",
    "fid":fid
  };
  var body = json.encode(jsonMap);
  final response = await http.post(url,headers: {"Content-Type" : "application/json"},body: body);
  if (response.statusCode==201){
    return response.body;
  }
  else{
    return null;
  }
}