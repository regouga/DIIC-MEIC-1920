import 'package:Companion_App/charts.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

import 'globals.dart' as globals;

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool lockInBackground = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: 'Common',
            tiles: [
              SettingsTile(
                  title: 'Footprint Mode',
                  subtitle: globals.printMode(),
                  leading: Icon(EcoFootprint.footprint),
                  onTap: () {
                    return showDialog(
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                          title: Text('Select Footprint Mode'),
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                RadioListTile(
                                  title: Text("Hourly"),
                                  groupValue: globals.mode,
                                  value: globals.Modes.hourly,
                                  onChanged: (globals.Modes value) {
                                    setState(() {
                                      globals.mode = value;
                                    });
                                    Navigator.of(context).pop();
                                  },
                                ),
                                RadioListTile(
                                  title: Text("Daily"),
                                  groupValue: globals.mode,
                                  value: globals.Modes.daily,
                                  onChanged: (globals.Modes value) {
                                    setState(() {
                                      globals.mode = value;
                                    });
                                    Navigator.of(context).pop();
                                  },
                                ),
                                RadioListTile(
                                  title: Text("Monthly"),
                                  groupValue: globals.mode,
                                  value: globals.Modes.monthly,
                                  onChanged: (globals.Modes value) {
                                    setState(() {
                                      globals.mode = value;
                                    });
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    );
                  }),
            ],
          ),
          SettingsSection(
            title: 'Account',
            tiles: [
              SettingsTile(
                  title: 'Selected User',
                  subtitle: globals.printUser(),
                  leading: Icon(Icons.person),
                  onTap: () {
                    return showDialog(
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                          title: Text('Select User'),
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                RadioListTile(
                                  title: Text("John Doe"),
                                  groupValue: globals.user,
                                  value: globals.Users.john_doe,
                                  onChanged: (globals.Users value) {
                                    setState(() {
                                      globals.user = value;
                                    });
                                    Navigator.of(context).pop();
                                  },
                                ),
                                RadioListTile(
                                  title: Text("Jane Doe"),
                                  groupValue: globals.user,
                                  value: globals.Users.jane_doe,
                                  onChanged: (globals.Users value) {
                                    setState(() {
                                      globals.user = value;
                                    });
                                    Navigator.of(context).pop();
                                  },
                                ),
                                RadioListTile(
                                  title: Text("Son Doe"),
                                  groupValue: globals.user,
                                  value: globals.Users.son_doe,
                                  onChanged: (globals.Users value) {
                                    setState(() {
                                      globals.user = value;
                                    });
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    );
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
