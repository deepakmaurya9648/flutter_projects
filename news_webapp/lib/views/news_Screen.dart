import 'package:flutter/material.dart';
import 'package:news_webapp/viewModel/news_article_list_viewModel.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
    var data = Provider.of<NewsArticleListViewModel>(context, listen: false);
    data.topHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    final listViewModel =
        Provider.of<NewsArticleListViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text(listViewModel.articles.length.toString())),
    );
  }
}
