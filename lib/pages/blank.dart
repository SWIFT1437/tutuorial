import 'package:flutter/material.dart';
class Blank extends StatelessWidget {
  Blank({this.error});
  final String error;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(error),
    );
  }
}
