import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './bloc.dart';
import '../models/models.dart';
import '../repositories/repositories.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository repository;

  NewsBloc({@required this.repository}) : assert(NewsBloc != null);

  @override
  NewsState get initialState => NewsEmpty();

  @override
  Strem<NewsState>  mapEventToState(NewsEvent event) async* {
    if (event is FetchNews) {
      yield NewsLoading();
      try {
        final News news = await repository.fetchNews(); 
        yield NewsLoaded(news: news);
      } catch (_) {
        yield NewsError();
      }
    } 
  }
}