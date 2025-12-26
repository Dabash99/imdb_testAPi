import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.movie_rounded),
          label: 'Movies',
        ),
        BottomNavigationBarItem(icon:Icon(Icons.movie),label: 'Series' ),
      ],
    );
  }
}
