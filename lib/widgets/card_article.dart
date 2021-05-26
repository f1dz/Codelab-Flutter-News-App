import 'package:dicoding_news_app/data/models/article.dart';
import 'package:dicoding_news_app/styles.dart';
import 'package:dicoding_news_app/ui/detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardArticle extends StatelessWidget {
  final Article article;

  const CardArticle({required this.article});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: primaryColor,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Hero(
          tag: article.urlToImage!,
          child: Image.network(
            article.urlToImage!,
            width: 100,
          ),
        ),
        title: Text(article.title),
        onTap: () => Navigator.pushNamed(context, ArticleDetailPage.routeName, arguments: article),
      ),
    );
  }
}
