import 'package:eccellenzeitaliane/UITemplate/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Data_page extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return data_content();
  }
}

class data_content extends State<Data_page>{


  @override
  Widget build(BuildContext context) {

    Navigator.push(context, MaterialPageRoute(

      builder: (BuildContext context) {

        return Scaffold(

          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              tooltip: "Pagina dei dati",
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: <Widget>[
              new Image.asset("assets/icons/logo.png"),
            ],
            title: new Text('Pagina dei dati',
            style: TextStyle(color: Colors.red,fontFamily: "Ubuntu",fontSize: 22),),
          ),

          body: new Container(
            child: new Column(
              children: <Widget>[
                new Center(
                  child: Text("I dati sono : "),
                ),
              ],
            ),
          ),


        );

      },

    ));

  }
}

