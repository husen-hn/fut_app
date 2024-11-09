import 'package:flutter/material.dart';
import 'package:fut_app/templates/ui/app_const.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return AppConst.isB800Screen(context)
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _title(),
              SizedBox(
                width: AppConst.isB1200Screen(context) ? 500 : 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: _buttons,
                ),
              ),
              _copyRight()
            ],
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _title(),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 100,
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  childAspectRatio: 10,
                  children: List.generate(_buttons.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: TextButton(
                        onPressed: () {},
                        child: _buttons[index],
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              _copyRight()
            ],
          );
  }

  _title() => const Text('Recipes Center',
      style: TextStyle(fontWeight: FontWeight.bold));

  _copyRight() => const Text(
        '© 2024 Recipes Center',
        style: TextStyle(color: AppConst.grey, fontSize: 12),
      );

  get _buttons => [
        TextButton(
            onPressed: () {},
            child: const Text(
              'Recipes',
              style: TextStyle(color: Colors.black, fontSize: 14),
            )),
        TextButton(
            onPressed: () {},
            child: const Text(
              'About',
              style: TextStyle(color: Colors.black, fontSize: 14),
            )),
        TextButton(
            onPressed: () {},
            child: const Text(
              'Contacts',
              style: TextStyle(color: Colors.black, fontSize: 14),
            )),
        TextButton(
            onPressed: () {},
            child: const Text(
              'Blog',
              style: TextStyle(color: Colors.black, fontSize: 14),
            )),
      ];
}
