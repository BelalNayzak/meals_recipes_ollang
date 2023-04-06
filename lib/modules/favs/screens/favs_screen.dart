import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/constants/app_font_sizes.dart';
import '../../../common/widget/loader.dart';
import '../../meal_details/screens/meal_details_screen.dart';
import '../provider/favs_provider.dart';

class FavsScreen extends StatelessWidget {
  static const id = 'FavsScreen';

  const FavsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Consumer<FavsProvider>(
            builder: (_, prv, __) {
              if (prv.loading) {
                return const Loader();
              } else {
                if (prv.favs.isEmpty) {
                  return Container(
                    height: 50.h,
                    alignment: Alignment.center,
                    child: Text(
                      'You have no favourite meals yet.',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey[600],
                      ),
                    ),
                  );
                } else {
                  return Padding(
                    padding: EdgeInsets.only(top: 2.h),
                    child: ListView.separated(
                      itemCount: prv.favs.length,
                      separatorBuilder: (_, i) => const Divider(),
                      itemBuilder: (_, i) {
                        return ListTile(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              MealDetailsScreen.id,
                              arguments: prv.favs[i],
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
                                image: NetworkImage(prv.favs[i].img),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Text(prv.favs[i].title),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                prv.favs[i].cookTime!,
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
      ),
    );
  }
}
