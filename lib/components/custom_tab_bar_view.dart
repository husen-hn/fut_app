import 'package:flutter/material.dart';
import 'package:fut_app/templates/ui/app_const.dart';

class CustomTabBarView extends StatelessWidget {
  CustomTabBarView({super.key, required this.foods});

  final List<Map> foods;
  final GlobalKey _myWidgetKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // final RenderBox renderBox =
    //     _myWidgetKey.currentContext!.findRenderObject() as RenderBox;
    // final Size size = renderBox.size;
    // print('********');
    // print(size.toString());
    // print('********');
    return Column(children: [
      const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Recipes',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text('56,506 suggested')
        ],
      ),
      const SizedBox(height: 10.0),
      SizedBox(
        height: AppConst.isB1200Screen(context)
            ? 700
            : AppConst.isB1000Screen(context)
                ? 1000
                : AppConst.isB600Screen(context)
                    ? 1700
                    : 4200,
        child: GridView.count(
          key: _myWidgetKey,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: AppConst.isB1200Screen(context)
              ? 4
              : AppConst.isB1000Screen(context)
                  ? 3
                  : AppConst.isB600Screen(context)
                      ? 2
                      : 1,
          children: List.generate(foods.length, (index) {
            return LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              return Container(
                padding: const EdgeInsets.all(2.0),
                child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          foods[index]['image'],
                          fit: BoxFit.fill,
                          width: constraints.maxWidth,
                          height: constraints.maxHeight / 1.4,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        foods[index]['title'],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 14),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              ClipOval(
                                child: Image.asset(
                                  foods[index]['user_image'],
                                  width: 24,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 3),
                              Text(
                                foods[index]['username'],
                                style: const TextStyle(
                                    fontSize: 12, color: AppConst.grey),
                              )
                            ],
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(AppConst.heart,
                                    width: 24, height: 24),
                                const SizedBox(width: 8),
                                Text(
                                  foods[index]['likes'],
                                  style: const TextStyle(
                                      fontSize: 12, color: AppConst.grey),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            });
          }),
        ),
      )
    ]);
  }
}
