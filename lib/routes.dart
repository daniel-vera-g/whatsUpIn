import 'package:flutter/material.dart';
import 'screens/home/Home.dart';

class Routes {

  Routes() {
    runApp(new MaterialApp(
      title: 'WhatsUpIn?',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: new Home(),
    ));
  }
}
