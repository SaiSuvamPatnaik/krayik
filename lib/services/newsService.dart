import 'package:doors_tour_app/models/news.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart' as html;
import 'package:http/http.dart';
import 'package:xml/xml.dart';

import 'dart:core';

import 'package:flutter/material.dart' as cvn;

class NewsServices {
  Future<List<NewsModel>> allNews() async {
    Response response = await get(
      Uri.parse('https://news.google.com/rss?hl=en-IN&gl=IN&ceid=IN:en'),
    );
    XmlDocument xmlData = XmlDocument.parse(response.body);
    Iterable<XmlElement> items = xmlData.findAllElements("item");
    print(xmlData);
    return items.map((e) => NewsModel.fromXML(e)).toList();
  }

  Future<List<NewsModel>> globalNews() async {
    Response response = await get(
      Uri.parse(
          'https://news.google.com/rss/topics/CAAqKAgKIiJDQkFTRXdvS0wyMHZNREp3Ylc0eWNSSUZaVzR0UjBJb0FBUAE?hl=en-IN&gl=IN&ceid=IN:en'),
    );
    XmlDocument xmlData = XmlDocument.parse(response.body);
    Iterable<XmlElement> items = xmlData.findAllElements("item");
    print(xmlData);
    return items.map((e) => NewsModel.fromXML(e)).toList();
  }

  Future<List<NewsModel>> reitNews() async {
    Response response = await get(
      Uri.parse(
          'https://news.google.com/rss/search?q=REITs&hl=en-IN&gl=IN&ceid=IN:en'),
    );
    XmlDocument xmlData = XmlDocument.parse(response.body);
    Iterable<XmlElement> items = xmlData.findAllElements("item");
    print(xmlData);
    return items.map((e) => NewsModel.fromXML(e)).toList();
  }

  Future<List<NewsModel>> invitNews() async {
    Response response = await get(
      Uri.parse(
          'https://news.google.com/rss/search?q=InvITs&hl=en-IN&gl=IN&ceid=IN:en'),
    );
    XmlDocument xmlData = XmlDocument.parse(response.body);
    Iterable<XmlElement> items = xmlData.findAllElements("item");
    print(xmlData);
    return items.map((e) => NewsModel.fromXML(e)).toList();
  }

  Future<List<NewsModel>> financeNews() async {
    Response response = await get(
      Uri.parse(
          'https://news.google.com/rss/topics/CAAqJQgKIh9DQkFTRVFvSUwyMHZNREpmTjNRU0JXVnVMVWRDS0FBUAE?hl=en-IN&gl=IN&ceid=IN:en'),
    );
    XmlDocument xmlData = XmlDocument.parse(response.body);
    Iterable<XmlElement> items = xmlData.findAllElements("item");
    print(xmlData);
    return items.map((e) => NewsModel.fromXML(e)).toList();
  }

  Future<String> getPreviewImage(String url) async {
    Response response = await get(Uri.parse(url));
    Document data = html.parse(response.body);
    Element tag = data
        .getElementsByTagName("meta")
        .firstWhere((element) => element.attributes['property'] == "og:image");
    return tag.attributes['content'].toString();
  }
}

class countmodel extends cvn.ChangeNotifier {
  int topListViewIndex = 0;
  int countervalvalue() {
    return topListViewIndex;
  }

  void increament(int value) {
    topListViewIndex = value;
    notifyListeners();
  }
}
