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
    return my_content();
  }
}

class my_content extends State<First_page>{

  String titolo = "Eccellenze Italiane";
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(this.titolo),
        backgroundColor: Colors.white,
      ),
      body: new Container(
        padding: const EdgeInsets.all(16.0),
        child: new Column(
          children: <Widget>[
            new Center(
              child: Text("Pagina principale"),
            ),
            new RaisedButton(
                child: Text("Inserisci"),
                onPressed: (){
                    print("Hai premuto il bottone");
                }
            ),
          ],
        ),
      ),
    );
  }
}

