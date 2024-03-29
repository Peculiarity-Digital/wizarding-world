import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wizarding_world/app/houses/domain/entities/house/house_entity.dart';

void main() {
  group('HouseEntity', () {
    test('can create with all parameters supplied', () {
      // Arrange
      final String id = faker.guid.guid();
      final String name = faker.company.name();
      final String houseColours = faker.color.color();
      final String founder = faker.person.name();
      final String animal = faker.animal.name();
      final String element = faker.food.cuisine();
      final String ghost = faker.vehicle.make();
      final String commonRoom = faker.conference.name();

      // Act
      final entity = HouseEntity(
        id: id,
        name: name,
        houseColours: houseColours,
        founder: founder,
        animal: animal,
        element: element,
        ghost: ghost,
        commonRoom: commonRoom,
        heads: [
          HouseHeadEntity(
            id: faker.guid.guid(),
            firstName: faker.person.firstName(),
            lastName: faker.person.lastName(),
          ),
        ],
        traits: [
          HouseTraitEntity(
            id: faker.guid.guid(),
            name: faker.sport.name(),
          ),
        ],
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

    test('can create with partial parameters supplied', () {
      final String id = faker.guid.guid();
      final String name = faker.company.name();
      final String houseColours = faker.color.color();
      final String founder = faker.person.name();
      final String animal = faker.animal.name();
      final String element = faker.food.cuisine();
      final String ghost = faker.vehicle.make();
      final String commonRoom = faker.conference.name();

      // Act
      final entity = HouseEntity(
        id: id,
        name: name,
        houseColours: houseColours,
        founder: founder,
        animal: animal,
        element: element,
        ghost: ghost,
        commonRoom: commonRoom,
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
      expect(entity.heads, isNull);
      expect(entity.traits, isNull);
    });

    test('can create with no parameters supplied', () {
      // Arrange

      // Act
      const entity = HouseEntity();

      // Assert
      expect(entity.id, isNull);
      expect(entity.name, isNull);
      expect(entity.houseColours, isNull);
      expect(entity.founder, isNull);
      expect(entity.animal, isNull);
      expect(entity.element, isNull);
      expect(entity.ghost, isNull);
      expect(entity.commonRoom, isNull);
      expect(entity.heads, isNotNull);
      expect(entity.traits, isNotNull);
    });

    test('can create with partial parameters supplied', () {
      final String id = faker.guid.guid();

      // Act
      final entity = HouseEntity(
        id: id,
      );

      // Assert
      expect(entity.props, contains(id));
    });
  });
}
