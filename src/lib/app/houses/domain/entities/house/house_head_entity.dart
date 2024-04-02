part of 'house_entity.dart';

class HouseHeadEntity extends Equatable {
  const HouseHeadEntity({
    this.id,
    this.firstName,
    this.lastName,
  });

  final String? id;
  final String? firstName;
  final String? lastName;

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
      ];
}
