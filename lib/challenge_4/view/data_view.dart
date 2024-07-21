import 'package:flutter/material.dart';
import 'package:flutter_challenge/challenge_3/joke.dart';
import 'package:flutter_challenge/challenge_4/joke_cubit.dart';

class DataView extends StatelessWidget {
  final JokeCubit cubit;
  final Joke joke;
  final bool showPunchline;

  const DataView(
      {super.key,
      required this.cubit,
      required this.joke,
      required this.showPunchline});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: cubit.loadJoke,
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
                      onPressed: cubit.reveal, child: const Text("Reveal")),
                if (showPunchline) Text(joke.punchline),
                const SizedBox(
                  height: 8,
                ),
                ElevatedButton(
                    onPressed: cubit.loadJoke, child: const Text("Reload")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
