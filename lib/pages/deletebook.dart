import 'package:http/http.dart' as http;
import 'dart:async';

Future<String> deleteBook(String bookId) async {
  String url = "https://frigid-fox.herokuapp.com/v1/books/"+bookId;
  var response = await http.delete(url,headers: {"Content-Type" : "application/json"},);
  final String deletebook = response.body;
  if(response.statusCode==200){
  return deletebook;
}else{
    return null;
  }
}