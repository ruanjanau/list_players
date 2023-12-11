import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart'; // Adicione esta importação
import 'package:dio/dio.dart'; // Adicione esta importação se ainda não estiver importada

import 'src/app/data/datasources/datasource.dart';
import 'src/app/presentation/views/bloc/players_bloc.dart';
import 'src/app/presentation/views/players.dart';

import 'src/app/presentation/views/home/home.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<PlayersDataSource>(
          create: (_) => PlayersDataSource(Dio()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      },
    );
  }
}
