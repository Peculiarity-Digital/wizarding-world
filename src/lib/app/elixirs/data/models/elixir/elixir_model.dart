library elixir;

import 'package:wizarding_world/lib.dart';

part 'elixir_ingredient_model.dart';
part 'elixir_inventor_model.dart';

class ElixirModel extends ElixirEntity {
  const ElixirModel({
    super.id,
    super.name,
    super.effect,
    super.sideEffect,
    super.characteristics,
    super.time,
    super.difficulty,
    List<ElixirIngredientModel>? super.ingredients,
    List<ElixirInventorModel>? super.inventors,
    super.manufacturer,
  });

  factory ElixirModel.fromJson(Map<String, dynamic> map) {
    final ingredients = (map['ingredients'] as List)
        .map((e) => ElixirIngredientModel.fromJson(e as Map<String, dynamic>))
        .toList();
    final inventors = (map['inventors'] as List)
        .map((e) => ElixirInventorModel.fromJson(e as Map<String, dynamic>))
        .toList();

    return ElixirModel(
      id: map['id'].toString(),
      name: map['name'].toString(),
      effect: map['effect'].toString(),
      sideEffect: map['sideEffect'].toString(),
      characteristics: map['characteristics'].toString(),
      time: map['time'].toString(),
      difficulty: '${map['difficulty']}'.toElixirDifficulty(),
      ingredients: ingredients,
      inventors: inventors,
      manufacturer: map['manufacturer'].toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'effect': effect,
        'sideEffect': sideEffect,
        'characteristics': characteristics,
        'time': time,
        'difficulty': difficulty,
        'ingredients': ingredients
            ?.map(
              (e) => (e as ElixirIngredientModel).toJson(),
            )
            .toList(),
        'inventors': inventors
            ?.map(
              (e) => (e as ElixirInventorModel).toJson(),
            )
            .toList(),
        'manufacturer': manufacturer,
      };
}
