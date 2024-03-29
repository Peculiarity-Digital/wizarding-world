library house;

import 'package:equatable/equatable.dart';

part './house_head.dart';
part './house_trait.dart';

class HouseEntity extends Equatable {
  const HouseEntity({
    this.id,
    this.name,
    this.houseColours,
    this.founder,
    this.animal,
    this.element,
    this.ghost,
    this.commonRoom,
    this.heads,
    this.traits,
  });

  final String? id;
  final String? name;
  final String? houseColours;
  final String? founder;
  final String? animal;
  final String? element;
  final String? ghost;
  final String? commonRoom;
  final List<HouseHeadEntity>? heads;
  final List<HouseTraitEntity>? traits;

  @override
  List<Object?> get props => [
        id,
        name,
        houseColours,
        founder,
        animal,
        element,
        ghost,
        commonRoom,
        heads,
        traits,
      ];
}
