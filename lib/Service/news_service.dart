import "dart:convert";
import "package:flutter/cupertino.dart";
import "package:http/http.dart" as http;
import "package:http/http.dart";
import "package:news_app/API/api_key.dart";
import "package:news_app/Model/news_model.dart";

class NewsService
{
   Future<List<NewsModel>?> getNewsFromApi() async
  {
    try{
      Response response = await http.get(Uri.parse("https://newsapi.org/v2/everything?q=bitcoin&apiKey=$apiKey"));
      if(response.statusCode == 200)
      {
         debugPrint("Successfull");
         final  Map<String, dynamic> data = await json.decode(response.body);
         final List<dynamic> articles = data["articles"];
         final List<NewsModel> newsList = articles.map((news){
          return NewsModel(title: news["title"]);
         }).toList();
         debugPrint(newsList.toString());
         return newsList;
      }
    }
    catch(e)
    {
        debugPrint("The error is $e");
    }
  return null;
  }
}