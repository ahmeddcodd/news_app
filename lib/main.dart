import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:news_app/Screen/welcome_screen.dart";

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
    home: WelcomeScreen(),
  );
}