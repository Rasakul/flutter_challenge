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
  bool showPunchline = false;
  bool refresh = true;
  Joke? joke;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: FutureBuilder(
          future: loadRandomJoke(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              final joke = snapshot.data!;
              return RefreshIndicator(
                onRefresh: _refresh,
                child: Center(
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(joke.setup),
                          const SizedBox(
                            height: 8,
                          ),
                          if (!showPunchline)
                            ElevatedButton(
                                onPressed: () => {
                                      setState(() {
                                        showPunchline = true;
                                      })
                                    },
                                child: const Text("Reveal")),
                          if (showPunchline) Text(joke.punchline),
                          const SizedBox(
                            height: 8,
                          ),
                          ElevatedButton(
                              onPressed: _refresh, child: const Text("Reload")),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }

  Future<void> _refresh() async {
    return setState(() {
      refresh = true;
    });
  }

  Future<Joke> loadRandomJoke() async {
    if (refresh) {
      Response response = await client.get(baseUrl);
      final joke = Joke.fromJson(response.data);
      this.joke = joke;
      refresh = false;
      showPunchline = false;
    }
    return joke!;
  }
}
