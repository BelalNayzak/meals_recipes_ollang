import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ollang_recipes/common/constants/app_endPoints.dart';

import '../../../common/errors/exceptions.dart';
import '../../../common/models/meal_model.dart';

class SearchMealsRequest {
  Future<List> call(String keyword, {Map? filters}) async {
    if (await InternetConnectionChecker().hasConnection) {
      final response = await http.get(
        Uri.parse(_buildSearchUrl(keyword, filters: filters)),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final decodedMeals = convert.json.decode(response.body)['hits'];
        final List meals = decodedMeals.map((m) {
          final MealModel meal = MealModel.fromJson(m['recipe']);
          meal.id = m['_links']['self']['href'];
          return meal;
        }).toList();
        return meals;
      } else {
        throw ServerException();
      }
    } else {
      throw NoInternetException();
    }
  }

  String _buildSearchUrl(String keyword, {Map? filters}) {
    String url = '${AppEndPoints.edmamAPIUrl}&q=${keyword}';
    if (filters != null) {
      filters.forEach((key, value) {
        url = '$url&$key=$value';
      });
    }
    return url;
  }
}
