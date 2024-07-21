part of 'joke_cubit.dart';

sealed class JokeState {}

final class JokeInitial extends JokeState {}

final class JokeLoading extends JokeState {}

final class JokeError extends JokeState {
  final String error;

  JokeError(this.error);
}

final class JokeLoaded extends JokeState {
  final Joke joke;
  bool showPunchline;

  JokeLoaded(this.joke, this.showPunchline);
}
