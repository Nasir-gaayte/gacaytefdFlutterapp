import 'package:flutter/material.dart';

import '../model/itemModle.dart';

class SmsWdiget extends StatelessWidget {
  Items items;
  SmsWdiget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Card(
          borderOnForeground: true,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(items.item),
              Text("\$ ${items.price}"),
            ],
          ),
        ),
      ),
    );
  }
}
