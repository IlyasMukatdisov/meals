import 'package:flutter/material.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/favorites_screen.dart';
import 'package:meals/screens/widgets/main_drawer.dart';

final bottomTabs = [
  const BottomNavigationBarItem(
      icon: Icon(Icons.set_meal), label: 'Categories'),
  const BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
];

final tabs = [
  const CategoriesScreen(),
  const FavoritesScreen(),
];

final titles = [
  CategoriesScreen.title,
  FavoritesScreen.title,
];

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});
  static const routeName = '/tabs';

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          titles[currentIndex],
        ),
      ),
      drawer: const MainDrawer(),
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          items: bottomTabs,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          }),
    );
  }
}
