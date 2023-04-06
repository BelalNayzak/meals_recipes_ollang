import 'package:ollang_recipes/modules/favs/provider/favs_provider.dart';
import 'package:ollang_recipes/modules/search/provider/search_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../modules/home_meals/provider/home_meals_provider.dart';
import '../dependency_injection/injection_container.dart';

class MyProviders {
  static final List<SingleChildWidget> providerList = [
    ChangeNotifierProvider<HomeMealsProvider>(
      lazy: false,
      create: (context) => HomeMealsProvider(gtt())..getHomeMeals(context),
    ),
    ChangeNotifierProvider<FavsProvider>(
      lazy: false,
      create: (context) => FavsProvider(gtt())..getFavs(context),
    ),
    ChangeNotifierProvider<SearchProvider>(
      lazy: false,
      create: (context) => SearchProvider(gtt())..getSearchHistory(context),
    ),
  ];
}
