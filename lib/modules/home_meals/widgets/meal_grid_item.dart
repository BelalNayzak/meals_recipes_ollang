import 'package:flutter/material.dart';
import 'package:ollang_recipes/common/models/meal_model.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../common/caching/meals_cacher.dart';
import '../../../common/constants/app_colors.dart';
import '../../../common/constants/app_font_sizes.dart';
import '../../meal_details/screens/meal_details_screen.dart';

class MealGridItem extends StatelessWidget {
  final MealModel meal;

  const MealGridItem({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MealModel>.value(
      value: meal,
      child: Container(
        margin: EdgeInsets.all(1.h),
        decoration: BoxDecoration(
          color: AppColors.whiteColor.withOpacity(0.9),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: AppColors.greyColor.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: InkWell(
          onTap: () {
            Navigator.of(context)
                .pushNamed(MealDetailsScreen.id, arguments: meal);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    image: DecorationImage(
                      image: NetworkImage(meal.img!),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.blackColor.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 1.h,
                        left: 1.h,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 0.5.h,
                            horizontal: 1.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.greyColor.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.timer_outlined,
                                color: AppColors.orangeColor,
                                size: 2.h,
                              ),
                              SizedBox(width: 0.5.h),
                              Text(
                                meal.cookTime!,
                                style: TextStyle(
                                  fontSize: AppFontSize.x_small,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.greyDarkColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 1.h,
                        right: 1.h,
                        child: InkWell(
                          onTap: () {
                            meal.toggleMealFavStatus();
                            if (meal.isFav) {
                              MealsCacher.cacheMeal(meal);
                            } else {
                              MealsCacher.unCacheMeal(meal);
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 0.5.h,
                              horizontal: 0.5.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.greyColor.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Consumer(builder: (_, MealModel prv, __) {
                              if (prv.isFav) {
                                return Icon(
                                  Icons.favorite,
                                  color: AppColors.orangeColor,
                                  size: 2.5.h,
                                );
                              } else {
                                return Icon(
                                  Icons.favorite_border,
                                  color: AppColors.orangeColor,
                                  size: 2.5.h,
                                );
                              }
                            }),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 1.h,
                        left: 1.h,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 0.5.h,
                            horizontal: 1.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Text(
                            meal.cat!,
                            style: TextStyle(
                              fontSize: AppFontSize.x_small,
                              fontWeight: FontWeight.bold,
                              color: AppColors.greyDarkColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 1.5.h, vertical: 1.5.h),
                child: Text(
                  meal.title!,
                  maxLines: 2,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                    fontSize: AppFontSize.small,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
