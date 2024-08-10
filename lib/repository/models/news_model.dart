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
      content: json['articles']["content"],
      title: json['articles']["title"],
      name: json['articles']['source']["name"],
      id: json['articles']['source']["id"],
      description: json['articles']["description"],
      url: json['articles']["url"],
      author: json['articles']["author"],
      publishedAt: json['articles']['publishedAt'],
      urlImage: json['articles']['urlToImage'],
    );
  }
}
