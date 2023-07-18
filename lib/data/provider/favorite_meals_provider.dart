import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoriteMealsNotifier extends Notifier<List<Meal>> {
  @override
  List<Meal> build() {
    return [];
  }

  bool isFavorite(Meal meal) {
    return state.contains(meal);
  }

  void addMeal(Meal meal) {
    state = [...state, meal];
  }

  void removeMeal(String id) {
    state = state.where((meal) => meal.id != id).toList();
  }
}

final favoriteMealsProvider =
    NotifierProvider<FavoriteMealsNotifier, List<Meal>>(
  () {
    return FavoriteMealsNotifier();
  },
);
