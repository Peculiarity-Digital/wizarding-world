import 'package:change_case/change_case.dart';
import 'package:wizarding_world/core/enums/elixir_difficulty_enum.dart';

extension StringExtensions on String {
  ElixirDifficulty toElixirDifficulty() {
    try {
      final string = toCamelCase();
      return ElixirDifficulty.values.byName(
        string,
      );
    } catch (e) {
      return ElixirDifficulty.unknown;
    }
  }
}
