part of 'players_bloc.dart';

@freezed
class PlayersState with _$PlayersState {
  factory PlayersState.initial() = _PlayersStateInitial;

  factory PlayersState.loading() = _PlayersStateLoading;

  factory PlayersState.data({required List<PlayersModel> players}) =
      _PlayersStateData;

  factory PlayersState.error({required String error}) = _PlayersStateError;
}
