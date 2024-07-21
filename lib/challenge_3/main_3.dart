import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/challenge_3/joke.dart';

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
      title: 'Challenge 3',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Challenge3Page(title: 'Challenge 3 Page'),
    );
  }
}

// Challenge 3: consume API and display data
//
// Use the FutureBuilder to load a random joke with loadRandomJoke(). Display
// joke.setup and a "reveal" button. After pressing the button, show
// joke.punchline instead of the button. Also add a refresh button to load a new joke.
// Use a state-variable with setState to show/hide elements with the button.
//
// Useful links:
// https://api.flutter.dev/flutter/widgets/FutureBuilder-class.html
// https://daniyal-dolare.medium.com/how-to-use-future-builder-effectively-in-flutter-9c0550d2affd
//
// Bonus: replace the refresh button with a RefreshIndicator
// https://api.flutter.dev/flutter/material/RefreshIndicator-class.html

class Challenge3Page extends StatefulWidget {
  final String title;

  const Challenge3Page({super.key, required this.title});

  @override
  State<Challenge3Page> createState() => _Challenge3PageState();
}

class _Challenge3PageState extends State<Challenge3Page> {
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
