import 'package:database/pages/AddBook.dart';
import 'package:flutter/material.dart';
import 'package:database/model/Book.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'ShowcaseWidget.dart';
import 'getBook.dart';

class AltView extends StatefulWidget {
  final AllBooks allBooks;
  AltView({this.allBooks});
  @override
  _AltViewState createState() => _AltViewState();
}

class _AltViewState extends State<AltView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        backgroundColor: Colors.grey[500],
        centerTitle: true,
        title: Text(
          "Catalogue",style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(onPressed: () {Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Process()), (route) => false); },child: Text("Refresh"),),
            ],
          ),
          StaggeredGridView.countBuilder(
            shrinkWrap: true,
            primary: false,
            padding: const EdgeInsets.all(12),
            crossAxisCount: 4,
            mainAxisSpacing: 24,
            crossAxisSpacing: 12,
            itemCount: widget.allBooks.count,
            itemBuilder: (BuildContext context, int index) =>
                ShowcaseWidget(book : widget.allBooks.books[index]),
            staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
          ),
        ],
      ),
      floatingActionButton:FloatingActionButton(child: Icon(Icons.add,color: Colors.white,),backgroundColor: Colors.grey[600],onPressed: (){
        Navigator.push((context),MaterialPageRoute(builder: (context) => AddBook()));
      },)
    );
  }
}
