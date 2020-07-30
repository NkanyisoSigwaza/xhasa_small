import 'package:flutter/material.dart';
import 'package:xhasasmall/Models/Business.dart';
import 'package:xhasasmall/Services/api.dart';

class BusinessDetail extends StatefulWidget {
  dynamic business;


  BusinessDetail({this.business});
  @override
  _BusinessDetailState createState() => _BusinessDetailState();
}

class _BusinessDetailState extends State<BusinessDetail> {

  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Column(
          children: [
            Text(widget.business.name),
            Text(widget.business.about),
            Text(widget.business.contact),
            Text(widget.business.tag),
          ],
        ),
      )
    );
  }
}
