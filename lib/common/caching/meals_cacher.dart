import '../models/meal_model.dart';
import 'hive.dart';

class MealsCacher {
  static List getAllCachedMeals() {
    Map<String, dynamic> favs = HiveStorage().getFromBox(key: 'favs');
    return favs.values.map((e) => MealModel.fromJson(e)).toList();
  }

  static void cacheMeal(MealModel meal) {
    Map<String, dynamic> favs = HiveStorage().getFromBox(key: 'favs');
    favs.addEntries([MapEntry(meal.id!, meal.toJson())]);
    HiveStorage().putInBox(key: 'favs', value: favs);
  }

  static bool isMealCached(MealModel meal) {
    Map<String, dynamic> favs = HiveStorage().getFromBox(key: 'favs');
    return favs.containsKey(meal.id!);
  }

  static void unCacheMeal(MealModel meal) {
    Map<String, dynamic> favs = HiveStorage().getFromBox(key: 'favs');
    favs.removeWhere((key, value) => meal.id! == key);
    HiveStorage().putInBox(key: 'favs', value: favs);
  }

  static List getAllCachedSearchedMeals() {
    Map<String, dynamic> search = HiveStorage().getFromBox(key: 'search');
    return search.values.map((e) => MealModel.fromJson(e)).toList();
  }

  static void cacheSearchedMeal(MealModel meal) {
    Map<String, dynamic> search = HiveStorage().getFromBox(key: 'search');
    if (search.keys.length > 4) {
      search.remove(search.keys.toList()[0]);
    }
    search.addEntries([MapEntry(meal.id!, meal.toJson())]);
    HiveStorage().putInBox(key: 'search', value: search);
  }
}
