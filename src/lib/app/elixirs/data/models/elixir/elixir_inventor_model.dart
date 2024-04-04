part of 'elixir_model.dart';

class ElixirInventorModel extends ElixirInventorEntity {
  const ElixirInventorModel({
    super.id,
    super.firstName,
    super.lastName,
  });

  factory ElixirInventorModel.fromJson(Map<String, dynamic> map) {
    return ElixirInventorModel(
      id: map['id'].toString(),
      firstName: map['firstName'].toString(),
      lastName: map['lastName'].toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
      };
}
