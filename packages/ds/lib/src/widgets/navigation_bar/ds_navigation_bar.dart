// ignore_for_file: must_be_immutable

import 'package:ds/ds.dart';
import 'package:flutter/material.dart';

class DSNavigationBar extends StatelessWidget {
  Function(int) onDestinationSelected;
  int selectedIndex;

  DSNavigationBar({
    super.key,
    required this.onDestinationSelected,
    required this.selectedIndex,
  });

  final DSColors colors = const DSColors();

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      height: 84,
      backgroundColor: colors.grey1,
      indicatorColor: colors.blueLight,
      indicatorShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      destinations: const [
        NavigationDestination(
          icon: Icon(
            Icons.home,
            size: 32,
          ),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(
            Icons.search,
            size: 32,
          ),
          label: 'Search',
        ),
        NavigationDestination(
          icon: Icon(
            Icons.bookmark,
            size: 32,
          ),
          label: 'Saved',
        ),
      ],
    );
  }
}
