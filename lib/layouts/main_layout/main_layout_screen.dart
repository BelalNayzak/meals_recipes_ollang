import 'package:flutter/material.dart';
import 'package:ollang_recipes/common/models/meal_model.dart';
import 'package:ollang_recipes/modules/favs/screens/favs_screen.dart';
import 'package:ollang_recipes/modules/home_meals/provider/home_meals_provider.dart';
import 'package:ollang_recipes/modules/home_meals/screens/home_meals_screen.dart';
import 'package:ollang_recipes/modules/meal_details/screens/meal_details_screen.dart';
import 'package:provider/provider.dart';

import '../../common/constants/app_colors.dart';

class MainLayoutScreen extends StatefulWidget {
  static const id = 'MainLayoutScreen';

  const MainLayoutScreen({Key? key}) : super(key: key);

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        mini: true,
        backgroundColor: Colors.orange,
        onPressed: () {
          int randomIndex = DateTime
              .now()
              .millisecondsSinceEpoch % 20 - 1;
          MealModel randomMeal = Provider
              .of<HomeMealsProvider>(context, listen: false,)
              .meals[randomIndex];
          Navigator.pushNamed(
              context, MealDetailsScreen.id, arguments: randomMeal);
        },
        child: const Icon(Icons.auto_awesome_outlined),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: AppColors.orangeColor,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          onTap: (i) {
            setState(() {
              _currentIndex = i;
            });
          },
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: _currentIndex == 0
                  ? const Icon(Icons.home)
                  : const Icon(Icons.home_outlined),
            ),
            BottomNavigationBarItem(
              label: 'Favourits',
              icon: _currentIndex == 1
                  ? const Icon(Icons.favorite)
                  : const Icon(Icons.favorite_border),
            ),
          ],
        ),
      ),
      body: _currentIndex == 0 ? const HomeMealsScreen() : const FavsScreen(),
    );
  }
}
