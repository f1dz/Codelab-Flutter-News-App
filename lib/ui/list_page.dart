import 'package:dicoding_news_app/data/api/api_service.dart';
import 'package:dicoding_news_app/data/models/article.dart';
import 'package:dicoding_news_app/widgets/card_article.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsListPage extends StatefulWidget {
  static const routeName = "/article_list";
  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  late Future<ArticleResult> _article;

  @override
  void initState() {
    super.initState();
    _article = ApiService().topHeadLines();
  }

  // Widget _buildList(BuildContext context) {}
  // Widget _buildAndroid(BuildContext context) {}
  // Widget _buildIos(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('News App')),
      body: FutureBuilder<ArticleResult>(
        future: _article,
        builder: (context, AsyncSnapshot<ArticleResult> snapshot) {
          var state = snapshot.connectionState;
          if (state != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.data != null) {
              return ListView.builder(
                  itemCount: snapshot.data?.articles.length,
                  itemBuilder: (context, index) {
                    var article = snapshot.data?.articles[index];
                    return CardArticle(article: article!);
                  });
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else {
              return Container();
            }
          }
        },
      ),
    );
  }
}
