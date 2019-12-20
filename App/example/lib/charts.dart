import 'package:flutter/material.dart';
import 'package:bezier_chart/bezier_chart.dart';
import 'package:intl/intl.dart' as intl;
import 'package:cloud_firestore/cloud_firestore.dart';

class ChartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(EcoFootprint.footprint)),
              Tab(icon: Icon(Icons.wb_incandescent)),
              Tab(icon: Icon(EcoFootprint.water_drop)),
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.delete)),
            ],
          ),
          title: Text('Statistics'),
        ),
        body: TabBarView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    hourly(context,getHTransports()),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "Hourly",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: <Widget>[
                    daily(context,getDTransports()),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "Daily",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: <Widget>[
                    monthly(context,getMTransports()),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "Monthly",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    hourly(context,getMTransports()),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "Hourly",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: <Widget>[
                    daily(context,getDTransports()),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "Daily",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: <Widget>[
                    monthly(context,getMTransports()),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "Monthly",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    hourly(context,getHWater()),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "Hourly",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: <Widget>[
                    daily(context,getDWater()),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "Daily",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: <Widget>[
                    monthly(context,getMWater()),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "Monthly",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    hourly(context,getHTransports()),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "Hourly",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: <Widget>[
                    daily(context,getDTransports()),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "Daily",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: <Widget>[
                    monthly(context,getMTransports()),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "Monthly",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    hourly(context,getHTrash()),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "Hourly",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: <Widget>[
                    daily(context,getDTrash()),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "Daily",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: <Widget>[
                    monthly(context,getMTrash()),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "Monthly",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



List<DataPoint<dynamic>> getDTransports() {
  final databaseReference = Firestore.instance;
  List<DataPoint<DateTime>> list = new List<DataPoint<DateTime>>();
  databaseReference
      .collection("metrics")
      .getDocuments()
      .then((QuerySnapshot snapshot) {

    snapshot.documents.forEach((DocumentSnapshot doc) {
      for(var doc in snapshot.documents){
        for (var f in doc.data.keys){
          var score = 1.1;
          score += doc[f]["driving"] > 0 ? 30 : 0;
          score += doc[f]["bus"] > 0 ? 20 : 0;
          score += doc[f]["train"] > 0 ? 10 : 0;


          score -= doc[f]["walking"] > 0 ? 10 : 0;
          score -= doc[f]["cycling"] > 0 ? 10 : 0;
          score -= doc[f]["moving"] > 0 ? 10 : 0;

          if(doc[f]["flying"] > 0){
            score = 100;
          }
          score = score < 0 ? 0 : score;
          score = score > 100 ? 100 : score;
          list.add(new DataPoint<DateTime>(value: score.toDouble(), xAxis: DateTime.parse(f)));
        }
      }
    });
  });
  print(list);

  return list;
}

List<DataPoint<dynamic>> getMTransports() {
  List<DataPoint<dynamic>> ret = new List<DataPoint<dynamic>>();
  ret.add(DataPoint<DateTime>(value: 18, xAxis: DateTime(2019, 01, 01)));
  ret.add(DataPoint<DateTime>(value: 16, xAxis: DateTime(2019, 02, 01)));
  ret.add(DataPoint<DateTime>(value: 20, xAxis: DateTime(2019, 03, 01)));
  ret.add(DataPoint<DateTime>(value: 34, xAxis: DateTime(2019, 04, 01)));
  ret.add(DataPoint<DateTime>(value: 23, xAxis: DateTime(2019, 05, 01)));
  ret.add(DataPoint<DateTime>(value: 25, xAxis: DateTime(2019, 06, 01)));
  ret.add(DataPoint<DateTime>(value: 80, xAxis: DateTime(2019, 07, 01)));
  ret.add(DataPoint<DateTime>(value: 76, xAxis: DateTime(2019, 08, 01)));
  ret.add(DataPoint<DateTime>(value: 22, xAxis: DateTime(2019, 09, 01)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 10, 01)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 11, 01)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 12, 01)));
  return ret;
}

List<DataPoint<dynamic>> getHTransports() {
  List<DataPoint<dynamic>> ret = new List<DataPoint<dynamic>>();
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 0)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 1)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 2)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 3)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 4)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 5)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 6)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 7)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 8)));
  ret.add(DataPoint<DateTime>(value: 20, xAxis: DateTime(2019, 09, 19, 9)));
  ret.add(DataPoint<DateTime>(value: 10, xAxis: DateTime(2019, 09, 19, 10)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 11)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 12)));
  ret.add(DataPoint<DateTime>(value: 10, xAxis: DateTime(2019, 09, 19, 13)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 14)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 15)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 16)));
  ret.add(DataPoint<DateTime>(value: 20, xAxis: DateTime(2019, 09, 19, 17)));
  ret.add(DataPoint<DateTime>(value: 20, xAxis: DateTime(2019, 09, 19, 18)));
  ret.add(DataPoint<DateTime>(value: 10, xAxis: DateTime(2019, 09, 19, 19)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 20)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 21)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 22)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 23)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 24)));
  return ret;
}


List<DataPoint<dynamic>> getMWater() {
  List<DataPoint<dynamic>> ret = new List<DataPoint<dynamic>>();
  ret.add(DataPoint<DateTime>(value: 22, xAxis: DateTime(2019, 01, 01)));
  ret.add(DataPoint<DateTime>(value: 25, xAxis: DateTime(2019, 02, 01)));
  ret.add(DataPoint<DateTime>(value: 32, xAxis: DateTime(2019, 03, 01)));
  ret.add(DataPoint<DateTime>(value: 28, xAxis: DateTime(2019, 04, 01)));
  ret.add(DataPoint<DateTime>(value: 27, xAxis: DateTime(2019, 05, 01)));
  ret.add(DataPoint<DateTime>(value: 50, xAxis: DateTime(2019, 06, 01)));
  ret.add(DataPoint<DateTime>(value: 43, xAxis: DateTime(2019, 07, 01)));
  ret.add(DataPoint<DateTime>(value: 54, xAxis: DateTime(2019, 08, 01)));
  ret.add(DataPoint<DateTime>(value: 32, xAxis: DateTime(2019, 09, 01)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 10, 01)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 11, 01)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 12, 01)));
  return ret;
}

List<DataPoint<dynamic>> getDWater() {
  List<DataPoint<dynamic>> ret = new List<DataPoint<dynamic>>();
  ret.add(DataPoint<DateTime>(value: 21, xAxis: DateTime(2019, 09, 1))); //fds
  ret.add(DataPoint<DateTime>(value: 12, xAxis: DateTime(2019, 09, 2)));
  ret.add(DataPoint<DateTime>(value: 8, xAxis: DateTime(2019, 09, 3)));
  ret.add(DataPoint<DateTime>(value: 11, xAxis: DateTime(2019, 09, 4)));
  ret.add(DataPoint<DateTime>(value: 12, xAxis: DateTime(2019, 09, 5)));
  ret.add(DataPoint<DateTime>(value: 15, xAxis: DateTime(2019, 09, 6)));
  ret.add(DataPoint<DateTime>(value: 26, xAxis: DateTime(2019, 09, 7))); //fds
  ret.add(DataPoint<DateTime>(value: 28, xAxis: DateTime(2019, 09, 8))); //fds
  ret.add(DataPoint<DateTime>(value: 17, xAxis: DateTime(2019, 09, 9)));
  ret.add(DataPoint<DateTime>(value: 7, xAxis: DateTime(2019, 09, 10)));
  ret.add(DataPoint<DateTime>(value: 18, xAxis: DateTime(2019, 09, 11)));
  ret.add(DataPoint<DateTime>(value: 11, xAxis: DateTime(2019, 09, 12)));
  ret.add(DataPoint<DateTime>(value: 24, xAxis: DateTime(2019, 09, 13)));
  ret.add(DataPoint<DateTime>(value: 24, xAxis: DateTime(2019, 09, 14))); //fds
  ret.add(DataPoint<DateTime>(value: 32, xAxis: DateTime(2019, 09, 15))); //fds
  ret.add(DataPoint<DateTime>(value: 12, xAxis: DateTime(2019, 09, 16)));
  ret.add(DataPoint<DateTime>(value: 11, xAxis: DateTime(2019, 09, 17)));
  ret.add(DataPoint<DateTime>(value: 14, xAxis: DateTime(2019, 09, 18)));
  ret.add(DataPoint<DateTime>(value: 17, xAxis: DateTime(2019, 09, 19)));
  ret.add(DataPoint<DateTime>(value: 28, xAxis: DateTime(2019, 09, 20))); //fds
  ret.add(DataPoint<DateTime>(value: 23, xAxis: DateTime(2019, 09, 21))); //fds
  ret.add(DataPoint<DateTime>(value: 12, xAxis: DateTime(2019, 09, 22)));
  ret.add(DataPoint<DateTime>(value: 12, xAxis: DateTime(2019, 09, 23)));
  ret.add(DataPoint<DateTime>(value: 17, xAxis: DateTime(2019, 09, 24)));
  ret.add(DataPoint<DateTime>(value: 15, xAxis: DateTime(2019, 09, 25)));
  ret.add(DataPoint<DateTime>(value: 12, xAxis: DateTime(2019, 09, 26)));
  ret.add(DataPoint<DateTime>(value: 42, xAxis: DateTime(2019, 09, 27))); //fds
  ret.add(DataPoint<DateTime>(value: 33, xAxis: DateTime(2019, 09, 28))); //fds
  ret.add(DataPoint<DateTime>(value: 20, xAxis: DateTime(2019, 09, 29)));
  ret.add(DataPoint<DateTime>(value: 10, xAxis: DateTime(2019, 09, 30)));
  return ret;
}

List<DataPoint<dynamic>> getHWater() {
  List<DataPoint<dynamic>> ret = new List<DataPoint<dynamic>>();
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 0)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 1)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 2)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 3)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 4)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 5)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 6)));
  ret.add(DataPoint<DateTime>(value: 3, xAxis: DateTime(2019, 09, 19, 7)));
  ret.add(DataPoint<DateTime>(value: 33, xAxis: DateTime(2019, 09, 19, 8)));
  ret.add(DataPoint<DateTime>(value: 5, xAxis: DateTime(2019, 09, 19, 9)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 10)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 11)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 12)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 13)));
  ret.add(DataPoint<DateTime>(value: 1, xAxis: DateTime(2019, 09, 19, 14)));
  ret.add(DataPoint<DateTime>(value: 5, xAxis: DateTime(2019, 09, 19, 15)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 16)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 17)));
  ret.add(DataPoint<DateTime>(value: 20, xAxis: DateTime(2019, 09, 19, 18)));
  ret.add(DataPoint<DateTime>(value: 14, xAxis: DateTime(2019, 09, 19, 19)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 20)));
  ret.add(DataPoint<DateTime>(value: 5, xAxis: DateTime(2019, 09, 19, 21)));
  ret.add(DataPoint<DateTime>(value: 33, xAxis: DateTime(2019, 09, 19, 22)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 23)));
  return ret;
}



List<DataPoint<dynamic>> getMTrash() {
  List<DataPoint<dynamic>> ret = new List<DataPoint<dynamic>>();
  ret.add(DataPoint<DateTime>(value: 49, xAxis: DateTime(2019, 01, 01)));
  ret.add(DataPoint<DateTime>(value: 60, xAxis: DateTime(2019, 02, 01)));
  ret.add(DataPoint<DateTime>(value: 46, xAxis: DateTime(2019, 03, 01)));
  ret.add(DataPoint<DateTime>(value: 64, xAxis: DateTime(2019, 04, 01)));
  ret.add(DataPoint<DateTime>(value: 50, xAxis: DateTime(2019, 05, 01)));
  ret.add(DataPoint<DateTime>(value: 54, xAxis: DateTime(2019, 06, 01)));
  ret.add(DataPoint<DateTime>(value: 40, xAxis: DateTime(2019, 07, 01)));
  ret.add(DataPoint<DateTime>(value: 30, xAxis: DateTime(2019, 08, 01)));
  ret.add(DataPoint<DateTime>(value: 42, xAxis: DateTime(2019, 09, 01)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 10, 01)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 11, 01)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 12, 01)));
  return ret;
}

List<DataPoint<dynamic>> getDTrash() {
  List<DataPoint<dynamic>> ret = new List<DataPoint<dynamic>>();
  ret.add(DataPoint<DateTime>(value: 50, xAxis: DateTime(2019, 09, 1))); //fds
  ret.add(DataPoint<DateTime>(value: 21, xAxis: DateTime(2019, 09, 2)));
  ret.add(DataPoint<DateTime>(value: 23, xAxis: DateTime(2019, 09, 3)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 4)));
  ret.add(DataPoint<DateTime>(value: 14, xAxis: DateTime(2019, 09, 5)));
  ret.add(DataPoint<DateTime>(value: 22, xAxis: DateTime(2019, 09, 6)));
  ret.add(DataPoint<DateTime>(value: 40, xAxis: DateTime(2019, 09, 7))); //fds
  ret.add(DataPoint<DateTime>(value: 50, xAxis: DateTime(2019, 09, 8))); //fds
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 9)));
  ret.add(DataPoint<DateTime>(value: 10, xAxis: DateTime(2019, 09, 10)));
  ret.add(DataPoint<DateTime>(value: 5, xAxis: DateTime(2019, 09, 11)));
  ret.add(DataPoint<DateTime>(value: 15, xAxis: DateTime(2019, 09, 12)));
  ret.add(DataPoint<DateTime>(value: 20, xAxis: DateTime(2019, 09, 13)));
  ret.add(DataPoint<DateTime>(value: 30, xAxis: DateTime(2019, 09, 14))); //fds
  ret.add(DataPoint<DateTime>(value: 60, xAxis: DateTime(2019, 09, 15))); //fds
  ret.add(DataPoint<DateTime>(value: 25, xAxis: DateTime(2019, 09, 16)));
  ret.add(DataPoint<DateTime>(value: 15, xAxis: DateTime(2019, 09, 17)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 18)));
  ret.add(DataPoint<DateTime>(value: 13, xAxis: DateTime(2019, 09, 19)));
  ret.add(DataPoint<DateTime>(value: 40, xAxis: DateTime(2019, 09, 20))); //fds
  ret.add(DataPoint<DateTime>(value: 45, xAxis: DateTime(2019, 09, 21))); //fds
  ret.add(DataPoint<DateTime>(value: 43, xAxis: DateTime(2019, 09, 22)));
  ret.add(DataPoint<DateTime>(value: 10, xAxis: DateTime(2019, 09, 23)));
  ret.add(DataPoint<DateTime>(value: 2, xAxis: DateTime(2019, 09, 24)));
  ret.add(DataPoint<DateTime>(value: 10, xAxis: DateTime(2019, 09, 25)));
  ret.add(DataPoint<DateTime>(value: 6, xAxis: DateTime(2019, 09, 26)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 27))); //fds
  ret.add(DataPoint<DateTime>(value: 30, xAxis: DateTime(2019, 09, 28))); //fds
  ret.add(DataPoint<DateTime>(value: 20, xAxis: DateTime(2019, 09, 29)));
  ret.add(DataPoint<DateTime>(value: 10, xAxis: DateTime(2019, 09, 30)));
  return ret;
}

List<DataPoint<dynamic>> getHTrash() {
  List<DataPoint<dynamic>> ret = new List<DataPoint<dynamic>>();
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 0)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 1)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 2)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 3)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 4)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 5)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 6)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 7)));
  ret.add(DataPoint<DateTime>(value: 30, xAxis: DateTime(2019, 09, 19, 8)));
  ret.add(DataPoint<DateTime>(value: 20, xAxis: DateTime(2019, 09, 19, 9)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 10)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 11)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 12)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 13)));
  ret.add(DataPoint<DateTime>(value: 15, xAxis: DateTime(2019, 09, 19, 14)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 15)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 16)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 17)));
  ret.add(DataPoint<DateTime>(value: 20, xAxis: DateTime(2019, 09, 19, 18)));
  ret.add(DataPoint<DateTime>(value: 10, xAxis: DateTime(2019, 09, 19, 19)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 20)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 21)));
  ret.add(DataPoint<DateTime>(value: 40, xAxis: DateTime(2019, 09, 19, 22)));
  ret.add(DataPoint<DateTime>(value: 0, xAxis: DateTime(2019, 09, 19, 23)));
  return ret;
}

Widget hourly(BuildContext context,List<DataPoint<dynamic>> gendata) {
  final fromDate = DateTime(2019, 09, 19,0,0,0);
  final toDate = DateTime(2019, 09, 19,23,59,59);

  return Center(
    child: Container(
      height: 200,
      width: MediaQuery.of(context).size.width - 20,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0), color: Colors.black54),
      child: BezierChart(
        bezierChartScale: BezierChartScale.HOURLY,
        fromDate: fromDate,
        toDate: toDate,
        selectedDate: toDate,
        series: [
          BezierLine(
            label: "",
            data: gendata,
            onMissingValue: (dateTime) {
              return 0;
            },
          ),
        ],
        config: BezierChartConfig(
          verticalIndicatorStrokeWidth: 3.0,
          verticalIndicatorColor: Colors.black26,
          showVerticalIndicator: false,
          verticalIndicatorFixedPosition: false,
          displayYAxis: true,
          stepsYAxis: 25,
          footerHeight: 35.0,
          backgroundColor: Colors.lightBlue,
        ),
      ),
    ),
  );
}



Widget daily(BuildContext context,List<DataPoint<dynamic>> gendata) {
  final fromDate = DateTime(2019, 09, 01);
  final toDate = DateTime(2019, 09, 31);


  return Center(
    child: Container(
      height: 200,
      width: MediaQuery.of(context).size.width - 20,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0), color: Colors.black54),
      child: BezierChart(
        fromDate: fromDate,
        bezierChartScale: BezierChartScale.WEEKLY,
        toDate: toDate,
        selectedDate: toDate,
        //this is optional
        footerDateTimeBuilder: (DateTime value, BezierChartScale scaleType) {
          final newFormat = intl.DateFormat('dd/MM');
          return newFormat.format(value);
        },
        series: [
          BezierLine(
            label: "",
            data: gendata,
            onMissingValue: (dateTime) {
              return 0;
            },
          ),
        ],
        config: BezierChartConfig(
          displayDataPointWhenNoValue: false,
          verticalIndicatorStrokeWidth: 3.0,
          pinchZoom: false,
          physics: ClampingScrollPhysics(),
          verticalIndicatorColor: Colors.black26,
          showVerticalIndicator: true,
          displayYAxis: true,
          stepsYAxis: 20,
          verticalIndicatorFixedPosition: false,
          backgroundColor: Colors.lightBlue,
        ),
      ),
    ),
  );
}

Widget monthly(BuildContext context,List<DataPoint<dynamic>> gendata) {
  final fromDate = DateTime(2019, 1, 01);
  final toDate = DateTime(2019, 12, 31);

  return Center(
    child: Container(
      height: 200,
      width: MediaQuery.of(context).size.width - 20,
      child: BezierChart(
        bezierChartScale: BezierChartScale.MONTHLY,
        fromDate: fromDate,
        toDate: toDate,
        selectedDate: toDate,
        series: [
          BezierLine(
            label: "",
            onMissingValue: (dateTime) {
              return 0;
            },
            data: gendata,
          ),
        ],
        config: BezierChartConfig(
          verticalIndicatorStrokeWidth: 3.0,
          verticalIndicatorColor: Colors.black26,
          showVerticalIndicator: false,
          verticalIndicatorFixedPosition: false,
          displayYAxis: true,
          stepsYAxis: 25,
          footerHeight: 40.0,
          backgroundColor: Colors.lightBlue,
        ),
      ),
    ),
  );
}

class EcoFootprint {
  EcoFootprint._();

  static const _kFontFam = 'EcoFootprint';

  static const IconData footprint =
  const IconData(0xe800, fontFamily: _kFontFam);
  static const IconData water_drop =
  const IconData(0xe801, fontFamily: _kFontFam);
}