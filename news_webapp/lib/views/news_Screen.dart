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
    var listViewModel =
        Provider.of<NewsArticleListViewModel>(context, listen: false);
    print(listViewModel.getArticles);
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<NewsArticleListViewModel>(
        builder: (context, provider, chld) => Container(
          child: Text(listViewModel.articles[0].title),
        ),
      ),
    );
  }
}
