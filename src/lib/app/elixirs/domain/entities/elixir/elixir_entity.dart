library elixir;

import 'package:equatable/equatable.dart';
import 'package:wizarding_world/lib.dart';

part 'elixir_ingredient_entity.dart';
part 'elixir_inventor_entity.dart';

class ElixirEntity extends Equatable {
  const ElixirEntity({
    this.id,
    this.name,
    this.effect,
    this.sideEffect,
    this.characteristics,
    this.time,
    this.difficulty,
    this.ingredients,
    this.inventors,
    this.manufacturer,
  });

  final String? id;
  final String? name;
  final String? effect;
  final String? sideEffect;
  final String? characteristics;
  final String? time;
  final ElixirDifficulty? difficulty;
  final List<ElixirIngredientEntity>? ingredients;
  final List<ElixirInventorEntity>? inventors;
  final String? manufacturer;

  @override
  List<Object?> get props => [
        id,
        name,
        effect,
        sideEffect,
        characteristics,
        time,
        difficulty,
        ingredients,
        inventors,
        manufacturer,
      ];
}
