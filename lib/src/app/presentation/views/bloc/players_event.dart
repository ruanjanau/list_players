part of 'players_bloc.dart';

@freezed
class PlayersEvent with _$PlayersEvent {
  factory PlayersEvent.findAll() = _PlayersEventFindAll;
}
