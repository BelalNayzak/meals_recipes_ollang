import 'package:flutter/material.dart';
import 'package:ollang_recipes/common/constants/app_images.dart';

import '../../../layouts/main_layout/main_layout_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  static const id = 'OnBoardingScreen';

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _currentPageIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);
  final List<Map<String, dynamic>> _onboardingData = [
    {
      'image': AppImages.onboarding_girl1,
      'title': 'Discover New Recipes',
      'description':
          'Get access to thousands of recipes from around the world and learn how to cook like a pro!',
    },
    {
      'image': AppImages.onboarding_girl2,
      'title': 'Save Your Favorites',
      'description':
          'Keep track of your favorite recipes by saving them to your personal recipe book.',
    },
    {
      'image': AppImages.onboarding_girl1,
      'title': 'Plan Your Meals',
      'description':
          'Stay organized by planning your meals in advance and create grocery lists based on your recipes.',
    },
  ];

  Widget _buildPageView() {
    return Expanded(
      child: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            print('xxxxxx hi $_currentPageIndex');
            print('xxxxxx hi $index');
            _currentPageIndex = index;
          });
        },
        itemCount: _onboardingData.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                _onboardingData[index]['image'],
                height: 250.0,
              ),
              const SizedBox(height: 48.0),
              Text(
                _onboardingData[index]['title'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
              const SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Text(
                  _onboardingData[index]['description'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
              const SizedBox(height: 48.0),
            ],
          );
        },
      ),
    );
  }

  Widget _buildGetStartedButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, MainLayoutScreen.id);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 16.0),
      ),
      child: const Text('Get Started'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16.0),
            Expanded(
              child: _buildPageView(),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PageIndicator(isActive: _currentPageIndex == 0 ? true : false),
                PageIndicator(isActive: _currentPageIndex == 1 ? true : false),
                PageIndicator(isActive: _currentPageIndex == 2 ? true : false),
              ],
            ),
            const SizedBox(height: 16.0),
            _buildGetStartedButton(),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}

class PageIndicator extends StatelessWidget {
  final bool isActive;

  const PageIndicator({Key? key, required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: isActive ? 24.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.orange : Colors.grey[300],
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }
}

//
// class OnBoardingScreen extends StatefulWidget {
//   static const id = 'OnBoardingScreen';
//
//   const OnBoardingScreen({super.key});
//   @override
//   _OnBoardingScreenState createState() => _OnBoardingScreenState();
// }
//
// class _OnBoardingScreenState extends State<OnBoardingScreen> {
//   int _currentPage = 0;
//   final PageController _pageController = PageController(initialPage: 0);
//   final List<Widget> _pages = const [
//     OnBoardingPage(
//       title: "Welcome to our Meals Recipe App",
//       subtitle: "Discover new recipes and cook like a pro!",
//     ),
//     OnBoardingPage(
//       title: "Explore Thousands of Recipes",
//       subtitle: "Search for recipes based on ingredients, meal type and more!",
//     ),
//     OnBoardingPage(
//       title: "Plan Your Meals Like a Pro",
//       subtitle: "Create your own meal plans and grocery lists with ease!",
//     ),
//   ];
//
//   void _onPageChanged(int page) {
//     setState(() {
//       _currentPage = page;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.whiteColor,
//       body: SafeArea(
//         child: SizedBox(
//           height: 100.h,
//           child: Stack(
//           children: [
//             Container(
//               height: 10.h,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [
//                     Colors.orange.withOpacity(0.5),
//                     Colors.white,
//                     Colors.white,
//                     Colors.white,
//                   ],
//                 ),
//               ),
//             ),
//             Positioned(
//               top: 15.h,
//               left: 5.h,
//               right: 5.h,
//               child: Image.asset(AppImages.onboarding_all),
//             ),
//             Positioned(
//               bottom: 0,
//               right: 0,
//               left: 0,
//               child: SizedBox(
//                 height: 35.h,
//                 child: Container(
//                   margin: EdgeInsets.only(right: 0.5.h, left: 0.5.h),
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomRight,
//                       colors: [
//                         Colors.orange.withOpacity(0.1),
//                         Colors.white30,
//                         Colors.white,
//                       ],
//                     ),
//                     borderRadius: const BorderRadius.only(
//                       topLeft: Radius.circular(20),
//                       topRight: Radius.circular(20),
//                     ),
//                   ),
//                   child: Padding(
//                     padding: EdgeInsets.all(2.h),
//                     child: PageView.builder(
//                       itemBuilder: (ctx, index) => _pages[index],
//                       itemCount: _pages.length,
//                       controller: _pageController,
//                       onPageChanged: _onPageChanged,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Positioned(
//               right: 3.h,
//               left: 3.h,
//               bottom: 3.h,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       SingleSlideIndicator(
//                           isActive: _currentPage == 0 ? true : false),
//                       SingleSlideIndicator(
//                           isActive: _currentPage == 1 ? true : false),
//                       SingleSlideIndicator(
//                           isActive: _currentPage == 2 ? true : false),
//                     ],
//                   ),
//                   InkWell(
//                     child: Card(
//                       color: Colors.orange,
//                       child: Padding(padding: EdgeInsets.all(1.h),
//                         child: const Icon(Icons.arrow_right_alt, color: Colors.white,),
//                       ),
//                     ),
//                     onTap: () {
//                       if (_currentPage == 2) {
//                         Navigator.pushNamed(context, MainLayoutScreen.id);
//                       } else {
//                         _pageController.nextPage(
//                           duration: const Duration(milliseconds: 500),
//                           curve: Curves.ease,
//                         );
//                       }
//                     },
//                   ),
//                 ],
//               ),
//             ),
//             Positioned(
//               top: 10.h,
//               left: 0,
//               right: 0,
//               child: Text(
//                 'MealZ!',
//                 textAlign: TextAlign.center,
//                 style: GoogleFonts.acme(
//                   fontSize: AppFontSize.x_x_x_x_x_x_x_large,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         ),
//       ),
//     );
//   }
// }
