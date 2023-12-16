import 'package:flutter/material.dart';
import 'package:gacayte_f_d/model/itemModle.dart';
import 'package:gacayte_f_d/pages/foodDetail.dart';
import 'package:gacayte_f_d/porvider/itemsProvider.dart';
import 'package:provider/provider.dart';

class ItemCardWidget extends StatefulWidget {
  Items items;

  ItemCardWidget({
    super.key,
    required this.items,
  });

  @override
  State<ItemCardWidget> createState() => _ItemCardWidgetState();
}

class _ItemCardWidgetState extends State<ItemCardWidget> {
  void addToList() {
    print(widget.items.item);
    setGetItem(context, widget.items);
    print(Provider.of<ItemProvider>(context, listen: false)
        .items
        .map((e) => e.item));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return FoodDetail(items: widget.items);
          },
        ));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(194, 255, 255, 255),
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 80,
              child: Image(
                image: NetworkImage(
                  'https://gacaytehotel.pythonanywhere.com${widget.items.img}',
                ),
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  widget.items.item.toUpperCase().toString(),
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  ' \$ ${widget.items.price}',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
