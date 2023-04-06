import 'package:flutter/material.dart';
import 'package:ollang_recipes/modules/meal_details/screens/meal_details_screen.dart';
import 'package:ollang_recipes/modules/search/provider/search_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/constants/app_font_sizes.dart';
import '../../../common/widget/loader.dart';

class SearchScreen extends StatelessWidget {
  static const id = 'SearchScreen';

  SearchScreen({Key? key}) : super(key: key);

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 2.h),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: TextField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    hintText: 'Search for recipes',
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                  ),
                  onChanged: (keyword) async {
                    await Provider.of<SearchProvider>(context, listen: false)
                        .searchMeals(context, keyword);
                  },
                ),
              ),
              Expanded(
                child: Consumer<SearchProvider>(
                  builder: (_, prv, __) {
                    if (prv.loading) {
                      return const Loader();
                    } else {
                      if (prv.searchedMeals.isEmpty) {
                        if (_searchController.text.isEmpty) {
                          return Container(
                            height: 50.h,
                            alignment: Alignment.center,
                            child: Text(
                              'Try to search for some recipes.',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey[600],
                              ),
                            ),
                          );
                        } else {
                          return Container(
                            height: 50.h,
                            alignment: Alignment.center,
                            child: Text(
                              'No meals matches your search inputs.',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey[600],
                              ),
                            ),
                          );
                        }
                      } else {
                        return Padding(
                          padding: EdgeInsets.only(top: 2.h),
                          child: ListView.separated(
                            itemCount: prv.searchedMeals.length,
                            separatorBuilder: (_, i) => const Divider(),
                            itemBuilder: (_, i) {
                              return ListTile(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                    MealDetailsScreen.id,
                                    arguments: prv.searchedMeals[i],
                                  );
                                  // TODO: cache
                                },
                                leading: Container(
                                  height: 7.h,
                                  width: 7.h,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          prv.searchedMeals[i].img),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                title: Text(prv.searchedMeals[i].title),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      prv.searchedMeals[i].cookTime!,
                                      style: TextStyle(
                                        fontSize: AppFontSize.x_small,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.greyDarkColor,
                                      ),
                                    ),
                                    SizedBox(width: 0.5.h),
                                    Icon(
                                      Icons.timer_outlined,
                                      color: AppColors.orangeColor,
                                      size: 2.h,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
