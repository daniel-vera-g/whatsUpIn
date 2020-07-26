import 'package:flutter/material.dart';
import 'package:whatsUpIn/models/news/News.dart';
import '../../api/news/NewsAPI.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<News> futureNews;

  @override
  void initState() { 
    super.initState();
    futureNews = fetchNews(); 
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Latest news:"),
      ),
      body: new Container(
        child: new Center(
          child: FutureBuilder(
            future: futureNews,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return (snapshot.data.Title);
              } else if(snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              return CircularProgressIndicator();
            },
          ),
        )
      )
    );
  }
}