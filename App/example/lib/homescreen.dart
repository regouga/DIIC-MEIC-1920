import 'package:Companion_App/settings.dart';
import 'package:Companion_App/charts.dart';
import 'package:flutter/material.dart';

import 'globals.dart' as globals;

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Eco Footprint - " + globals.printMode() + " Mode"),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
              Container(
                //child: Image.asset('assets/images/footprint.png'),
                child: Icon(EcoFootprint.footprint, size:400.0, color: Colors.green),
                alignment: Alignment.center,
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
