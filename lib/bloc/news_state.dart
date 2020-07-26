import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:whatsUpIn/models/models.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

// Initial State: No news loaded
class NewsEmpty extends NewsState {}

// Fetching News
class NewsLoading extends NewsState {}

// Successfully fetched news
class NewsLoaded extends NewsState {
  final News news;

  NewsLoaded({@required this.news}) : assert(news != null);

  @override
  List<Object> get props => [news];
}

// Error fetching news
class NewsError extends NewsState {}
