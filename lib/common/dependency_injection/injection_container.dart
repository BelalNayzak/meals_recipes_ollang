import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ollang_recipes/modules/favs/provider/favs_provider.dart';
import 'package:ollang_recipes/modules/home_meals/provider/home_meals_provider.dart';
import 'package:ollang_recipes/modules/home_meals/requests/get_home_meals_request.dart';

import '../../modules/favs/requests/favs_requests.dart';
import '../../modules/search/provider/search_provider.dart';
import '../../modules/search/requests/search_requests.dart';
import '../internet_connectin/network_status.dart';

final gtt = GetIt.instance; // getIt = GetIt.I

Future<void> setupInjection() async {
  /// home meals injections
  gtt.registerFactory<HomeMealsProvider>(
    () => HomeMealsProvider(gtt()),
  );
  gtt.registerLazySingleton<GetHomeMealsRequest>(
    () => GetHomeMealsRequest(),
  );

  /// favs injections
  gtt.registerFactory<FavsProvider>(
    () => FavsProvider(gtt()),
  );
  gtt.registerLazySingleton<GetFavsRequest>(
    () => GetFavsRequest(),
  );

  /// search meals injections
  gtt.registerFactory<SearchProvider>(
    () => SearchProvider(gtt()),
  );
  gtt.registerLazySingleton<SearchMealsRequest>(
    () => SearchMealsRequest(),
  );

  /// Common injections
  gtt.registerLazySingleton<NetworkStatus>(
    () => NetworkStatusImpl(internetChecker: gtt()),
  );
  gtt.registerLazySingleton<InternetConnectionChecker>(
    () => InternetConnectionChecker(),
  );
}
