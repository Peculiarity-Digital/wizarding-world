part of 'house_model.dart';

class HouseHeadModel extends HouseHeadEntity {
  const HouseHeadModel({
    super.id,
    super.firstName,
    super.lastName,
  });

  factory HouseHeadModel.fromJson(Map<String, dynamic> map) {
    return HouseHeadModel(
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
