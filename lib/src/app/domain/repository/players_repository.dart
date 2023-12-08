import 'package:dartz/dartz.dart';
import 'package:list_players/src/app/domain/entities/enitity.dart';
import 'package:list_players/src/app/domain/error/players_error.dart';

abstract class IPlayersRepository {
  Future<Either<PlayersError, List<PlayersEntity>>> getAll();
}
