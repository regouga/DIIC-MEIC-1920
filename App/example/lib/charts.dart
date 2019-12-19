import 'package:flutter/material.dart';
import 'package:bezier_chart/bezier_chart.dart';
import 'package:intl/intl.dart' as intl;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

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
          backgroundColor: Colors.lightGreen,
        ),
      ),
    ),
  );
}

Widget daily(BuildContext context) {
  final fromDate = DateTime(2019, 09, 01);
  final toDate = DateTime(2019, 09, 31);

  final current = DateTime(2019, 09, 10);

  final date1 = DateTime.now().subtract(Duration(days: 2));
  final date2 = DateTime.now().subtract(Duration(days: 3));

  final date3 = DateTime.now().subtract(Duration(days: 35));
  final date4 = DateTime.now().subtract(Duration(days: 36));

  final date5 = DateTime.now().subtract(Duration(days: 65));
  final date6 = DateTime.now().subtract(Duration(days: 64));


  final databaseReference = Firestore.instance;

  List<DataPoint<dynamic>> getData() {
    var rng = new Random();
    List<DataPoint<DateTime>> list = new List<DataPoint<DateTime>>();
    databaseReference
        .collection("metrics")
        .getDocuments()
        .then((QuerySnapshot snapshot) {

      snapshot.documents.forEach((DocumentSnapshot doc) {
        doc.data.forEach((k,v) => {
          print('${DateTime.parse(k)}'),
          list.add(new DataPoint<DateTime>(value: rng.nextInt(100).toDouble(), xAxis: DateTime.parse(k))),
        });

      });
    });
    print(date6.toString());
    print("fodasse");
    print(list);
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
          stepsYAxis: 5,
          verticalIndicatorFixedPosition: false,
          backgroundColor: Colors.lightGreen,
        ),
      ),
    ),
  );
}

Widget monthly(BuildContext context) {
  final fromDate = DateTime(2019, 01, 01);
  final toDate = DateTime.now();

  final date1 = DateTime.now().subtract(Duration(days: 2));
  final date2 = DateTime.now().subtract(Duration(days: 3));

  final date3 = DateTime.now().subtract(Duration(days: 35));
  final date4 = DateTime.now().subtract(Duration(days: 36));

  final date5 = DateTime.now().subtract(Duration(days: 65));
  final date6 = DateTime.now().subtract(Duration(days: 64));

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
              DataPoint<DateTime>(value: 10, xAxis: date1),
              DataPoint<DateTime>(value: 50, xAxis: date2),
              DataPoint<DateTime>(value: 20, xAxis: date3),
              DataPoint<DateTime>(value: 80, xAxis: date4),
              DataPoint<DateTime>(value: 14, xAxis: date5),
              DataPoint<DateTime>(value: 30, xAxis: date6),
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
          backgroundColor: Colors.lightGreen,
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