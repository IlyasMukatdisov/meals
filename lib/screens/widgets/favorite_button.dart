// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/data/provider/favorite_meals_provider.dart';
import 'package:meals/models/meal.dart';

class FavoriteButton extends ConsumerStatefulWidget {
  const FavoriteButton({
    Key? key,
    required this.meal,
  }) : super(key: key);

  final Meal meal;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends ConsumerState<FavoriteButton> {
  @override
  Widget build(BuildContext context) {
    final isFavorite =
        ref.read(favoriteMealsProvider.notifier).isFavorite(widget.meal);
    return FloatingActionButton(
      onPressed: () {
        setState(
          () {
            if (isFavorite) {
              ref
                  .read(favoriteMealsProvider.notifier)
                  .removeMeal(widget.meal.id);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  duration: const Duration(seconds: 1),
                  behavior: SnackBarBehavior.floating,
                  content: Text('Meal removed from favorites.'),
                ),
              );
            } else {
              ref.read(favoriteMealsProvider.notifier).addMeal(widget.meal);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  duration: const Duration(seconds: 1),
                  behavior: SnackBarBehavior.floating,
                  content: const Text('Meal added to favorites.'),
                ),
              );
            }
          },
        );
      },
      child: Icon(isFavorite ? Icons.star : Icons.star_border),
    );
  }
}
