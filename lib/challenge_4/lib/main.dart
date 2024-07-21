import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/challenge_4/lib/joke.dart';

final client = Dio();
// API Documentation: https://github.com/15Dkatz/official_joke_api
const String baseUrl = "https://official-joke-api.appspot.com/jokes/random";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Challenge 4',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Challenge4Page(title: 'Challenge 4 Page'),
    );
  }
}

// Challenge 4: Cubits
//
// Refactor the previous challenge to use a Cubit. Implement a loading, data
// and error state. Keep the rest of the functionalities. Use a BlocProvider
// instead of a FutureBuilder. Make sure, that there is a loading state after
// reloading before showing new data.
//
// Useful links:
// https://medium.com/codex/flutter-bloc-an-introduction-with-cubit-7eae1e740fd0
// https://burakakten.medium.com/flutter-bloc-cubit-5ee4d053f61d

class Challenge4Page extends StatefulWidget {
  final String title;

  const Challenge4Page({super.key, required this.title});

  @override
  State<Challenge4Page> createState() => _Challenge4PageState();
}

class _Challenge4PageState extends State<Challenge4Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(),
    );
  }

  Future<Joke> loadRandomJoke() async {
    Response response = await client.get(baseUrl);
    return Joke.fromJson(response.data);
  }
}
