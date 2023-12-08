import 'dart:async';
import 'package:dio/dio.dart';

import 'package:list_players/src/app/data/models/players_model.dart';

abstract class IPlayersDataSource {
  FutureOr<List<PlayersModel>> getPlayers();
}

class PlayersDataSource implements IPlayersDataSource {
  final Dio dio;

  PlayersDataSource(this.dio);
  @override
  FutureOr<List<PlayersModel>> getPlayers() async {
    final response =
        await dio.get('https://6573803a063f876cec9cf9f6.mockapi.io/users/');

    return (response.data as List).map(PlayersModel.fromJson).toList();
  }
}
