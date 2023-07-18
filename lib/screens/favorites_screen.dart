import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/provider/favorite_meals_provider.dart';
import 'package:meals/screens/widgets/meals_grid.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});
  static const routeName = '/favorites';
  static const title = 'Favorites';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    const gridItemWidth = 400;
    final favoriteMeals = ref.watch(favoriteMealsProvider);
    return favoriteMeals.isNotEmpty
        ? MealsGrid(
            width: width,
            gridItemWidth: gridItemWidth,
            meals: favoriteMeals,
          )
        : SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'No meals in favorite.',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                const SizedBox(height: 5),
                Text(
                  'To add a favorite meal, tap the start icon in meal description.',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ],
            ),
          );
  }
}
