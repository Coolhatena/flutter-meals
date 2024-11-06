import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal selectedMeal) {
    final isExisting = state.contains(selectedMeal);

    if (isExisting) {
      state = state.where((meal) => meal.id != selectedMeal.id).toList();
      return false;
    } else {
      state = [...state, selectedMeal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>(
  (ref) {
    return FavoriteMealsNotifier();
  },
);
