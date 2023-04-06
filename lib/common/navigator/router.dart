import 'package:flutter/material.dart';
import 'package:ollang_recipes/modules/favs/screens/favs_screen.dart';
import 'package:ollang_recipes/modules/search/screens/search_screen.dart';

import '../../layouts/main_layout/main_layout_screen.dart';
import '../../modules/home_meals/screens/home_meals_screen.dart';
import '../../modules/meal_details/screens/meal_details_screen.dart';
import '../../modules/onboarding/screens/onboarding_screen.dart';

class Routing {
  Map<String, Widget Function(BuildContext)> getRoutesMap(context) {
    return {
      OnBoardingScreen.id: (_) => OnBoardingScreen(),
      MainLayoutScreen.id: (_) => const MainLayoutScreen(),
      HomeMealsScreen.id: (_) => const HomeMealsScreen(),
      MealDetailsScreen.id: (_) => const MealDetailsScreen(),
      FavsScreen.id: (_) => const FavsScreen(),
      SearchScreen.id: (_) => SearchScreen(),
    };
  }
}
