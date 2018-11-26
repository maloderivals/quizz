import 'package:flutter/material.dart';
import './landing_page.dart';
import './quizzPage.dart';

class ScorePage extends StatelessWidget{
  final int _score;
  final int _total;

  ScorePage(this._score, this._total);

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.deepPurpleAccent,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("Ton score: ", style: new TextStyle(color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.bold),),
          new Text(_score.toString() + "/" + _total.toString(), style: new TextStyle(color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.bold)),
          new Padding(padding: new EdgeInsets.only(top: 50.0)),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FloatingActionButton(
                backgroundColor: Colors.white,
                child: new Icon(Icons.home, color: Colors.black, size: 50.0,),
                tooltip: "Home page",
                onPressed: () => Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new LandingPage()), (Route route) => route == null)
             ),
              new Padding(padding: new EdgeInsets.all(20.0)),
              new FloatingActionButton(
                  child: new Icon(Icons.settings_backup_restore, color: Colors.black, size: 50.0),
                  backgroundColor: Colors.white,
                  tooltip: "New Quizz",
                  onPressed: () => Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new QuizzPage()), (Route route) => route == null)
              ),
            ],
          ),
        ],
      ),
    );
  }
}