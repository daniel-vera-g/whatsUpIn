import 'package:flutter/material.dart';
import 'screens/feature/index.dart';

class Routes {
  final routes = <String, WidgetBuilder>{
    '/Feature': (BuildContext context) => new Feature()
  };

  Routes() {
    runApp(new MaterialApp(
      title: 'Flutter Template',
      routes: routes,
      home: new Feature(),
    ));
  }
}
