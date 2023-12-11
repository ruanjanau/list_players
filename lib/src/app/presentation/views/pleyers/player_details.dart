import 'package:flutter/material.dart';
import '../../../data/models/players_model.dart';
import '../../components/components.dart';

import 'components/components.dart';

class PlayerDetails extends StatelessWidget {
  final PlayersModel player;
  const PlayerDetails({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Detalhes do Jogador',
      ),
      body: ListView(
        children: [
          SizedBox(
            width: double.infinity,
            height: 300.0,
            child: Image.network(
              fit: BoxFit.cover,
              player.image!,
              width: double.maxFinite,
              height: 300.0,
            ),
          ),
          const SizedBox(height: 20.0),
          PlayerDetailItem(label: 'Nome do Jogador', value: player.name!),
          PlayerDetailItem(label: 'Idade', value: player.idade!),
          PlayerDetailItem(
              label: 'Data de Nascimento', value: player.aniversario!),
          PlayerDetailItem(label: 'Profissão', value: player.profession!),
          PlayerDetailItem(label: 'Time Atual', value: player.team!),
          PlayerDetailItem(label: 'País de Origem', value: player.country!),
        ],
      ),
    );
  }
}
