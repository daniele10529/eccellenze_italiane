//import 'package:eccellenzeitaliane/UITemplate/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Log_in extends StatefulWidget{
  //creo lo stato del widget istanziando una classe per gli oggetti
  @override
  State<StatefulWidget> createState() {
    return login_content();
  }
}

class login_content extends State<Log_in>{

  bool btnDisable = true;
  bool insert = true;
  //istanzio i controller da agganciare alle TextField
  TextEditingController contrUser = new TextEditingController();
  TextEditingController contrPsw = new TextEditingController();

  //costruisco il widget stateful di cui verrà fatto l'override
  @override
  Widget build(BuildContext context) {
    //ritorno il contenitore principale
    return Scaffold(
     resizeToAvoidBottomPadding: false,

      //inserisco una barra superiore
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        //inserisco la freccia per il ritorno nella parte SX della barra
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          tooltip: "Pagina di Log-In",
          onPressed: () {
            //indirizzo alla pagina precedente individuata dalla variabile context
            //che ho passato nell'istanza a questa pagina
            Navigator.pop(context);
          },
        ),
        //inserisco un Icona a DX della barra
        actions: <Widget>[
          new Image.asset("assets/icons/log-in64.png"),
        ],
        title: new Text("Eccellenze Italiane",
          style: TextStyle(color: Colors.red,fontFamily: "Ubuntu",fontSize: 30),),
      ),

      //inserisco la parte centrale
      body: new Container(
        padding: EdgeInsets.all(22.0),

        //creo una colonna di oggetti, dato che sono pochi non devo
        //scrollare
        child: new Column(
          ////inserisco gli oggetti nella colonna
          children: <Widget>[

            new Center(
              child: Text("Effettua il Log_In",
                style: TextStyle(color: Colors.purple,fontSize: 24,fontFamily: "Ubuntu"),
              ),
            ),

            //caselle di testo
            new Container(
              padding: const EdgeInsets.only(top: 40),
              child: Align(
                alignment: Alignment.topLeft,
                child: new TextField(
                  //aggancio il controller all'oggetto
                  controller: contrUser,
                  onChanged: _onchanged,
                  onTap: _seluser,
                  //decoro la casella di testo
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "User Name",
                    icon: new Icon(Icons.person),
                  ),
                  style: TextStyle(color: Colors.black,fontSize: 18),
                ),
              ),
            ),

            new Container(
              padding: const EdgeInsets.only(top: 40),
              child: Align(
                alignment: Alignment.topLeft,
                child: new TextField(
                  //aggancio il controller all'oggetto
                  controller: contrPsw,
                  obscureText: true,
                  onChanged: _onchanged,
                  onTap: _selspw,
                  //decoro la casella di testo
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password",
                    icon: new Icon(Icons.visibility_off),
                  ),
                  style: TextStyle(color: Colors.black,fontSize: 18),
                ),
              ),
            ),

            //inserisco i pulsanti in riga
            new Row(
              children: <Widget>[
                //aggiungo gli oggetti
               new Container(
                   padding: EdgeInsets.only(top: 50,left: 50),
                   child:
                   new RaisedButton(
                     //disegno le forme arrotondate
                       shape: new RoundedRectangleBorder(
                         borderRadius: new BorderRadius.circular(18),
                         side: new BorderSide(color: Colors.purpleAccent),
                       ),
                       color: new Color.fromRGBO(156, 164, 255, 0.57),
                       child: Text("Log_In",
                         style: TextStyle(color: Colors.black87,fontSize: 18),),
                       //finche la variabile è true restituisce null all'onpress
                       onPressed: btnDisable ? null : (){
                         debugPrint(contrUser.text + " "+ contrPsw.text);
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
                          side: new BorderSide(color: Colors.purpleAccent),
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
        currentIndex: 1,
      ),

    );

  }

  _ontapitem(int index){
    //aggiorno lo stato
    setState(() {
      if(index == 0){
        //indirizzo alla pagina precedente individuata dalla variabile context
        //che ho passato nell'istanza a questa pagina
        Navigator.pop(context);
      }
      if(index == 2){

      }
    });
  }

  void _onchanged(String value){
    //agggiorno lo stato
    setState(() {
      //la variabile rimane true finche tutti i campi non contengono un valore
      btnDisable = (contrUser.text.length == 0 || contrPsw.text.length == 0);
      //la variabile rimane true finche almeno un campo non contiene un valore
      insert = (contrUser.text.length == 0 && contrPsw.text.length == 0);
    });
  }

  void _clearFileds(){
    //aggiorno lo stato
    setState(() {
      //cancello i campi e disabilito i pulsanti
      contrUser.clear();
      contrPsw.clear();
      btnDisable = true;
      insert = true;
    });
  }

  void _seluser(){
    //aggiorno lo stato
    setState(() {
      //seleziono il testo quando il textField riceve il focus
      String text = contrUser.text;
      contrUser.value = contrUser.value.copyWith(
        text: text,
        selection : TextSelection(baseOffset: 0,extentOffset: contrUser.text.length),
      );
    });
  }
  void _selspw(){
    //aggiorno lo stato
    setState(() {
      //seleziono il testo quando il textField riceve il focus
      String text = contrPsw.text;
      contrPsw.value = contrPsw.value.copyWith(
        text: text,
        selection : TextSelection(baseOffset: 0,extentOffset: contrPsw.text.length),
      );
    });
  }

  @override
  void dispose(){
    //scarico gli elementi
    contrUser.dispose();
    contrPsw.dispose();
    super.dispose();
  }

}


