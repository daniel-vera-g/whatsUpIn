import 'dart:convert';
import '../../models/news/News.dart';
import 'package:http/http.dart' as http; 
import 'package:dotenv/dotenv.dart' show load, env;


Future<News> fetchNews() async {
  load();

  var key = env['API_KEY'];
  // TODO make dynamic
  var url = 'http://newsapi.org/v2/top-headlines?' +
          'country=de&' +
          'apiKey='+key;

  final response = await http.get(url);

  if (response.statusCode == 200) {
    return News.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to query latest news from API');
  }
}
