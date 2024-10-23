class NewsModel {
  String? id;
  String? name;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlImage;
  String? publishedAt;
  String? content;

  NewsModel({
    this.content,
    this.title,
    this.name,
    this.id,
    this.description,
    this.url,
    this.author,
    this.publishedAt,
    this.urlImage,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      content: json["content"],
      title: json["title"],
      name: json['source']["name"],
      id: json['source']["id"],
      description: json["description"],
      url: json["url"],
      author: json["author"],
      publishedAt: json['publishedAt'],
      urlImage: json['urlToImage'],
    );
  }
}
