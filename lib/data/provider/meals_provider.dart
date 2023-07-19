import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';

class MealsNotifier extends Notifier<List<Meal>> {
  @override
  List<Meal> build() {
    return dummyMeals;
  }

  /*Function to filter the meals based on the filters selected by the user
  
  */
  List<Meal> filterMeals({
    bool? isGlutenFree,
    bool? isLactoseFree,
    bool? isVegan,
    bool? isVegetarian,
  }) {
    return state.where((meal) {
      if (isGlutenFree != null && !meal.isGlutenFree) {
        return false;
      }
      if (isLactoseFree != null && !meal.isLactoseFree) {
        return false;
      }
      if (isVegan != null && !meal.isVegan) {
        return false;
      }
      if (isVegetarian != null && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
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
