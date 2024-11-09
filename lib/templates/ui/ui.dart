import 'package:flutter/material.dart';
import 'package:fut_app/components/nav_drawer.dart';
import 'package:fut_app/templates/ui/app_const.dart';
import 'package:fut_app/templates/ui/body.dart';
import 'package:fut_app/templates/ui/footer.dart';
import 'package:fut_app/templates/ui/header.dart';
import 'package:fut_app/templates/ui/search_area.dart';

class UI extends StatelessWidget {
  const UI({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: const NavDrawer(),
        body: SafeArea(
          child: ListView(
            padding: AppConst.isB800Screen(context)
                ? const EdgeInsets.symmetric(horizontal: 80.0, vertical: 30.0)
                : const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
            children: [
              Header(isScreenLarge: AppConst.isB800Screen(context)),
              SearchArea(isScreenLarge: AppConst.isB800Screen(context)),
              Body(),
              Footer()
            ],
          ),
        ));
  }
}
