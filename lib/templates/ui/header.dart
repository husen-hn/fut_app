import 'package:flutter/material.dart';
import 'package:fut_app/components/header_btn.dart';
import 'package:fut_app/templates/ui/app_const.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.isScreenLarge});

  final bool isScreenLarge;

  @override
  Widget build(BuildContext context) {
    return isScreenLarge ? lg(context) : sm(context);
  }

  Widget lg(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: AppConst.isB1200Screen(context)
                ? MediaQuery.of(context).size.width * 0.3
                : AppConst.isB1000Screen(context)
                    ? MediaQuery.of(context).size.width * 0.4
                    : AppConst.isB800Screen(context)
                        ? MediaQuery.of(context).size.width * 0.6
                        : MediaQuery.of(context).size.width * 0.3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Logo
                const Text(
                  'Recipes Center',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 1.0,
                  height: 20.0,
                  color: Colors.grey,
                ),
                Row(
                  children: [
                    HeaderBtn(text: 'Recipes', onPressed: () {}),
                    HeaderBtn(text: 'About', onPressed: () {}),
                    HeaderBtn(text: 'Contacts', onPressed: () {}),
                    HeaderBtn(text: 'Blog', onPressed: () {})
                  ],
                )
              ],
            ),
          ),
          Row(
            children: [
              HeaderBtn(text: 'Log in', onPressed: () {}),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all<Color>(AppConst.purple),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10.0), // Adjust the radius as needed
                    ),
                  ),
                ),
                child: const Text(
                  'Sign up',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          )
        ],
      );

  Widget sm(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          const Text(
            'Recipes Center',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          IconButton(
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              icon: const ImageIcon(AssetImage(AppConst.menu)))
        ],
      );
}
