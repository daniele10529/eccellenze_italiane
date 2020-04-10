import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eccellenzeitaliane/UITemplate/log_in.dart';

class Sign_up extends StatefulWidget{
  //creo lo stato del widget istanziando una classe per gli oggetti
  @override
  State<StatefulWidget> createState() {
    return my_content();
  }
}

class my_content extends State<Sign_up>{

  String dati = "";
  String titolo = "Eccellenze Italiane";
  bool btnDisable = true;
  bool insert = true;

  //creo i controller per prelevare i dati dai Textfield
  TextEditingController contrNome = new TextEditingController();
  TextEditingController contrCognome = new TextEditingController();
  TextEditingController contrVia = new TextEditingController();
  TextEditingController contrCitta = new TextEditingController();
  TextEditingController contrEmail = new TextEditingController();
  TextEditingController contrNote = new TextEditingController();



 //costruisco il widget stateful garantendo l'override
  @override
  Widget build(BuildContext context) {
    //ritorno il contenitore principale
    return new Scaffold(

      //inserisco una barra superiore
      appBar: new AppBar(
        actions: <Widget>[
          new Image.asset("assets/icons/logo_app.png"),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios),
            tooltip: 'Pagina dei dati',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Log_in()),);
            },
          ),
        ],
        title: new Text(this.titolo,
          style: TextStyle(color: Colors.red,fontSize: 30),
        ),
        backgroundColor: Colors.blueGrey,
      ),

      //inserisco la parte centrale
      body: new Container(
        padding: const EdgeInsets.all(22.0),

        //creo una lista di oggetti
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
                  //aggancio il controller all'oggetto
                  controller: contrNome,
                  //scateno i metodi onchange e ontap invocando 2 funzioni
                  onChanged: _onchanged,
                  onTap: _selnome,
                  //decoro la casella di testo
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

            new Row(
              children: <Widget>[
                new Container(
                  padding: EdgeInsets.only(top: 50),
                  child:
                  new RaisedButton(
                      child: Text("Inserisci",
                        style: TextStyle(color: Colors.black87,fontSize: 18),),
                      //finche la variabile è true restituisce null all'onpress
                      onPressed: btnDisable ? null : (){
                        _assegnanome();
                      }
                  ),

                ),

                new Container(
                  padding: EdgeInsets.only(top: 50,left: 50),
                  child:
                  new RaisedButton(
                      child: Text("Svuota campi",
                        style: TextStyle(color: Colors.black87,fontSize: 18),),
                      //finche la variabile è true restituisce null all'onpress
                      onPressed: insert ? null : (){
                        _clearFileds();
                      }
                  ),

                ),

              ],

            ),

          ],

        ),

      ),

      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.group_add),
              title: new Text("Registrati",style: TextStyle(color: Colors.lightBlueAccent,fontSize: 14),),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: new Text("Log-in",style: TextStyle(color: Colors.lightBlueAccent,fontSize: 14),),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart),
              title: new Text("Prodotti",style: TextStyle(color: Colors.lightBlueAccent,fontSize: 14),),
            ),
          ],
        onTap: _ontapitem,
        selectedItemColor: Colors.amber[800],
        currentIndex: 0,
      ),
    );

  }

  _ontapitem(int index){
    setState(() {
      if(index == 1){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Log_in()),);
      }
      if(index == 2){
        dati = "Andrai a pagina 2";
      }
    });
  }

  void _assegnanome(){
    //aggiorno lo stato
    setState(() {
      dati = contrNome.text + " "+contrCognome.text+" "+contrEmail.text+
      " "+contrVia.text+" "+contrCitta.text;
      //pulisco le caselle di testo
      _clearFileds();
      btnDisable = true;
      insert = true;
    });
  }

  void _clearFileds(){
    setState(() {
      contrNome.clear();
      contrCognome.clear();
      contrEmail.clear();
      contrCitta.clear();
      contrVia.clear();
      contrNote.clear();
      btnDisable = true;
      insert = true;
    });
  }

  void _onchanged(String value){
    //agggiorno lo stato
    setState(() {
      //la variabile rimane true finche tutti i campi non sono pieni
      btnDisable = (contrNome.text.length == 0 || contrCognome.text.length == 0
          || contrEmail.text.length == 0 || contrVia.text.length == 0 || contrCitta.text.length == 0);

      insert = (contrNome.text.length == 0 && contrCognome.text.length == 0
          && contrEmail.text.length == 0 && contrVia.text.length == 0 && contrCitta.text.length == 0
      && contrNote.text.length == 0);

      //svuoto il testo con i dati
      if(dati.length != 0 ){
        dati = "";
      }
    });
  }

   void _selnome(){
     //seleziono il testo quando il textField riceve il focus
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
     contrCognome.dispose();
     contrEmail.dispose();
     contrCitta.dispose();
     contrVia.dispose();
     contrNote.dispose();
     super.dispose();
  }

}
