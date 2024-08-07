import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:news_app/Model/news_model.dart";
import "package:news_app/Provider/news_provider.dart";

class WelcomeScreen extends ConsumerWidget
{
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
    body: SafeArea(
      child: Consumer(builder: (context, ref, child) {
       final value = ref.watch(newsProvider);
       return value.when(
        data: (data) => data == null? const CircularProgressIndicator() : ListView.separated(
          itemCount: data.length,
          itemBuilder: (context, index){
            final NewsModel news = data[index];
            return ListTile(
              title: Text(news.getTitle!),
            );
          },
        separatorBuilder: (context, index) => const Divider()),
        error: (_, __) => const Text("Error 404"), 
        loading: () => const CircularProgressIndicator());
    },)),
  );
}