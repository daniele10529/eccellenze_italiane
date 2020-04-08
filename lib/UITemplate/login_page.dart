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
  TextEditingController contrNote = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: new AppBar(
        actions: <Widget>[
          new Image.asset("assets/icons/logo_app.png"),
        ],
        title: new Text(this.titolo,
          style: TextStyle(color: Colors.red,fontSize: 30),
        ),
        backgroundColor: Colors.blueGrey,

      ),

      body: new Container(
        padding: const EdgeInsets.all(22.0),

        child: new ListView(
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
                  onTap: _selnome,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nome",
                    icon: new Icon(Icons.account_box),
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
                  onTap: _selcogn,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Cognome",
                    icon: new Icon(Icons.account_box),
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
                  // keyboardType: TextInputType.emailAddress,
                  controller: contrEmail,
                  onChanged: _onchanged,
                  onTap: _selmail,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email",
                    icon: new Icon(Icons.email),
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
                  onTap: _selvia,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Via",
                    icon: new Icon(Icons.account_box),
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
                  onTap: _selcitta,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Citta",
                    icon: new Icon(Icons.account_box),
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
                  controller: contrNote,
                  onTap: _selnote,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Note aggiuntive",
                    icon: new Icon(Icons.mode_edit),
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
                      _assegnanome();
                    }
                ),
              ),
            ),



          ],

        ),

      ),

    );

  }

  void _assegnanome(){
    setState(() {
      dati = contrNome.text + " "+contrCognome.text+" "+contrEmail.text+
      " "+contrVia.text+" "+contrCitta.text;
      contrNome.clear();
      contrCognome.clear();
      contrEmail.clear();
      contrCitta.clear();
      contrVia.clear();
      contrNote.clear();
    });
  }
  void _onchanged(String value){
    setState(() {
      btnDisable = (contrNome.text.length == 0 || contrCognome.text.length == 0
          || contrEmail.text.length == 0 || contrVia.text.length == 0 || contrCitta.text.length == 0);

      if(dati.length != 0 ){
        dati = "";
      }
    });
  }

/*
avevo provato ad utilizzre una funzione generica per selezionare il testo quando il
TextField riceve il focus ma si comporta in modo strano
sovrascrive le lettere.
  _select(TextEditingController t){
    setState(() {
      String text =  t.text;
      t.value = t.value.copyWith(
        text: text,
        selection : TextSelection(baseOffset: 0,extentOffset: text.length),
      );
      return;
    });
  }
  */

   void _selnome(){
     String text = contrNome.text;
     contrNome.value = contrNome.value.copyWith(
        text: text,
        selection : TextSelection(baseOffset: 0,extentOffset: contrNome.text.length),
    );
  }
  void _selcogn(){
    String text = contrCognome.text;
    contrCognome.value = contrCognome.value.copyWith(
      text: text,
      selection : TextSelection(baseOffset: 0,extentOffset: contrCognome.text.length),
    );
  }
  void _selmail(){
    String text = contrEmail.text;
    contrEmail.value = contrEmail.value.copyWith(
      text: text,
      selection : TextSelection(baseOffset: 0,extentOffset: contrEmail.text.length),
    );
  }
  void _selcitta(){
    String text = contrCitta.text;
    contrCitta.value = contrCitta.value.copyWith(
      text: text,
      selection : TextSelection(baseOffset: 0,extentOffset: contrCitta.text.length),
    );
  }
  void _selvia(){
    String text = contrVia.text;
    contrVia.value = contrVia.value.copyWith(
      text: text,
      selection : TextSelection(baseOffset: 0,extentOffset: contrVia.text.length),
    );
  }
  void _selnote(){
    String text = contrNote.text;
    contrNote.value = contrNote.value.copyWith(
      text: text,
      selection : TextSelection(baseOffset: 0,extentOffset: contrNote.text.length),
    );
  }

  @override
  void dispose(){
    contrNome.dispose();
    super.dispose();
  }

}

