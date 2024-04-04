part of 'elixir_model.dart';

class ElixirIngredientModel extends ElixirIngredientEntity {
  const ElixirIngredientModel({
    super.id,
    super.name,
  });

  factory ElixirIngredientModel.fromJson(Map<String, dynamic> map) {
    return ElixirIngredientModel(
      id: map['id'].toString(),
      name: map['name'].toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
