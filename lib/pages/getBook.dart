import 'package:flutter/material.dart';
import 'package:database/model/Book.dart';
import 'package:http/http.dart' as http;
import 'package:database/pages/Loading.dart';
import 'dart:async';

import 'AltView.dart';
Future<AllBooks> getBooks() async {
  String url = "https://frigid-fox.herokuapp.com/v1/books/";
  var response = await http.get(url,headers: {"Content-Type" : "application/json"},);
  final AllBooks allBooks = allBooksFromJson(response.body);
  print(response.body);
  return allBooks;
}
class Process extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getBooks(),
      builder: (context,AsyncSnapshot<AllBooks> snapshot){
        if (snapshot.hasData){
          return AltView(allBooks: snapshot.data,);
        }
        else{
          return Loading();
        }
      },
    );
  }
}
