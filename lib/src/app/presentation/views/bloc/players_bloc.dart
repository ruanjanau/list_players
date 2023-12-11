import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:list_players/src/app/data/datasources/datasource.dart';

import '../../../data/models/model.dart';

part 'players_event.dart';
part 'players_state.dart';
part 'players_bloc.freezed.dart';

class PlayersBloc extends Bloc<PlayersEvent, PlayersState> {
  final PlayersDataSource _dataSource;
  PlayersBloc({required PlayersDataSource dataSource})
      : _dataSource = dataSource,
        super(PlayersState.initial()) {
    on<_PlayersEventFindAll>(_findAll);
  }

  Future<void> _findAll(
      _PlayersEventFindAll event, Emitter<PlayersState> emit) async {
    try {
      emit(PlayersState.loading());
      final players = await _dataSource.getPlayers();
      await Future.delayed(const Duration(seconds: 2));
      // throw Exception();
      emit(PlayersState.data(players: players));
    } catch (e) {
      emit(PlayersState.error(error: 'Error loading players'));
    }
  }
}
