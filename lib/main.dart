import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'common/caching/hive.dart';
import 'common/dependency_injection/injection_container.dart';
import 'common/navigator/router.dart';
import 'common/provider/my_providers.dart';
import 'modules/onboarding/screens/onboarding_screen.dart';

// - Users should be able to remove recipes from their favorites list by swiping left on the recipe in the favorites list.
// - >
// - filter search results by dietary requirements such as vegan, gluten-free, etc.
// - search history
// - recipe-sharing feature (share a recipe via email or social media.)

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupInjection();
  await Future.wait([HiveStorage().createHive()]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiProvider(
          providers: MyProviders.providerList,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: OnBoardingScreen.id,
            routes: Routing().getRoutesMap(context),
          ),
        );
      },
    );
  }
}
