part of 'elixir_entity.dart';

class ElixirInventorEntity extends Equatable {
  const ElixirInventorEntity({
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
