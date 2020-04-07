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
  bool btnDisable = true;
  TextEditingController contrNome = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(this.titolo,
         style: TextStyle(color: Colors.red,fontSize: 30),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: new Container(
        padding: const EdgeInsets.all(22.0),

        child: new Column(
          children: <Widget>[
            new Center(
              child: Text("Pagina principale",
                style: TextStyle(color: Colors.purple,fontSize: 24),
              ),
            ),

            new Center(child: new Container(
                  padding: EdgeInsets.only(top: 30),
                  child: Text(this.nome,style: TextStyle(color: Colors.black,fontSize: 18),),
              ),
            ),

            new Center(
              child:  new Container(
                  padding: EdgeInsets.only(top: 100),
                  child:
                   new RaisedButton(
                       child: Text("Inserisci",
                       style: TextStyle(color: Colors.black87,fontSize: 18),
                    ),
                    onPressed: btnDisable ? null : (){
                         _aseegnanome();
                      }
                   ),
              ),
            ),

            new Container(
              padding: const EdgeInsets.only(top: 50),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: new TextField(
                     controller: contrNome,
                     onChanged: _onchanged,
                     decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "nome",
                  ),
                  style: TextStyle(color: Colors.black,fontSize: 18),
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
  void _onchanged(String value){
    setState(() {
      btnDisable = (contrNome.text.length == 0);
    });
  }

}

