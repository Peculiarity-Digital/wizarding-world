import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:provider/provider.dart';
import 'package:wizarding_world/lib.dart';

class AppBottomNav extends StatelessWidget {
  const AppBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavNotifier>(
      builder: (context, provider, _) => SnakeNavigationBar.color(
        currentIndex: provider.selectedIndex,
        height: 55.0,
        padding: const EdgeInsets.all(4.0),
        selectedItemColor: Colors.white,
        showUnselectedLabels: true,
        onTap: (index) {
          provider.setSelectedState(index);

          switch (index) {
            case 0:
              {
                context.router.replace(
                  const HomeRoute(),
                );
                break;
              }
            case 1:
              {
                context.router.replace(
                  const ElixirRoute(),
                );
                break;
              }
            case 2:
              {
                context.router.replace(
                  const IngredientRoute(),
                );
                break;
              }
            case 3:
              {
                context.router.replace(
                  const SpellRoute(),
                );
                break;
              }
            case 4:
              {
                context.router.replace(
                  const WizardRoute(),
                );
                break;
              }
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.house),
            label: 'House',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.science),
            label: 'Elixir',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.energy_savings_leaf),
            label: 'Ingredient',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flight_class_sharp),
            label: 'Spell',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2),
            label: 'Wizard',
          ),
        ],
      ),
    );
  }
}
