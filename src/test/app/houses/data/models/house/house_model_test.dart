import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wizarding_world/lib.dart';

void main() {
  group('HouseModel', () {
    test('can create model with all parameters supplied', () {
      // Arrange
      final String id = faker.guid.guid();
      final String name = faker.company.name();
      final String houseColours = faker.color.color();
      final String founder = faker.person.name();
      final String animal = faker.animal.name();
      final String element = faker.food.cuisine();
      final String ghost = faker.vehicle.make();
      final String commonRoom = faker.conference.name();
      final List<HouseHeadModel> heads = [
        HouseHeadModel(
          id: faker.guid.guid(),
          firstName: faker.person.firstName(),
          lastName: faker.person.lastName(),
        ),
      ];
      final List<HouseTraitModel> traits = [
        HouseTraitModel(
          id: faker.guid.guid(),
          name: faker.sport.name(),
        ),
      ];

      // Act
      final entity = HouseModel(
        id: id,
        name: name,
        houseColours: houseColours,
        founder: founder,
        animal: animal,
        element: element,
        ghost: ghost,
        commonRoom: commonRoom,
        heads: heads,
        traits: traits,
      );

      // Assert
      expect(entity.id, id);
      expect(entity.name, name);
      expect(entity.houseColours, houseColours);
      expect(entity.founder, founder);
      expect(entity.animal, animal);
      expect(entity.element, element);
      expect(entity.ghost, ghost);
      expect(entity.commonRoom, commonRoom);
      expect(entity.heads, isNotNull);
      expect(entity.traits, isNotNull);
    });

    test('can create model from json', () {
      // Arrange
      final String id = faker.guid.guid();
      final String name = faker.company.name();
      final String houseColours = faker.color.color();
      final String founder = faker.person.name();
      final String animal = faker.animal.name();
      final String element = faker.food.cuisine();
      final String ghost = faker.vehicle.make();
      final String commonRoom = faker.conference.name();

      final Map<String, dynamic> mockJson = {
        'id': id,
        'name': name,
        'houseColours': houseColours,
        'founder': founder,
        'animal': animal,
        'element': element,
        'ghost': ghost,
        'commonRoom': commonRoom,
        'heads': [
          {
            'id': faker.guid.guid(),
            'firstName': faker.person.firstName(),
            'lastName': faker.person.lastName(),
          }
        ],
        'traits': [
          {
            'id': faker.guid.guid(),
            'name': faker.sport.name(),
          }
        ],
      };

      // Act
      final entity = HouseModel.fromJson(mockJson);

      // Assert
      expect(entity.id, id);
      expect(entity.heads, isNotNull);
      expect(entity.traits, isNotNull);
    });
  });
}
