part of 'players_bloc.dart';

@freezed
class PlayersEvent with _$PlayersEvent {
  const factory PlayersEvent.findAll() = _PlayersEventFindAll;
}
