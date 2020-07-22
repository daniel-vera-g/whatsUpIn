import 'package:flutter/material.dart';
import 'widgets/simple_button/index.dart';


class Feature extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Flutter template"),
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new SimpleButton(),
            ],
          )
        )
      )
    );
  }
}