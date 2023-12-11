import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/model.dart';
import 'components/components.dart';
import '../bloc/players_bloc.dart';

class PlayersPage extends StatelessWidget {
  const PlayersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Players'),
      ),
      body: BlocListener<PlayersBloc, PlayersState>(
        listenWhen: (previous, current) {
          return current.maybeWhen(
            error: (error) => true,
            orElse: () => false,
          );
        },
        listener: (context, state) {
          state.whenOrNull(error: (error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  error,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Colors.red,
              ),
            );
          });
        },
        child: BlocSelector<PlayersBloc, PlayersState, List<PlayersModel>>(
          selector: (state) {
            return state.maybeWhen(
              data: (players) => players,
              orElse: () => [],
            );
          },
          builder: (_, players) {
            if (players.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: players.length,
                itemBuilder: (context, index) {
                  final player = players[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/bloc/player_details/',
                        arguments: player,
                      );
                    },
                    child: PlayersTile(
                      name: player.name!,
                      profession: player.profession!,
                      image: player.image!,
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
