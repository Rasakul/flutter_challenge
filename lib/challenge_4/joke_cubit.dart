import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import '../challenge_3/joke.dart';

part 'joke_state.dart';

final client = Dio();
// API Documentation: https://github.com/15Dkatz/official_joke_api
const String baseUrl = "https://official-joke-api.appspot.com/jokes/random";

class JokeCubit extends Cubit<JokeState> {
  bool _showPunchline = false;
  bool _isRefresh = true;
  Joke? _currentJoke;

  JokeCubit() : super(JokeInitial());

  Future<void> loadJoke() async {
    _isRefresh = true;
    getJoke();
  }

  Future<void> reveal() async {
    _showPunchline = true;
    emit(JokeLoaded(_currentJoke!, true));
  }

  Future<void> getJoke() async {
    if (_isRefresh) {
      emit(JokeLoading());
      Response response = await client.get(baseUrl);
      final joke = Joke.fromJson(response.data);
      _currentJoke = joke;
      _isRefresh = false;
      _showPunchline = false;
    }
    emit(JokeLoaded(_currentJoke!, false));
  }
}
