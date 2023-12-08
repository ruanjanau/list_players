import 'package:dartz/dartz.dart';
import 'package:list_players/src/app/domain/entities/enitity.dart';
import 'package:list_players/src/app/domain/error/players_error.dart';
import 'package:list_players/src/app/domain/repository/repository.dart';

abstract class IGetPlayersUseCase {
  Future<Either<PlayersError, List<PlayersEntity>>> call();
}

class PlayersUseCase implements IGetPlayersUseCase {
  final IPlayersRepository repository;

  PlayersUseCase(this.repository);
  @override
  Future<Either<PlayersError, List<PlayersEntity>>> call() {
    return repository.getAll();
  }
}
