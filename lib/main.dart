import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Eccellenze Italiane',
      home: new First_page(),
    );
  }
}

class First_page extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _my_content();
  }
}

class _my_content extends State<First_page>{

  String nome = "";
  String titolo = "Eccellenze Italiane";
  TextEditingController contrNome = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(this.titolo,
         style: TextStyle(color: Colors.red,fontSize: 24),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: new Container(
        padding: const EdgeInsets.all(22.0),
        child: new Column(
          children: <Widget>[
            new Center(
              child: Text("Pagina principale",
                style: TextStyle(color: Colors.purple,fontSize: 18),
              ),
            ),
            new Center(
              child: Text(this.nome),
            ),
            new Center(
              child:  new Container(
                  padding: EdgeInsets.only(top: 100),
                  child:
                   new RaisedButton(
                       child: Text("Inserisci",
                       style: TextStyle(color: Colors.black87,fontSize: 18),
                    ),
                    onPressed: (){
                         _aseegnanome();
                    }
                   )
              ),
            ),
            new Container(
              padding: const EdgeInsets.only(top: 50),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: new TextField(
                     controller: contrNome,
                     decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "nome",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _aseegnanome(){
    setState(() {
       nome = contrNome.text;
    });
  }
}

