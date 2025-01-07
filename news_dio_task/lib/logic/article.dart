class Article {
  final String? title;
  final String? description;
  final String? urlToImage;
  final String? url;

  Article({
    this.title,
    this.description,
    this.urlToImage,
    this.url,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] is String ? json['title'] : null,
      description: json['description'] is String ? json['description'] : null,
      urlToImage: json['urlToImage'] is String ? json['urlToImage'] : null,
      url: json['url'] is String ? json['url'] : null,
    );
  }
}
