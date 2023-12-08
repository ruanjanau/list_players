import 'package:list_players/src/app/domain/entities/enitity.dart';

class PlayersModel {
  final int? id;
  final String? name;
  final int? idade;
  final String? aniversario;
  final String? profession;
  final String? image;

  PlayersModel({
    this.id,
    this.name,
    this.idade,
    this.aniversario,
    this.profession,
    this.image,
  });

  factory PlayersModel.fromJson(dynamic map) {
    return PlayersModel(
      id: map['id']?.toInt(),
      name: map['name'] ?? '',
      idade: map['idade']?.toInt(),
      aniversario: map['aniversario'] ?? '',
      profession: map['profession'] ?? '',
      image: map['image'] ?? '',
    );
  }

  PlayersEntity toEntity() {
    return PlayersEntity(
      id: id ?? 0,
      name: name ?? '',
      idade: idade ?? 0,
      aniversario: aniversario ?? '',
      profession: profession ?? '',
      image: image ?? '',
    );
  }
}
