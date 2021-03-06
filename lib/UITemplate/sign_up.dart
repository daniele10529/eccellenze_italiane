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

  //istanzio i controller per prelevare i dati dai Textfield
  TextEditingController contrNome = new TextEditingController();
  TextEditingController contrCognome = new TextEditingController();
  TextEditingController contrVia = new TextEditingController();
  TextEditingController contrCitta = new TextEditingController();
  TextEditingController contrEmail = new TextEditingController();
  TextEditingController contrNote = new TextEditingController();

 //costruisco il widget stateful di cui verrà fatto l'override
  @override
  Widget build(BuildContext context) {
    //ritorno il contenitore principale
    return new Scaffold(

      //inserisco una barra superiore
      appBar: new AppBar(
        //aggiungo un icona e una freccia a DX della barra
        actions: <Widget>[
          new Image.asset("assets/icons/logo_app.png"),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios),
            tooltip: 'Pagina dei dati',
            onPressed: () {
              //indirizzo verso la pagina di Log-in, istanziando il costruttore del widget
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
          //inserisco gli oggetti nella lista
          children: <Widget>[
            new Center(
              child: Text("Registrazione cliente",
                style: TextStyle(color: Colors.purple,fontSize: 24),
              ),
            ),

            //caselle di testo
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

            //inserisco i pulsanti in riga
            new Row(
              //aggiungo gli oggetti
              children: <Widget>[
                new Container(
                  padding: EdgeInsets.only(top: 50, left: 50),
                  child:
                  new RaisedButton(
                    //disegno le forme arrotondate
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18),
                        side: new BorderSide(color: Colors.purpleAccent),
                      ),
                      color: new Color.fromRGBO(156, 164, 255, 0.57),
                      child: Text("Inserisci",
                        style: TextStyle(color: Colors.black87,fontSize: 18),),
                      //finche la variabile è true restituisce null all'onpress
                      onPressed: btnDisable ? null : (){
                        debugPrint('Bottone inserisci ok!');
                        _assegnanome();
                      }
                  ),

                ),

                new Container(
                  padding: EdgeInsets.only(top: 50,left: 50),
                  child:
                  new RaisedButton(
                    //disegno le forme arrotondate
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18),
                        side: new BorderSide(color: Colors.blueAccent),
                      ),
                      color: new Color.fromRGBO(156, 164, 255, 0.57),
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

      //inserisco la barra di fondo
      bottomNavigationBar: BottomNavigationBar(
         //aggiungo gli elementi alla barra, sono trattati come array
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
        //alla pressione invoca ontipitem passando il numero dell'indice
        onTap: _ontapitem,
        //imposto l'elemento selezionato e lo coloro
        selectedItemColor: Colors.amber[800],
        currentIndex: 0,
      ),
    );

  }

  _ontapitem(int index){
    //aggiorno lo stato
    setState(() {
      if(index == 1){
        //indirizzo verso la pagina di Log-in, istanziando il costruttore del widget
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
      //setto la variabile dati
      dati = contrNome.text + " "+contrCognome.text+" "+contrEmail.text+
      " "+contrVia.text+" "+contrCitta.text+" "+contrNote.text;
      debugPrint(dati);
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
      //la variabile rimane true finche tutti i campi non contengono un valore
      btnDisable = (contrNome.text.length == 0 || contrCognome.text.length == 0
          || contrEmail.text.length == 0 || contrVia.text.length == 0 || contrCitta.text.length == 0);
      //la variabile rimane true finche almeno uno dei campi non contiene un valore
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
    //aggiorno lo stato
    setState(() {
      //seleziono il testo quando il textField riceve il focus
      String text = contrNome.text;
      contrNome.value = contrNome.value.copyWith(
        text: text,
        selection : TextSelection(baseOffset: 0,extentOffset: contrNome.text.length),
      );
    });
  }
  void _selcogn(){
    //aggiorno lo stato
    setState(() {
      //seleziono il testo quando il textField riceve il focus
      String text = contrCognome.text;
      contrCognome.value = contrCognome.value.copyWith(
        text: text,
        selection : TextSelection(baseOffset: 0,extentOffset: contrCognome.text.length),
      );
    });
  }
  void _selmail(){
    //aggiorno lo stato
    setState(() {
      //seleziono il testo quando il textField riceve il focus
      String text = contrEmail.text;
      contrEmail.value = contrEmail.value.copyWith(
        text: text,
        selection : TextSelection(baseOffset: 0,extentOffset: contrEmail.text.length),
      );
    });
  }
  void _selcitta(){
    //aggiorno lo stato
    setState(() {
      //seleziono il testo quando il textField riceve il focus
      String text = contrCitta.text;
      contrCitta.value = contrCitta.value.copyWith(
        text: text,
        selection : TextSelection(baseOffset: 0,extentOffset: contrCitta.text.length),
      );
    });
  }
  void _selvia(){
    //aggiorno lo stato
    setState(() {
      //seleziono il testo quando il textField riceve il focus
      String text = contrVia.text;
      contrVia.value = contrVia.value.copyWith(
        text: text,
        selection : TextSelection(baseOffset: 0,extentOffset: contrVia.text.length),
      );
    });
  }
  void _selnote(){
    //aggiorno lo stato
    setState(() {
      //seleziono il testo quando il textField riceve il focus
      String text = contrNote.text;
      contrNote.value = contrNote.value.copyWith(
        text: text,
        selection : TextSelection(baseOffset: 0,extentOffset: contrNote.text.length),
      );
    });
  }

  @override
  void dispose(){
    //scarico tutti gli elementi
     contrNome.dispose();
     contrCognome.dispose();
     contrEmail.dispose();
     contrCitta.dispose();
     contrVia.dispose();
     contrNote.dispose();
     super.dispose();
  }

}
