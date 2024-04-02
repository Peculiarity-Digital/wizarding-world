part of 'house_entity.dart';

class HouseTraitEntity extends Equatable {
  const HouseTraitEntity({
    this.id,
    this.name,
  });

  final String? id;
  final String? name;

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
