import 'package:doors_tour_app/constants/constants.dart';
import 'package:xml/xml.dart';

class NewsModel {
  String title;
  String? image;
  String link;
  String description;
  Map<String, String> source;
  DateTime publishedAt;

  NewsModel({
    required this.title,
    this.image,
    required this.link,
    required this.description,
    required this.source,
    required this.publishedAt,
  });

  factory NewsModel.fromXML(XmlElement element) {
    return NewsModel(
      title: element.findElements("title").first.text,
      link: element.findElements("link").first.text,
      description: element.findElements("description").first.text,
      source: {
        "name": element.findElements("source").first.text,
        "url": element.findElements("source").first.attributes[0].value,
      },
      publishedAt: Constants.gmtFormatter
          .parse(element.findElements("pubDate").first.text),
    );
  }
}
