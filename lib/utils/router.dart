import 'package:flutter/material.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/meals_screen.dart';
import 'package:meals/utils/error_screen.dart';

Route router(RouteSettings settings) {
  switch (settings.name) {
    case CategoriesScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const CategoriesScreen(),
      );
    case MealsScreen.routeName:
      final arguments = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        builder: (context) => MealsScreen(
          title: arguments['title'],
          meals: arguments['meals'],
        ),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => ErrorScreen(
          errorMessage: 'No route defined for ${settings.name}',
        ),
      );
  }
}
