import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsUpIn/bloc/bloc.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        // Iterate through different states and load right information
        if (state is NewsEmpty) {
          BlocProvider.of<NewsBloc>(context).add(FetchNews()); 
        }
        if (state is NewsError) {
          return Center(
            child: Text('Failed to fetch News'),
          );
        }
        if(state is NewsLoaded) {
          return ListTile(
            leading: Text(
              // TODO add id or something alike
              "News Item:"
            ),
            title: Text(state.news.title),
            isThreeLine: true,
            subtitle: Text(state.news.description),
            dense: true,
          );
        } 
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}