import 'package:Companion_App/settings.dart';
import 'package:Companion_App/charts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

import 'globals.dart' as globals;

class HomeScreen extends StatelessWidget {

  static BluetoothCharacteristic car;

  void findServices() async {
    globals.device.services.listen((service) {
      for (BluetoothService s in service) {
        if (s.uuid.toString() == "0000dfb0-0000-1000-8000-00805f9b34fb") {
          for(BluetoothCharacteristic c in s.characteristics) {
            if (c.uuid.toString() == "0000dfb1-0000-1000-8000-00805f9b34fb") {
              globals.cara = c;
            }
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => findServices());
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
                                onPressed: () {
                                  globals.updateColors();
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SettingsScreen()));}
                              ))
                        ],
                      ),
                      alignment: Alignment.centerRight)
                ],
              )
            ])));
  }
}
