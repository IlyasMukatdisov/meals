import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/widgets/meal_item.dart';

class MealsGrid extends StatelessWidget {
  const MealsGrid({
    super.key,
    required this.width,
    required this.gridItemWidth,
    required this.meals,
  });

  final double width;
  final int gridItemWidth;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          crossAxisCount: width ~/ gridItemWidth,
        ),
        children: meals
            .map(
              (meal) => MealItem(
                meal: meal,
              ),
            )
            .toList(),
      );
  }
}
