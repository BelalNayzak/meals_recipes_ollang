import 'package:flutter/material.dart';
import 'package:kenburns_nullsafety/kenburns_nullsafety.dart';
import 'package:ollang_recipes/common/constants/app_colors.dart';
import 'package:ollang_recipes/common/models/meal_model.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../common/caching/meals_cacher.dart';

class MealDetailsScreen extends StatelessWidget {
  static const id = 'MealDetailsScreen';

  const MealDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MealModel meal =
        ModalRoute.of(context)!.settings.arguments as MealModel;

    return ChangeNotifierProvider<MealModel>(
      create: (context) => meal,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 35.h,
                margin: const EdgeInsets.symmetric(horizontal: 1),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.greyColor.withOpacity(0.5),
                      spreadRadius: 10,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(60.h, 10.h),
                    bottomRight: Radius.elliptical(60.h, 10.h),
                  ),
                ),
                child: Stack(
                  children: [
                    KenBurns(
                      maxScale: 1.2,
                      child: Image.network(meal.img!, fit: BoxFit.cover),
                    ),
                    Positioned(
                      top: 50,
                      left: 20,
                      child: InkWell(
                        onTap: () => Navigator.pop(context),
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
                          child: Icon(
                            Icons.arrow_back,
                            color: AppColors.greyDarkColor,
                            size: 3.h,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 50,
                      right: 20,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              // TODO
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
                              child: Icon(
                                Icons.share,
                                color: AppColors.orangeColor,
                                size: 3.h,
                              ),
                            ),
                          ),
                          SizedBox(width: 2.h),
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
                                      color:
                                          AppColors.greyColor.withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 7,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child:
                                    Consumer(builder: (_, MealModel prv, __) {
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                child: Flexible(
                  child: Text(
                    meal.title!,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Ingredients and Instructions:',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ...List.generate(
                      meal.ingredients!.length,
                      (index) => Padding(
                        padding: EdgeInsets.symmetric(vertical: 0.7.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('- '),
                            Expanded(child: Text('${meal.ingredients![index]}'))
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
