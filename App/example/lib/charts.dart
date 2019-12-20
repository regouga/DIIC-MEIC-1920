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
                    hourly(context),
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
                    daily(context),
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
                    monthly(context),
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
                    hourly(context),
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
                    daily(context),
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
                    monthly(context),
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
                    hourly(context),
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
                    daily(context),
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
                    monthly(context),
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
                    hourly(context),
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
                    daily(context),
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
                    monthly(context),
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
                    hourly(context),
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
                    daily(context),
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
                    monthly(context),
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

Widget hourly(BuildContext context) {
  final fromDate = DateTime.now().subtract(Duration(hours: 24));
  final toDate = DateTime.now();

  final date1 = toDate.subtract(Duration(hours: 2));
  final date2 = toDate.subtract(Duration(hours: 3));

  final date3 = toDate.subtract(Duration(hours: 10));
  final date4 = toDate.subtract(Duration(hours: 15));

  final date5 = toDate.subtract(Duration(hours: 19));
  final date6 = toDate.subtract(Duration(hours: 26));

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
            data: [
              DataPoint<DateTime>(value: 0, xAxis: date1),
              DataPoint<DateTime>(value: 50, xAxis: date2),
              DataPoint<DateTime>(value: 100, xAxis: date3),
              DataPoint<DateTime>(value: 100, xAxis: date4),
              DataPoint<DateTime>(value: 40, xAxis: date5),
              DataPoint<DateTime>(value: 47, xAxis: date6),
            ],
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

Widget daily(BuildContext context) {
  final fromDate = DateTime(2019, 09, 01);
  final toDate = DateTime(2019, 09, 31);

  final databaseReference = Firestore.instance;

  DateTime getDataFromDate() {
    var low = DateTime(2020, 09, 01);
    databaseReference
        .collection("metrics")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((DocumentSnapshot doc) {
        for(var doc in snapshot.documents){
          for (var f in doc.data.keys){
            if(DateTime.parse(f).millisecondsSinceEpoch < low.millisecondsSinceEpoch){
              low = DateTime.parse(f);
            }

          }
        }
      });
    });
    return low;
  }

  DateTime getDataToDate() {
    var high = DateTime(1990, 09, 01);
    databaseReference
        .collection("metrics")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((DocumentSnapshot doc) {
        for(var doc in snapshot.documents){
          for (var f in doc.data.keys){
            if(DateTime.parse(f).millisecondsSinceEpoch > high.millisecondsSinceEpoch){
              high = DateTime.parse(f);
            }

          }
        }
      });
    });
    return high;
  }

  List<DataPoint<dynamic>> getData() {
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
//    print(getDataFromDate());
//    print(getDataToDate());
    return list;
  }



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
            data: getData(),
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

Widget monthly(BuildContext context) {
  final fromDate = DateTime(2019, 01, 01);
  final toDate = DateTime(2019, 12, 01);

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
              if (dateTime.month.isEven) {
                return 10.0;
              }
              return 5.0;
            },
            data: [
              DataPoint<DateTime>(value: 70, xAxis: DateTime(2019, 01, 01)),
              DataPoint<DateTime>(value: 65, xAxis: DateTime(2019, 02, 01)),
              DataPoint<DateTime>(value: 60, xAxis: DateTime(2019, 03, 01)),
              DataPoint<DateTime>(value: 70, xAxis: DateTime(2019, 04, 01)),
              DataPoint<DateTime>(value: 50, xAxis: DateTime(2019, 05, 01)),
              DataPoint<DateTime>(value: 60, xAxis: DateTime(2019, 06, 01)),
              DataPoint<DateTime>(value: 40, xAxis: DateTime(2019, 07, 01)),
              DataPoint<DateTime>(value: 30, xAxis: DateTime(2019, 08, 01)),
              DataPoint<DateTime>(value: 40, xAxis: DateTime(2019, 09, 01)),
              DataPoint<DateTime>(value: 70, xAxis: DateTime(2019, 10, 01)),
              DataPoint<DateTime>(value: 80, xAxis: DateTime(2019, 11, 01)),
              DataPoint<DateTime>(value: 50, xAxis: DateTime(2019, 12, 01)),
            ],
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