import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ecommerce_app/models/product.dart';
import 'package:flutter_ecommerce_app/models/shop_data.dart';
import 'package:provider/provider.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile({super.key, required this.product});

  //add to cart button pressed
  void addToCart(BuildContext context) {
    //show a dialog box to ask user to confirm add to cart action
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: const Text('Add this item to your cart?'),
              actions: [
                //cancel button
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),

                //yes button
                MaterialButton(
                  onPressed: () {
                    // pop dialog box
                    Navigator.pop(context);

                    //add to cart
                    context.read<Shop>().addToCart(product);
                  },
                  child: const Text('Yes'),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //product image
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.all(25),
                  width: double.infinity,
                  child: Image.asset(product.imagePath),
                ),
              ),

              const SizedBox(
                height: 25,
              ),

              //product name
              Text(
                product.name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),

              const SizedBox(
                height: 10,
              ),

              //product description
              Text(
                product.description,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
            ],
          ),

          //product price + add to cart button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //product price
              Text(product.price.toStringAsFixed(2)),

              //add to cart button
              Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(12)),
                  child: IconButton(
                      onPressed: () => addToCart(context),
                      icon: const Icon(Icons.add)))
            ],
          )
        ],
      ),
    );
  }
}
