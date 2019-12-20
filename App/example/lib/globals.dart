library my_prj.globals;
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter/material.dart';

var currentState = BluetoothDeviceState.disconnected;
BluetoothDevice device;
BluetoothCharacteristic cara;
int nume = 0;

void updateColors(Modes colorMode){
  if (colorMode == Modes.hourly) {
    cara.write(currentHourly);
  }
  else if (colorMode == Modes.daily) {
    cara.write(currentDaily);
  }
  else if (colorMode == Modes.monthly) {
    cara.write(currentMonthly);
  }
}


enum Modes { hourly, daily, monthly }
Modes mode = Modes.daily;
String modeString = mode.toString().split('.').last;
String printMode(){
  if (mode == Modes.hourly){
    return "Hourly";
  }
  else if(mode == Modes.daily){
    return "Daily";
  }
  return "Monthly";
}


enum Users { john_doe, jane_doe, son_doe }
Users user = Users.john_doe;
String userString = mode.toString().split('.').last;
String printUser(){
  if (user == Users.john_doe){
    return "John Doe";
  }
  else if(user == Users.jane_doe){
    return "Jane Doe";
  }
  return "Son Doe";
}

// 100 vermelho
// 50 amarelo
// 0 verde

List<int> currentHourly = [0,50,100,50,0];
List<int> currentDaily = [100,100,50,100,50];
List<int> currentMonthly = [50,50,0,50,50];


Color getColor(){
  if(mode == Modes.hourly){
    if(currentHourly[0] < 33)
      return Colors.greenAccent;
    else if(33 <= currentHourly[0] && currentHourly[0] < 66)
      return Colors.yellowAccent;
    else
      return Colors.redAccent;
  }
  if(mode == Modes.daily){
    if(currentDaily[0] < 33)
      return Colors.greenAccent;
    else if(33 <= currentDaily[0] && currentDaily[0] < 66)
      return Colors.yellowAccent;
    else
      return Colors.redAccent;
  }
  if(mode == Modes.monthly){
    if(currentMonthly[0] < 33)
      return Colors.greenAccent;
    else if(33 <= currentMonthly[0] && currentMonthly[0] < 66)
      return Colors.yellowAccent;
    else
      return Colors.redAccent;
  }
  return Colors.greenAccent;
}
