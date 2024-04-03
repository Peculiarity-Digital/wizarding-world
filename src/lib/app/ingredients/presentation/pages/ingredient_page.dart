import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:wizarding_world/lib.dart';

@RoutePage()
class IngredientPage extends StatelessWidget {
  const IngredientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HousesAppBar(
        title: 'Ingredients',
      ),
      bottomNavigationBar: const AppBottomNav(),
      body: SafeArea(
        child: ResponsiveBuilder(
          builder: (context, info) {
            if (info.isMobile) {
              return const Text('Ingredient Page');
            }

            return const Center(
              child: Text('No implementation'),
            );
          },
        ),
      ),
    );
  }
}
