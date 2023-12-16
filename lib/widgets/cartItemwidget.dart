import 'package:flutter/material.dart';
import 'package:gacayte_f_d/model/itemModle.dart';
import 'package:provider/provider.dart';

import '../porvider/itemsProvider.dart';

class CartItemWidget extends StatefulWidget {
  Items items;
  CartItemWidget({super.key, required this.items});

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
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
              Container(
                  height: 60,
                  width: 60,
                  child: Image(
                      image: NetworkImage(
                          'https://gacaytehotel.pythonanywhere.com${widget.items.img}'))),
              Text(widget.items.item),
              Text("\$ ${widget.items.price}"),
              IconButton(
                  onPressed: () {
                    Provider.of<ItemProvider>(context, listen: false)
                        .removeFormCart(widget.items);
                  },
                  icon: Icon(
                    Icons.delete,
                    size: 25,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
