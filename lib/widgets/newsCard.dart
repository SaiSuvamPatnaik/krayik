import 'package:cached_network_image/cached_network_image.dart';
import 'package:doors_tour_app/constants/constants.dart';
import 'package:doors_tour_app/models/news.dart';
import 'package:doors_tour_app/services/newsService.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeAgo;
import 'package:url_launcher/url_launcher.dart';

class NewsCard extends StatelessWidget {
  final NewsModel news;
  NewsCard({Key? key, required this.news}) : super(key: key);

  Future<CachedNetworkImage> _getImage() async {
    String link = await NewsServices().getPreviewImage(news.link);

    return CachedNetworkImage(
      imageUrl: link,
      imageBuilder: (context, imageProvider) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        );
      },
      errorWidget: (context, url, error) => Container(),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(8),
      leading: Container(
        height: MediaQuery.of(context).size.width / 5,
        width: MediaQuery.of(context).size.width / 5,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Constants.kPrimaryColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: FutureBuilder<CachedNetworkImage>(
          future: _getImage(),
          builder: (context, snapshot) => Container(child: snapshot.data),
        ),
      ),
      title: Text(
        news.title,
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
        ),
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Icon(
                  Icons.history,
                  color: Constants.kPrimaryColor,
                  size: 14,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Updated ${timeAgo.format(news.publishedAt)}",
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () => _launchURL(news.link),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Constants.kPrimaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  "Read Now",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
