import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/screens/meals_screen.dart';

class CategoriesScreen extends StatelessWidget {
  static const String routeName = '/categories';

  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    const gridItemWidth = 250;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: GridView.builder(
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
                  'meals': dummyMeals
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
      ),
    );
  }
}
