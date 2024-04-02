part of 'house_model.dart';

class HouseTraitModel extends HouseTraitEntity {
  const HouseTraitModel({
    super.id,
    super.name,
  });

  factory HouseTraitModel.fromJson(Map<String, dynamic> map) {
    return HouseTraitModel(
      id: map['id'].toString(),
      name: map['name'].toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
