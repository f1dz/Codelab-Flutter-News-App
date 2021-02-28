import 'package:dicoding_news_app/article_webview.dart';
import 'package:dicoding_news_app/detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'news_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(primarySwatch: Colors.blue, visualDensity: VisualDensity.adaptivePlatformDensity),
      initialRoute: NewsListPage.routeName,
      routes: {
        NewsListPage.routeName: (context) => NewsListPage(),
        ArticleDetailPage.routeName: (context) =>
            ArticleDetailPage(article: ModalRoute.of(context).settings.arguments),
        ArticleWebView.routeName: (context) => ArticleWebView(
              url: ModalRoute.of(context).settings.arguments,
            )
      },
    );
  }
}
