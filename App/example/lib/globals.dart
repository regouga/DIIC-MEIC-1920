library my_prj.globals;
import 'package:flutter_blue/flutter_blue.dart';

var currentState = BluetoothDeviceState.disconnected;
BluetoothDevice device;
BluetoothCharacteristic cara;
int nume = 0;

void updateColors(){
  print(cara);
  if (nume == 0) {
    nume = nume + 1;
    cara.write([50, 0, 100, 75, 25]);
  }
  else {
    nume = 0;
    cara.write([80, 25, 100, 75, 50]);
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
