import 'package:flutter/material.dart';

class HousesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HousesAppBar({super.key, this.title = 'Wizarding World'});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
