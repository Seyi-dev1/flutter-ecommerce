import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/components/my_listTile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: Column(
        children: [
          //drawer header
          DrawerHeader(
              child: Icon(
            Icons.shopping_bag,
            size: 62,
            color: Theme.of(context).colorScheme.inversePrimary,
          )),
          const SizedBox(
            height: 25,
          ),
          //shop tile,
          MyListTile(
            text: 'Shop',
            icon: Icons.home,
            ontap: () => Navigator.pop(context),
          ),
          //cart tile,
          MyListTile(
              text: 'Cart',
              icon: Icons.shopping_cart,
              ontap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/cart_page');
              }),

          //exit shop
          MyListTile(
              text: 'Exit',
              icon: Icons.logout,
              ontap: () => Navigator.pushNamed(context, '/intro_page')),
        ],
      ),
    );
  }
}
