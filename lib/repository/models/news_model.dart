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

  factory NewsModel.fromJson(Map<String, dynamic> json){
    return NewsModel(
      content: json["content"],
      title: json["title"],
      name: json['source']["name"],
      id: json['source']["id"],
      description: json["description"],
      url: json["url"],
      author: json["author"],
      publishedAt: DateTime.parse(json["publishedAt"]),
      urlImage:json['urlToImage'],);
  }
}
