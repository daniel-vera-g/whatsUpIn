import 'package:flutter/material.dart';
import 'package:whatsUpIn/repositories/repositories.dart';
import 'package:whatsUpIn/repositories/news/news_api_client.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsUpIn/bloc/bloc.dart';
import 'screens/home/Home.dart';

// Log the current state transition
class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

void main() {
  final NewsRepository repository =
      NewsRepository(newsApiClient: NewsApiClient(httpClient: http.Client()));

  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(App(repository: repository));
}

class App extends StatelessWidget {
  final NewsRepository repository;

  const App({Key key, @required this.repository})
      : assert(repository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsUpIn?',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('WhatsUpIn?')
        ),
        body: BlocProvider(
          create: (context) => NewsBloc(repository: repository),
          child: Home(),
          ),
      )
    );
  }
}
