import 'package:flutter/cupertino.dart';
import 'package:newsapp/models/news_model.dart';

class ListProvider extends ChangeNotifier {
  List<NewsModel> newslist;
  bool loading=true;
}