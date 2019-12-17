import 'package:Companion_App/settings.dart';
import 'package:Companion_App/charts.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Eco Footprint"),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
              Container(
                child: Image.asset('assets/images/footprint.png'),
                alignment: Alignment.center,
                constraints: BoxConstraints(
                    maxHeight: 300.0,
                    maxWidth: 200.0,
                    minWidth: 150.0,
                    minHeight: 150.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                              width: 100.0,
                              height: 100.0,
                              child: FloatingActionButton(
                                  heroTag: "btn1",
                                  child: Icon(Icons.insert_chart, size: 60.0),
                                  onPressed: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ChartScreen())),))
                        ],
                      ),
                      alignment: Alignment.centerLeft),
                  Container(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                              width: 100.0,
                              height: 100.0,
                              child: FloatingActionButton(
                                heroTag: "btn2",
                                child: Icon(Icons.settings, size: 60.0),
                                onPressed: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SettingsScreen())),
                              ))
                        ],
                      ),
                      alignment: Alignment.centerRight)
                ],
              )
            ])));
  }
}
