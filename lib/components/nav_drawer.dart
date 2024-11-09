import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Drawer build(BuildContext context) {
    return Drawer(
        elevation: 20.0,
        child: Drawer(
            elevation: 20.0,
            backgroundColor: const Color(0xFFF8F8F8),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  DrawerHeader(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        const SizedBox(
                          width: 10,
                        ),
                        _appBarTitle
                      ])),
                  ListTile(
                    title: const Center(child: Text('Recipes')),
                    leading: const Icon(Icons.chevron_left),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Center(child: Text('About')),
                    leading: const Icon(Icons.chevron_left),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Center(child: Text('Contacts')),
                    leading: const Icon(Icons.chevron_left),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Center(child: Text('Blog')),
                    leading: const Icon(Icons.chevron_left),
                    onTap: () {},
                  ),
                  const Divider(color: Colors.grey),
                  ListTile(
                    title: const Center(child: Text('Log in')),
                    leading: const Icon(Icons.chevron_left),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Center(child: Text('Sign Up')),
                    leading: const Icon(Icons.chevron_left),
                    onTap: () {},
                  ),
                ],
              ),
            )));
  }

  Text get _appBarTitle => const Text(
        'Recipes Center',
        style: TextStyle(fontWeight: FontWeight.bold),
      );
}
