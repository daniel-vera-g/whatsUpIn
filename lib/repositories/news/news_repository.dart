import 'package:meta/meta.dart';
import 'package:whatsUpIn/models/news/News.dart';

import 'news_api_client.dart';

class NewsRepository {
  final NewsApiClient newsApiClient;

  NewsRepository({@required this.newsApiClient}) : assert(newsApiClient != null);

  Future<News> fetchNews() async {
    return await newsApiClient.fetchNews();
  }
}