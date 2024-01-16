import 'package:dartz/dartz.dart';
import '../entities/enitities.dart';
import '../errors/players_error.dart';

abstract class IPlayersRepository {
  Future<Either<PlayersError, List<PlayersEntity>>> getAll();
}
