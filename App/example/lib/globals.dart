library my_prj.globals;

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
