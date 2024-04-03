part of 'elixir_entity.dart';

class ElixirIngredientEntity extends Equatable {
  const ElixirIngredientEntity({
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
