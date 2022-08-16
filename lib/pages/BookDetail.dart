import 'package:database/model/BookModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math;
Color color2 = Colors.blue[900];
Color color3 = Colors.lightBlueAccent[100];
Color color1 = Colors.lightBlue[100];
Color color4 = Colors.white;
Widget favfill = Icon(Icons.favorite_border,color: Colors.red,size: 35);
Widget favfull = Icon(Icons.favorite,color: Colors.red,size: 35);

class BookDetail extends StatefulWidget {
 BookDetail({this.book});
 final BookModel book;
  @override
  _BookDetailState createState() => _BookDetailState();
}


class _BookDetailState extends State<BookDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient:LinearGradient(begin: Alignment.topCenter,end:Alignment.bottomCenter,colors:[
        Colors.white,Colors.white70
      ])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body:Stack(
              children:<Widget>[
                Content(book: widget.book,),
                CustomPaint(
                    painter: CustomContainer(),
                    child:Container(
                      height: MediaQuery.of(context).size.height*(1/2.5),
                      width: MediaQuery.of(context).size.width,
                      child:widget.book.isbn!=null?Column(
                        children:<Widget>[
                          SizedBox(height: 50,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.code,size: 30,),
                            SizedBox(width: 10,),
                            Text(widget.book.isbn,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black,),)
                          ],
                        ),]
                      ):SizedBox(height: 10,)
                    )
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width*(1/25),
                  top:MediaQuery.of(context).size.height*(1/10),
                  child:Card(
                    shadowColor: Colors.black,
                    elevation: 16,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: getImage(widget.book.cover.medium),
                    ),
                  )
                ),
                Positioned(
                    left: MediaQuery.of(context).size.width*(1/1.25),
                    top:MediaQuery.of(context).size.height*(1/3.4),
                      child: CircleAvatar(
                        backgroundColor: Colors.white70,
                        child: widget.book.available?favfull:favfill,
                        radius: 30,
                      ),
                ),
                Positioned(
                    left: MediaQuery.of(context).size.width*(1/1.45),
                    top:MediaQuery.of(context).size.height*(1/5.8),
                    child:Column(
                      children: <Widget>[
                        Text("Year Written",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,shadows: [Shadow(color: Colors.black,offset: Offset(0.7,0.7),blurRadius: 0.5),]),),
                        SizedBox(height: 10,),
                        Text(widget.book.yearWritten==null?"0000":widget.book.yearWritten.toString(),style: TextStyle(fontWeight: FontWeight.normal,fontSize: 25,shadows: [Shadow(color: Colors.black,offset: Offset(0.7,0.7),blurRadius: 0.5),]))
                      ],
                    ),
                ),
              ]
          )
      ),
    );
  }
}
Widget getImage(String imageUrl){
  if (imageUrl=="ISBN for this book is undefined.If you think this is incorrect, please update this book without changing any fields.If this message is repeated contact a superUser."){
    Widget image = Image.asset("assets/default book cover.png",fit: BoxFit.cover,);
    return image;
  }
  else{
    Widget image = FadeInImage( image: NetworkImage(imageUrl), placeholder: AssetImage("assets/default book cover.png"),fit: BoxFit.cover,);
    return image;
  }
}
String getAuthors(List<Author> auth){
  int i;
  String tes;
  String res = "";
  for (i=0;i<auth.length;i++){
    tes=auth[i].name + " ";
    res += tes;
  }
  if (res==""){
  return "No Information";}
  else{return res;}
}
class CustomContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;
    var paint = Paint();
    paint.shader = LinearGradient(end: Alignment.bottomCenter,
        begin: Alignment.topCenter,colors: [color1,color3,color2]).createShader(rect);
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, size.height * 0.80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height * 0.80);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class Content extends StatefulWidget {
  Content({this.book});
  final BookModel book;
  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10,0,10,0),
          child: Column(
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height*(1/2.30),),
             SizedBox(height:5),
             Text(widget.book.title,style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold,shadows: [Shadow(color: Colors.black,blurRadius: 0.7,offset: Offset(2,2))])),
             SizedBox(height: 5,),
                  Text(widget.book.author!=null?widget.book.author:getAuthors(widget.book.authors),style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold,)),
             widget.book.edition==null?SizedBox(height: 10,):Column(children: <Widget>[
               SizedBox(height: 5,),
               Text("("+widget.book.edition+")",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,),),
               SizedBox(height: 5,)
             ],),
             SizedBox(height: 10,),
             Row(
               mainAxisAlignment:MainAxisAlignment.spaceEvenly,
               children: <Widget>[
                 Row(children:<Widget>[
                 Icon(Icons.book,size: 25,),
                   SizedBox(width: 10,),
                   Text(widget.book.form!=null?widget.book.form:"No Information",style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold,),)]),
                 SizedBox(width: 40,),
                 Row(children:<Widget>[
                 Text("Available",style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold,),),
                   SizedBox(width: 10,),
                 Icon(Icons.check_circle,size: 25,)])
               ]
             ),
              SizedBox(height: 18,),
              Row(
                  mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(Icons.pages,size: 27,),
                      SizedBox(height: 10,),
                      Text(widget.book.length!=null?widget.book.length.toString():"     Not\nAvailable",style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold,)),
                    ],
                  ),
                  Container(height: 50,child:VerticalDivider(color: Colors.black,)),
                  Column(
                    children: <Widget>[
                      Icon(Icons.language,size: 27,),
                      SizedBox(height: 10,),
                      Text(widget.book.language!=null?widget.book.language:"     Not\nAvailable",style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold,)),
                    ],
                  ),
                  Container(height: 50,child:VerticalDivider(color: Colors.black,)),
                  Column(
                    children: <Widget>[
                      Icon(Icons.attach_money,size: 27,),
                      SizedBox(height: 10,),
                      Text(widget.book.price!=null?widget.book.price.toString():"     Not\nAvailable",style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold,))
                    ],
                  )
                ],
              ),
              SizedBox(height:5),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  color: Colors.white70,
                  elevation: 5,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: <Widget>[
                      SizedBox(height: 5,),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.web,size: 30,),
                            SizedBox(width: 20,),
                            Text(widget.book.goodreadsURL!=null?widget.book.goodreadsURL:"Not Available",style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold,))
                          ],
                        ),
                      ),
                        Divider(height: 20,thickness: 1,color: Colors.black,),
                        SizedBox(
                          height: 5,
                        ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                           children:<Widget>[ Icon(Icons.device_hub,size: 30,)
                        ,SizedBox(width: 10,),
                       Text("Genres",style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold,shadows: [Shadow(color: Colors.black,blurRadius: 0.5,offset: Offset(1,1))]),
                       )]),
                        SizedBox(height: 5,),
                        widget.book.genres!=[]?Wrap( spacing: 12,
                          children :widget.book.genres.map((s){
                          return Chip(avatar: CircleAvatar(
                            backgroundColor: Colors.black,
                            child: Text(s[0]),
                          ),
                            label: Text(s),
                          visualDensity: VisualDensity.compact,
                          elevation: 16,
                          backgroundColor: Colors.blue[100],)
                          ;
                        }).toList(),):SizedBox(height: 1,)
                        ,
                        Divider(height: 20,thickness: 1,color: Colors.black,),
                        RaisedButton(
                          color: Colors.blue[100],
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                          onPressed: (){},child: Column(
                            children: <Widget>[
                              SizedBox(height: 5,),
                              Row(
                              mainAxisAlignment:MainAxisAlignment.center,children: <Widget>[
                              Icon(Icons.shopping_cart,size: 30,),
                              SizedBox(width: 20,),
                              Text("Borrow",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black,shadows: [Shadow(color: Colors.black,offset: Offset(1,1),blurRadius: 0.5)]),)
                                ,
                        ],),
                              SizedBox(height:5),
                            ],
                          ),)
                        //ListView.builder(itemBuilder: null)
                      ]
                    ),
                  ),
                ),
              )
            ],

          ),
        ),
      ),
    );
  }
}

