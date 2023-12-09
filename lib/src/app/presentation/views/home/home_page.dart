import 'package:flutter/material.dart';
import '../players.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const PlayersPage()));
            },
            child: const Text('Ver Lista de Players')),
      ),
    );
  }
}
