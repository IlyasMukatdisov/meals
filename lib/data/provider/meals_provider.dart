import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';

class MealsNotifier extends Notifier<List<Meal>> {
  @override
  List<Meal> build() {
    return dummyMeals;
  }

  List<Meal> filterMeals({
    bool? isGlutenFree,
    bool? isLactoseFree,
    bool? isVegan,
    bool? isVegetarian,
  }) {
    //filter meals by 4 filters
    return state
        .where(
          (e) => isGlutenFree != null
              ? e.isGlutenFree == isGlutenFree
              : true && isLactoseFree != null
                  ? e.isLactoseFree == isLactoseFree
                  : true && isVegan != null
                      ? e.isVegan == isVegan
                      : true && isVegetarian != null
                          ? e.isVegetarian == isVegetarian
                          : true,
        )
        .toList();
  }

  void addMeal(Meal meal) {
    state = [...state, meal];
  }

  void removeMeal(String id) {
    state = state.where((meal) => meal.id != id).toList();
  }
}

final mealsProvider = NotifierProvider<MealsNotifier, List<Meal>>(
  () {
    return MealsNotifier();
  },
);
