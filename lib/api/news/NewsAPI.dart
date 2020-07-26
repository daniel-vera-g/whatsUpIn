import 'dart:convert';
import 'package:flutter/material.dart';

import '../../models/models.dart';
import 'package:http/http.dart' as http;
import 'package:dotenv/dotenv.dart' show env;

class NewsApiClient {
  String country;
  final String _baseUrl = 'http://newsapi.org/v2/top-headlines?';
  final String key = env["API_KEY"];
  final http.Client httpClient;

  NewsApiClient({
    @required this.httpClient,
    this.country,
  }) : assert(httpClient != null);

  // Fetch current news and return them in JSON format
  Future<News> fetchNews() async {
    String url = '${_baseUrl}country=$country&apiKey=$key';
    final response = await this.httpClient.get(url);

    if (response.statusCode != 200) {
      throw Exception('Failed to query latest news from API');
    }
    
    final jsonNews = json.decode(response.body);
    return News.fromJson(jsonNews);
  }
}
