import 'package:flutter/material.dart';
import 'package:ollang_recipes/modules/home_meals/provider/home_meals_provider.dart';
import 'package:ollang_recipes/modules/search/screens/search_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../common/widget/loader.dart';
import '../widgets/meal_grid_item.dart';

class HomeMealsScreen extends StatefulWidget {
  static const id = 'MealsHomeScreen';

  const HomeMealsScreen({super.key});

  @override
  _HomeMealsScreenState createState() => _HomeMealsScreenState();
}

class _HomeMealsScreenState extends State<HomeMealsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TODO: the screen looks crowded a bit, make it with slivers to get the best use of the screen height if u had time
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16.0),
                const Text(
                  'Welcome to Recipe Finder',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Find your favorite recipes and save them here!',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 24.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(SearchScreen.id);
                    },
                    child: const TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        hintText: 'Search for recipes',
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),
                const Text(
                  'Explore Recipes',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
          Expanded(
            child: Consumer<HomeMealsProvider>(
              builder: (_, prv, __) {
                if (prv.loading) {
                  return const Loader();
                } else {
                  if (prv.meals.isEmpty) {
                    return Container(
                      height: 50.h,
                      alignment: Alignment.center,
                      child: Text(
                        'No meals available!',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey[600],
                        ),
                      ),
                    );
                  } else {
                    return GridView.builder(
                      itemCount: prv.meals.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.75,
                      ),
                      itemBuilder: (context, index) {
                        return MealGridItem(meal: prv.meals[index]);
                      },
                    );
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
