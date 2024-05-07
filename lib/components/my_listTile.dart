import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? ontap;
  const MyListTile(
      {super.key, required this.text, required this.icon, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: ListTile(
        onTap: ontap,
        leading: Icon(
          icon,
          color: Colors.grey,
        ),
        title: Text(text),
      ),
    );
  }
}
