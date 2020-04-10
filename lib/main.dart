import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eccellenzeitaliane/UITemplate/sign_up.dart';

void main(){
    runApp(new MaterialApp(
      theme: new ThemeData(fontFamily: "Ubuntu"),
      title: "Eccellenze italiane",
      home: new Sign_up(),
    ));
}

