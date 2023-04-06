import '../../../common/caching/meals_cacher.dart';
import '../../../common/errors/exceptions.dart';

class GetFavsRequest {
  Future<List> call() async {
    final favs = MealsCacher.getAllCachedMeals();

    if (favs.isNotEmpty) {
      return favs;
    } else {
      throw EmptyCacheException();
    }
  }
}
