import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<Set<Meal>> {
  FavoriteMealsNotifier() : super({});

  bool toggleFavoriteMealStatus(Meal meal) {
    if (state.contains(meal)) {
      state = state.where((m) => m.id != meal.id).toSet();
      return false;
    } else {
      state = {...state, meal};
      return true;
    }
  }
}

final favoritesMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, Set<Meal>>(
        (ref) => FavoriteMealsNotifier());
