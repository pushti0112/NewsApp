

import 'package:flutter/foundation.dart';
import 'package:newsapp/models/news_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsController {



  Future<List<NewsModel>> getNews() async{

    List<NewsModel> news  = [];

    String url = "https://newsapi.org/v2/top-headlines?country=in&apiKey=07dfdd55fd314d12a8eb8b7ef47827ee";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){

      jsonData["articles"].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){
          NewsModel newsModel = NewsModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(newsModel);
        }

      });
      return news;
    }
    else{
      return news;
    }

  }

  Future< List<NewsModel>> getNewsbySources(String sources) async{
    List<NewsModel> news  = [];
    String url;
    if(sources == "recent")
      {
        url = "https://newsapi.org/v2/everything?q=corona&sortBy=publishedAt&apiKey=ff7ced1f29b745f2be77fb9161cc000d";
      }
    else{
      url =  "https://newsapi.org/v2/top-headlines?country=$sources&apiKey=ff7ced1f29b745f2be77fb9161cc000d";
    }

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){
          NewsModel newsModel = NewsModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(newsModel);
        }

      });
      return news;
    }
    else{
      return news;
    }


  }

  Future< List<NewsModel>> getNewsbySearch(String searchkey) async{
    List<NewsModel> news  = [];
    String url = "https://newsapi.org/v2/everything?q=$searchkey&apiKey=ff7ced1f29b745f2be77fb9161cc000d";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){
          NewsModel newsModel = NewsModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(newsModel);
        }

      });
      return news;
    }
    else{
      return news;
    }

  }



}