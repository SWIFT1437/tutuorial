import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:database/pages/createbook.dart';
class AddBook extends StatefulWidget {
  @override
  _AddBookState createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  final _bookformkey = GlobalKey<FormState>();
  String title='';
  String form='';
  String edition='';
  bool available;
  String goodreads='';
  String language='';
  int length;
  double price;
  int year;
  int isbn;
  List<String> genre=[];
  List<String> author=[];
  @override
  Widget build(BuildContext context) {
    return
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            end: Alignment.topCenter,
           begin: Alignment.bottomCenter,
            colors: [Colors.blue[300],Colors.blue[100]]
          )
        ),
        child: Scaffold(
    appBar: AppBar(
    title:Text("Update Catalogue",
    style: TextStyle(color: Colors.black,
    fontWeight: FontWeight.bold),
    ),
    backgroundColor: Colors.blue[100],
    centerTitle: true,
    ),
    backgroundColor: Colors.transparent,
    body: Padding(
    padding: EdgeInsets.fromLTRB(8,5, 5, 0),
    child: SingleChildScrollView(
    child: Column(
    children: <Widget>[
    SizedBox(height: 15,),
    Container(
    height: 60,
    width: double.maxFinite,
    child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
          child: Center(
          child: Text(
          '"Today a reader.\n Tomorrow a leader"',
          style: TextStyle(
          fontFamily: 'Righteous',
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 2.0,
          ),
          ),
          ),
          ),
        ),
    ),
    ),
    SizedBox(height: 15.0,),
    Card(
        elevation: 16,
    shape: RoundedRectangleBorder(
    borderRadius:BorderRadius.circular(50)
    ),
    margin: EdgeInsets.fromLTRB(20, 1, 20, 1),
    child: Container(

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.green[300],Colors.blue[400]]
          )
        ),
        child: Form(
          key: _bookformkey,
        child: Padding(
        padding: const EdgeInsets.fromLTRB(25,0,20,0),
        child: Column(
        children: <Widget>[
        SizedBox(height:40,),
        Center(
        child: Text("Book Card",
        style:TextStyle(fontSize: 30,
        color:Colors.black,
        fontWeight: FontWeight.bold)),
        ),
        SizedBox(height: 10,),
        TextFormField(
        decoration: InputDecoration(
        prefixIcon: Icon(Icons.title,color: Colors.black,),
        hintText: 'Title',
        hintStyle: TextStyle(color:Colors.black,
        fontSize:15),
        ),
          validator: (val) => val.isEmpty?'Enter a title':null,
        ),
        SizedBox(height: 5,),
        TextFormField(
        decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_circle,color: Colors.black,),
        hintText: 'Author(s)',
        hintStyle: TextStyle(color:Colors.black,
        fontSize:15)),
          validator: (val) => val.isEmpty?'Enter at least one author':null,
        ),
        SizedBox(height: 5,),
        TextFormField(
        decoration: InputDecoration(
        prefixIcon: Icon(Icons.language,color: Colors.black,),
        hintText: 'Language',
        hintStyle: TextStyle(color:Colors.black,
        fontSize:15),),
          validator: (val) => val.isEmpty?'Enter language of book':null,
        ),
        SizedBox(height: 5,),
        TextFormField(
        decoration: InputDecoration(
        prefixIcon: Icon(Icons.web,color: Colors.black,),
        hintText: 'Goodreads URL',
        hintStyle: TextStyle(color:Colors.black,
        fontSize:15),),
        ),
        SizedBox(height: 5,),
        TextFormField(
        decoration: InputDecoration(
        prefixIcon: Icon(Icons.pages,color: Colors.black,),
        hintText: 'Total Pages',
        hintStyle: TextStyle(color:Colors.black,
        fontSize:15),),
          validator: (val) => val.isEmpty?'Enter total pages':null,
        ),
        SizedBox(height: 5,),
        TextFormField(
        decoration: InputDecoration(
        prefixIcon: Icon(Icons.book,color: Colors.black,),
        hintText: 'Format',
        hintStyle: TextStyle(color:Colors.black,
        fontSize:15),),
          validator: (val) => val.isEmpty?'Enter format of book':null,
        ),
        SizedBox(height: 5,),
        TextFormField(
        decoration: InputDecoration(
        prefixIcon: Icon(Icons.merge_type,color: Colors.black,),
        hintText: 'Genre(s)',
        hintStyle: TextStyle(color:Colors.black,
        fontSize:15),),
        ),
        SizedBox(height: 5,),
        TextFormField(
        decoration: InputDecoration(
        prefixIcon: Icon(Icons.code,color: Colors.black,),
        hintText: 'ISBN',
        hintStyle: TextStyle(color:Colors.black,
        fontSize:15),),
        ),
        SizedBox(height: 5,),
        TextFormField(
        decoration: InputDecoration(
        prefixIcon: Icon(Icons.comment,color: Colors.black,),
        hintText: 'Summary',
        hintStyle: TextStyle(color:Colors.black,
        fontSize:15),),
        ),
        SizedBox(height: 5,),
        TextFormField(
        decoration: InputDecoration(
        prefixIcon: Icon(Icons.money_off,color: Colors.black,),
        hintText: 'Price',
        hintStyle: TextStyle(color:Colors.black,
        fontSize:15),),
          validator: (val) => val.isEmpty?'Enter price in decimals (dollars)':null,
        ),
        SizedBox(height: 5,),
        TextFormField(
        decoration: InputDecoration(
        prefixIcon: Icon(Icons.arrow_back,color: Colors.black,),
        hintText: 'Availability',
        hintStyle: TextStyle(color:Colors.black,
        fontSize:15),),
        ),
        SizedBox(height: 5,),
        TextFormField(
        decoration: InputDecoration(
        prefixIcon: Icon(Icons.timer,color: Colors.black,),
        hintText: 'Year',
        hintStyle: TextStyle(color:Colors.black,
        fontSize:15),),
          validator: (val) => val.isEmpty?'Enter year':null,
        ),
        SizedBox(height:5,),
        TextFormField(
        decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_box,color: Colors.black,),
        hintText: 'Username',
        hintStyle: TextStyle(color:Colors.black,
        fontSize:15),),
        ),
        SizedBox(height:30),
        Center(
        child:OutlineButton(onPressed: () async {if(_bookformkey.currentState.validate()){final String  result = await addBook(title,form,edition,available,goodreads,language,length,price,year,isbn, genre,author);
        if(result==null){

        }else{

        }
        }},
        child: Text("Add Card"),
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30)
        ),
        borderSide: BorderSide(color: Colors.black),
        textColor: Colors.black,),),
        SizedBox(height:20)
        ],
        ),
        ),
        ),
    ),
    ),
    SizedBox(height:50,)
    ],
    ),
    ),
    ),
    ),
      );
  }
}
