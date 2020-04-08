import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eccellenzeitaliane/UITemplate/login_page.dart';

void main(){
    runApp(new MaterialApp(
      theme: new ThemeData(fontFamily: "Ubuntu"),
      title: "Eccellenze italiane",
      home: new First_page(),
    ));
}

