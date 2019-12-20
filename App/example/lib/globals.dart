library my_prj.globals;
import 'package:flutter_blue/flutter_blue.dart';

var currentState = BluetoothDeviceState.connected; //TODO: change here to disconnected
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

// 100 vermelho
// 50 amarelo
// 0 verde

List<int> pegadaS = [0,50,100,50,0];
List<int> energyS = [100,100,50,100,50];
List<int> waterS = [50,50,0,50,50];
List<int> transportsS =[100,50,100,50,0];
List<int> trashS = [50,50,0,50,100];

