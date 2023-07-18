import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/data/provider/filters_provider.dart';
import 'package:meals/data/provider/meals_provider.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals_screen.dart';

class CategoriesScreen extends ConsumerWidget {
  static const String routeName = '/categories';
  static const String title = 'Categories';

  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    const gridItemWidth = 250;

    final List<Meal> meals;

    final filters = ref.watch(filtersProvider);

    if (filters.isNotEmpty) {
      meals = ref.watch(mealsProvider.notifier).filterMeals(
            isGlutenFree: filters.contains(
              Filter.glutenFree,
            )
                ? true
                : null,
            isLactoseFree: filters.contains(
              Filter.lactoseFree,
            )
                ? true
                : null,
            isVegan: filters.contains(
              Filter.vegan,
            )
                ? true
                : null,
            isVegetarian: filters.contains(
              Filter.vegetarian,
            )
                ? true
                : null,
          );
    } else {
      meals = ref.watch(mealsProvider);
    }

    return GridView.builder(
      itemCount: availableCategories.length,
      padding: const EdgeInsets.all(20),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: width ~/ gridItemWidth,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      itemBuilder: (context, index) {
        final category = availableCategories[index];
        return InkWell(
          splashColor: Theme.of(context).primaryColor,
          onTap: () {
            Navigator.of(context).pushNamed(
              MealsScreen.routeName,
              arguments: {
                'title': category.title,
                'meals': meals
                    .where(
                      (meal) => meal.categories.contains(category.id),
                    )
                    .toList(),
              },
            );
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  category.color.withOpacity(0.7),
                  category.color.withOpacity(0.95),
                ],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20),
            child: Text(
              category.title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ),
        );
      },
    );
  }
}
