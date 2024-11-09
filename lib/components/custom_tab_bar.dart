import 'package:flutter/material.dart';
import 'package:fut_app/templates/ui/app_const.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key, required this.tabs});

  final List<String> tabs;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  List<Widget> tabsView = [];

  @override
  void initState() {
    super.initState();
    widget.tabs.forEach((element) {
      tabsView.add(Text('\t\t\t$element\t\t\t'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      dividerColor: Colors.transparent,
      isScrollable: true,
      labelColor: Colors.black,
      labelStyle: const TextStyle(fontWeight: FontWeight.w600),
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      unselectedLabelColor: AppConst.grey,
      tabAlignment: TabAlignment.center,
      indicatorColor: Colors.transparent,
      unselectedLabelStyle: const TextStyle(color: AppConst.grey),
      labelPadding: const EdgeInsets.all(10.0),
      indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), // Creates border
          color: AppConst.grey100),
      tabs: tabsView,
    );
  }
}
