import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(
              '/bloc/players/',
            );
          },
          child: const Text('Ver Lista de Players'),
        ),
      ),
    );
  }
}
