class News {
  final String title, description, url;

  News({this.title, this.description, this.url});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'],
      description: json['description'],
      url: json['url'],
    );
  }
}
