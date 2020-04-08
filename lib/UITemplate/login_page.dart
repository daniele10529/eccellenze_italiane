import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class First_page extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return my_content();
  }
}

class my_content extends State<First_page>{

  String dati = "";
  String titolo = "Eccellenze Italiane";
  bool btnDisable = true;
  TextEditingController contrNome = new TextEditingController();
  TextEditingController contrCognome = new TextEditingController();
  TextEditingController contrVia = new TextEditingController();
  TextEditingController contrCitta = new TextEditingController();
  TextEditingController contrEmail = new TextEditingController();

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
              child: Text("Registrazione cliente",
                style: TextStyle(color: Colors.purple,fontSize: 24),
              ),
            ),

            new Center(child: new Container(
              padding: EdgeInsets.only(top: 30),
              child: Text(this.dati,style: TextStyle(color: Colors.black,fontSize: 18),),
            ),
            ),

            new Container(
              padding: const EdgeInsets.only(top: 40),
              child: Align(
                alignment: Alignment.topLeft,
                child: new TextField(
                  controller: contrNome,
                  onChanged: _onchanged,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nome",
                  ),
                  style: TextStyle(color: Colors.black,fontSize: 18),
                ),
              ),
            ),

            new Container(
              padding: const EdgeInsets.only(top: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: new TextField(
                  controller: contrCognome,
                  onChanged: _onchanged,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Cognome",
                  ),
                  style: TextStyle(color: Colors.black,fontSize: 18),
                ),
              ),
            ),

            new Container(
              padding: const EdgeInsets.only(top: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: new TextField(
                  controller: contrEmail,
                  onChanged: _onchanged,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email",
                  ),
                  style: TextStyle(color: Colors.black,fontSize: 18),
                ),
              ),
            ),

            new Container(
              padding: const EdgeInsets.only(top: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: new TextField(
                  controller: contrVia,
                  onChanged: _onchanged,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Via",
                  ),
                  style: TextStyle(color: Colors.black,fontSize: 18),
                ),
              ),
            ),

            new Container(
              padding: const EdgeInsets.only(top: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: new TextField(
                  controller: contrCitta,
                  onChanged: _onchanged,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Citta",
                  ),
                  style: TextStyle(color: Colors.black,fontSize: 18),
                ),
              ),
            ),

            new Container(
              padding: const EdgeInsets.only(top: 20),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: new TextField(
                  maxLines: 8,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Note aggiuntive",
                  ),
                ),
              ),
            ),

            new Center(
              child:  new Container(
                padding: EdgeInsets.only(top: 50),
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



          ],

        ),

      ),

    );

  }

  void _aseegnanome(){
    setState(() {
      dati = contrNome.text + " "+contrCognome.text+" "+contrEmail.text+
      " "+contrVia.text+" "+contrCitta.text;
    });
  }
  void _onchanged(String value){
    setState(() {
      btnDisable = (contrNome.text.length == 0 || contrCognome.text.length == 0
          || contrEmail.text.length == 0 || contrVia.text.length == 0 || contrCitta.text.length == 0);
    });
  }

  @override
  void dispose(){
    contrNome.dispose();
    super.dispose();
  }

}

