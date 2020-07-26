import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();
}

class FetchNews extends NewsEvent {
  const FetchNews();

  @override
  List<Object> get props => [];
}
