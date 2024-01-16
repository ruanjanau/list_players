import 'package:dartz/dartz.dart';
import 'package:list_players/src/app/domain/entities/enitities.dart';
import 'package:list_players/src/app/domain/errors/players_error.dart';
import 'package:list_players/src/app/domain/repositories/repositories.dart';

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
