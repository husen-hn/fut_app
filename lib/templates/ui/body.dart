import 'package:flutter/material.dart';
import 'package:fut_app/components/custom_drop_down.dart';
import 'package:fut_app/components/custom_tab_bar.dart';
import 'package:fut_app/components/custom_tab_bar_view.dart';
import 'package:fut_app/templates/ui/app_const.dart';

class Body extends StatelessWidget {
  Body({super.key});

  final List<String> tabs = [
    'Discover',
    'Appetizers',
    'Breakfast',
    'Brunch',
    'Kid-Friendly',
    'Dessert',
    'Dinner',
    'Lunch'
  ];

  final List<Map> foods = [
    {
      'image': 'assets/images/smashed-potato-tarte.webp',
      'title': 'Smashed potato tarte',
      'user_image': 'assets/thumbnails/nick-käseberg.webp',
      'username': 'Nick Käseberg',
      'likes': '531'
    },
    {
      'image': 'assets/images/honeycomb-candy.webp',
      'title': 'Honeycomb candy',
      'user_image': 'assets/thumbnails/nick-käseberg.webp',
      'username': 'Nick Käseberg',
      'likes': '221'
    },
    {
      'image': 'assets/images/creamy-pumpkin-curry-udon.webp',
      'title': 'Creamy pumpkin curry udon',
      'user_image': 'assets/thumbnails/carolin-roitzheim.webp',
      'username': 'Carolin Roitzheim',
      'likes': '1.5k'
    },
    {
      'image': 'assets/images/super-easy-sheet-pan-pancakes.webp',
      'title': 'Super easy sheet pan pancakes',
      'user_image': 'assets/thumbnails/marco-hartz.webp',
      'username': 'Marco Hartz',
      'likes': '1K'
    },
    {
      'image': 'assets/images/autumn-rolls-with-spiced-peanut-dip.webp',
      'title': 'Autumn rolls with spiced peanut dip',
      'user_image': 'assets/thumbnails/carolin-roitzheim.webp',
      'username': 'Carolin Roitzheim',
      'likes': '1K'
    },
    {
      'image': 'assets/images/cinnamon-roll-focaccia.webp',
      'title': 'Cinnamon Roll Focaccia',
      'user_image': 'assets/thumbnails/marco-hartz.webp',
      'username': 'Marco Hartz',
      'likes': '506'
    },
    {
      'image': 'assets/images/cinnamon-roll-focaccia.webp',
      'title': 'Dubai chocolate bites, 2 ways',
      'user_image': 'assets/thumbnails/emre-kesici.webp',
      'username': 'Emre Kesici',
      'likes': '584'
    },
    {
      'image': 'assets/images/pistachio-cream-coffee.webp',
      'title': 'Pistachio Cream Coffee',
      'user_image': 'assets/thumbnails/dallmayr.webp',
      'username': 'Dallmayr',
      'likes': '55'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabs.length,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppConst.isB1000Screen(context)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: 150,
                          height: 30,
                          child: CustomDropdown(
                            onChange: (String? value) {},
                          )),
                      SizedBox(
                          width: AppConst.isB1200Screen(context)
                              ? MediaQuery.of(context).size.width * 0.6
                              : AppConst.isB1000Screen(context)
                                  ? MediaQuery.of(context).size.width * 0.5
                                  : MediaQuery.of(context).size.width * 0.9,
                          height: 100,
                          child: CustomTabBar(
                            tabs: tabs,
                          )),
                      SizedBox(width: 100, height: 30, child: _filterBtn()),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 100,
                          child: CustomTabBar(
                            tabs: tabs,
                          )),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: 150,
                                height: 30,
                                child: CustomDropdown(
                                  onChange: (String? value) {},
                                )),
                            SizedBox(
                                width: 100, height: 30, child: _filterBtn()),
                          ])
                    ],
                  ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              height: AppConst.isB1200Screen(context)
                  ? 800
                  : AppConst.isB1000Screen(context)
                      ? 1100
                      : AppConst.isB600Screen(context)
                          ? 1800
                          : 4300,
              child: TabBarView(
                children: [
                  CustomTabBarView(
                    foods: foods,
                  ),
                  CustomTabBarView(
                    foods: foods,
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  _filterBtn() => TextButton(
        onPressed: () {},
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              side: const BorderSide(color: AppConst.grey100, width: 2.0),
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
        child: const Row(
          children: [
            ImageIcon(AssetImage(AppConst.filterLines), color: Colors.black),
            SizedBox(width: 2.0),
            Text(
              'Filters',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      );
}
