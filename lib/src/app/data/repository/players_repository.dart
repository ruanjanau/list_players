import 'package:dartz/dartz.dart';
import 'package:list_players/src/app/data/datasources/datasource.dart';

import 'package:list_players/src/app/domain/entities/players_entity.dart';

import 'package:list_players/src/app/domain/error/players_error.dart';

import '../../domain/repository/repository.dart';

class PlayersRepository implements IPlayersRepository {
  final IPlayersDataSource dataSource;

  PlayersRepository(this.dataSource);
  @override
  Future<Either<PlayersError, List<PlayersEntity>>> getAll() async {
    try {
      var result = await dataSource.getPlayers();
      return Right(result.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(PlayersError.unexpected());
    }
  }
}
