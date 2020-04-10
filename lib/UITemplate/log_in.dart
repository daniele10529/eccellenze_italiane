import 'package:eccellenzeitaliane/UITemplate/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Log_in extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return login_content();
  }
}

class login_content extends State<Log_in>{

  bool btnDisable = true;
  bool insert = true;
  TextEditingController contrUser = new TextEditingController();
  TextEditingController contrPsw = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          tooltip: "Pagina di Log-In",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          new Image.asset("assets/icons/log-in64.png"),
        ],
        title: new Text("Eccellenze Italiane",
          style: TextStyle(color: Colors.red,fontFamily: "Ubuntu",fontSize: 30),),
      ),

      body: new Container(
        padding: EdgeInsets.all(22.0),

        child: new Column(
          children: <Widget>[

            new Center(
              child: Text("Effettua il Log_In",
                style: TextStyle(color: Colors.purple,fontSize: 24),
              ),
            ),

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

            new Row(
              children: <Widget>[
               new Container(
                   padding: EdgeInsets.only(top: 50,left: 50),
                   child:
                   new RaisedButton(
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
        currentIndex: 1,
      ),

    );

  }

  _ontapitem(int index){
    setState(() {
      if(index == 0){
        Navigator.pop(context);
      }
      if(index == 2){

      }
    });
  }

  void _onchanged(String value){
    //agggiorno lo stato
    setState(() {
      //la variabile rimane true finche tutti i campi non sono pieni
      btnDisable = (contrUser.text.length == 0 || contrPsw.text.length == 0);
      insert = (contrUser.text.length == 0 && contrPsw.text.length == 0);
    });
  }

  void _clearFileds(){
    setState(() {
      contrUser.clear();
      contrPsw.clear();
      btnDisable = true;
      insert = true;
    });
  }

  void _seluser(){
    //seleziono il testo quando il textField riceve il focus
    String text = contrUser.text;
    contrUser.value = contrUser.value.copyWith(
      text: text,
      selection : TextSelection(baseOffset: 0,extentOffset: contrUser.text.length),
    );
  }
  void _selspw(){
    String text = contrPsw.text;
    contrPsw.value = contrPsw.value.copyWith(
      text: text,
      selection : TextSelection(baseOffset: 0,extentOffset: contrPsw.text.length),
    );
  }

}


