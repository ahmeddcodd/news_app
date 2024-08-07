import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/Model/news_model.dart';
import 'package:news_app/Service/news_service.dart';

final Provider<NewsService> newsServiceProvider = Provider<NewsService>((_) => NewsService());

final newsProvider = FutureProvider<List<NewsModel>?>((ref) async
{
  final newsService = ref.watch(newsServiceProvider);
  List<NewsModel>? newsList= await newsService.getNewsFromApi();
  return newsList;
});