import 'package:flutter/material.dart';
import 'package:fut_app/templates/ui/app_const.dart';

class SearchArea extends StatelessWidget {
  SearchArea({super.key, required this.isScreenLarge});

  final bool isScreenLarge;

  final List<String> popSearchs = [
    'Low Carb Recipes',
    ' Vegan Recipes',
    'Chicken Recipes',
    'Italian Recipes'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Discover Recipes',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: AppConst.isB600Screen(context) ? 52 : 34),
          ),
          Text(
            'Tailored to You',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: AppConst.isB600Screen(context) ? 52 : 34),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 30.0),
            child: Text(
              'Find recipes by ingredients, time, and preference. Start cooking now!',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            width: AppConst.isB1000Screen(context)
                ? 500
                : AppConst.isB800Screen(context)
                    ? 450
                    : AppConst.isB600Screen(context)
                        ? 400
                        : 350,
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const ImageIcon(AssetImage(AppConst.search)),
                hintText: 'Search recipes by ingredient, name, or cuisine',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: AppConst.grey100),
                ),
              ),
            ),
          ),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: AppConst.isB1000Screen(context)
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 5.0),
                            child: Text('Popular searches',
                                style: TextStyle(color: AppConst.grey)),
                          ),
                          _popSearch(context)
                        ])
                  : Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 15.0),
                          child: Text(
                            'Popular searches',
                            style: TextStyle(color: AppConst.grey),
                          ),
                        ),
                        _popSearch(context)
                      ],
                    ))
        ],
      ),
    );
  }

  _popSearch(BuildContext context) => SizedBox(
        height: AppConst.isB1000Screen(context) ? 30 : 200,
        child: AppConst.isB1000Screen(context)
            ? Center(
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: popSearchs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: AppConst.grey100, width: 2.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          child: Text(
                            popSearchs[index],
                            maxLines: 1,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      );
                    }),
              )
            : GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: AppConst.isB1000Screen(context) ? 4 : 2,
                childAspectRatio: AppConst.isB600Screen(context) ? 10 : 6,
                children: List.generate(popSearchs.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            side: const BorderSide(
                                color: AppConst.grey100, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      child: Text(
                        popSearchs[index],
                        maxLines: 1,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  );
                }),
              ),
      );
}
