import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable()
class Article {
  String title;
  String author;
  String description;
  String urlToImage;

  Article();

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
