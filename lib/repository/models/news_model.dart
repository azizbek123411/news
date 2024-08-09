class NewsModel {
  String id;
  String name;
  String author;
  String title;
  String description;
  String url;
  String urlImage;
  DateTime publishedAt;
  String content;

  NewsModel({
    required this.content,
    required this.title,
    required this.name,
    required this.id,
    required this.description,
    required this.url,
    required this.author,
    required this.publishedAt,
    required this.urlImage,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      content: json['articles']["content"],
      title: json['articles']["title"],
      name: json['articles']['source']["name"],
      id: json['articles']['source']["id"],
      description: json['articles']["description"],
      url: json['articles']["url"],
      author: json['articles']["author"],
      publishedAt: DateTime.parse(json['articles']["publishedAt"]),
      urlImage: json['articles']['urlToImage'],
    );
  }
}
