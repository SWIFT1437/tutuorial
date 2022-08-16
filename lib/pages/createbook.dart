import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> addBook(String title,String form,String edition,bool available,String goodreads,String language,int length,double price,int year,int isbn,List<String> genre,List<String> author)async{
Map jsonMap= 
{
    "email": "app@book.club",
    "password": "android@superUser",
    "book": {
    	"title": title,
    	"genres": genre,
    	"form": form,
    	"available": available,
    	"price": price,
    	"edition": edition,
    	"length": length,
			"year_written": year,
			"authors": author,
			"ISBN":isbn,
    	"language": language,
    	"goodreadsURL": goodreads
    }
};
  var jsonbody = json.encode(jsonMap);
  String url = "https://frigid-fox.herokuapp.com/v1/books";
  final response = await http.post(url,headers: {"Content-Type" : "application/json"},body: jsonbody);
  if (response.statusCode ==201){
  final responseString = response.body;
  return responseString;
}else{
  return null;
}
}