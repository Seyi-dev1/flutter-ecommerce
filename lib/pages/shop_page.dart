import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/components/my_drawer.dart';
import 'package:flutter_ecommerce_app/components/product_tile.dart';
import 'package:flutter_ecommerce_app/models/shop_data.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    //access products in shop
    final products = context.watch<Shop>().shop;
    return Scaffold(
        appBar: AppBar(
          actions: [
            //go to cart button
            IconButton(
                onPressed: () => Navigator.pushNamed(context, '/cart_page'),
                icon: const Icon(Icons.shopping_cart_outlined)),
          ],
          centerTitle: true,
          elevation: 0,
          title: const Text('Shop'),
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        drawer: const MyDrawer(),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: ListView(
          children: [
            const SizedBox(
              height: 25,
            ),
            //shop subtitle
            Center(
                child: Text(
              'Pick from a selected list of premium products',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            )),

            //product list
            SizedBox(
              height: 550,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  padding: const EdgeInsets.all(15),
                  itemBuilder: (context, index) {
                    //get each individual product from shop
                    final product = products[index];

                    // return each individual product as a product tile ui
                    return ProductTile(product: product);
                  }),
            )
          ],
        ));
  }
}
