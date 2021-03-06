import 'package:flutter/material.dart';
import './quizzPage.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new Material(
        color: Colors.deepOrangeAccent,
        child: new InkWell(
          onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new QuizzPage())),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text("Un quizz Flutter", style: new TextStyle(color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.bold)),
              new Padding(padding: new EdgeInsets.all(20.0)),
              new Text("Taper pour commencer !", style: new TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold))
            ],
        ),
      )
    );
  }
}