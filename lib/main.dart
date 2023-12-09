import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:list_players/src/app/data/datasources/datasource.dart';
import 'package:list_players/src/app/presentation/views/bloc/players_bloc.dart';
import 'package:list_players/src/app/presentation/views/players.dart';

import 'src/app/presentation/views/home/home.dart';

void main() {
  Dio dio = Dio();

  runApp(
    RepositoryProvider(
      create: (context) => PlayersDataSource(dio),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/home',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          '/home': (_) => const HomePage(),
          '/bloc/players': (context) => BlocProvider(
                create: (_) =>
                    PlayersBloc(dataSource: context.read<PlayersDataSource>())
                      ..add(PlayersEvent.findAll()),
                child: const PlayersPage(),
              ),
        },
      ),
    ),
  );
}
