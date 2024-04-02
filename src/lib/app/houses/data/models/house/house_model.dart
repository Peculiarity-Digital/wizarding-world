library house;

import 'package:wizarding_world/app/index.dart';

part 'house_head_model.dart';
part 'house_trait_model.dart';

class HouseModel extends HouseEntity {
  const HouseModel({
    super.id,
    super.name,
    super.houseColours,
    super.founder,
    super.animal,
    super.element,
    super.ghost,
    super.commonRoom,
    List<HouseHeadModel>? super.heads,
    List<HouseTraitModel>? super.traits,
  });

  factory HouseModel.fromJson(Map<String, dynamic> map) {
    final heads = (map['heads'] as List)
        .map((e) => HouseHeadModel.fromJson(e as Map<String, dynamic>))
        .toList();
    final traits = (map['traits'] as List)
        .map((e) => HouseTraitModel.fromJson(e as Map<String, dynamic>))
        .toList();

    return HouseModel(
      id: map['id'].toString(),
      name: map['name'].toString(),
      houseColours: map['houseColours'].toString(),
      founder: map['founder'].toString(),
      animal: map['animal'].toString(),
      element: map['element'].toString(),
      ghost: map['ghost'].toString(),
      commonRoom: map['commonRoom'].toString(),
      heads: heads,
      traits: traits,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'houseColours': houseColours,
        'founder': founder,
        'animal': animal,
        'element': element,
        'ghost': ghost,
        'commonRoom': commonRoom,
        'heads': heads?.map((e) => (e as HouseHeadModel).toJson()).toList(),
        'traits': traits?.map((e) => (e as HouseTraitModel).toJson()).toList(),
      };
}
