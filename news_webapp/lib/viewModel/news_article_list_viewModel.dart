import 'package:flutter/material.dart';

import 'package:news_webapp/services/web_service.dart';
import 'package:news_webapp/viewModel/news_article_viewModel.dart';

enum LoadingStatus { completed, searching, empty }

class NewsArticleListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.empty;
  List<NewsArticleViewModel> articles = <NewsArticleViewModel>[];

  void topHeadlines() async {
    final newsArticle = await WebService().fetchTopHeadlines();

    this.articles = newsArticle
        .map((item) => NewsArticleViewModel(newsArticle: item))
        .toList();
    print(this.articles[0].title);
    notifyListeners();
  }
}
