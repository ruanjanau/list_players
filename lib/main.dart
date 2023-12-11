import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
import 'src/app/data/datasources/datasource.dart';
import 'src/app/data/models/model.dart';
import 'src/app/presentation/views/bloc/players_bloc.dart';
import 'src/app/presentation/views/home/home.dart';
import 'src/app/presentation/views/pleyers/players.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<PlayersDataSource>(
          create: (_) => PlayersDataSource(Dio()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/home',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          '/home': (_) => const HomePage(),
          '/bloc/players/': (context) => BlocProvider(
                create: (context) =>
                    PlayersBloc(dataSource: context.read<PlayersDataSource>())
                      ..add(const PlayersEvent.findAll()),
                child: const PlayersPage(),
              ),
          '/bloc/player_details/': (context) {
            final player =
                ModalRoute.of(context)!.settings.arguments as PlayersModel;
            return PlayerDetails(player: player);
          },
        },
      ),
    ),
  );
}
