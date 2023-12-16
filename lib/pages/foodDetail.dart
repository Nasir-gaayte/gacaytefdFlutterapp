import 'package:flutter/material.dart';
import 'package:gacayte_f_d/model/itemModle.dart';
import 'package:gacayte_f_d/porvider/itemsProvider.dart';
import 'package:provider/provider.dart';

class FoodDetail extends StatefulWidget {
  Items items;
  FoodDetail({super.key, required this.items});

  @override
  State<FoodDetail> createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  var qty = 1;
  void removeQty() {
    setState(() {
      if (qty > 1) {
        qty--;
      }
    });
  }

  void addQty() {
    setState(() {
      qty++;
    });
  }

  void addToCart() {
    if (qty > 0) {
      final itmeP = Provider.of<ItemProvider>(context, listen: false)
          .addItems(widget.items, qty);
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          content: Text('dalabkaagi wuxuu u gudbay adeegaga'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                icon: Icon(Icons.done))
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        title: Center(child: Text('Sifada iyo Dalab')),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(children: [
          Expanded(
              flex: 5,
              child: Column(
                children: [
                  Container(
                    height: 150,
                    width: double.maxFinite,
                    child: Image(
                      image: NetworkImage(
                        'https://gacaytehotel.pythonanywhere.com${widget.items.img}',
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Title(
                    color: Colors.black,
                    child: Text(widget.items.item),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(widget.items.desc),
                  SizedBox(
                    height: 20,
                  ),
                ],
              )),
          Expanded(
              child: Container(
            decoration: BoxDecoration(color: Colors.blueGrey[300]),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '\$ ${widget.items.price}',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blueGrey[200],
                          borderRadius: BorderRadius.circular(25)),
                      child: IconButton(
                        icon: Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 25,
                        ),
                        onPressed: removeQty,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                      child: Center(
                          child: Text(
                        qty.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      )),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blueGrey[200],
                          borderRadius: BorderRadius.circular(25)),
                      child: IconButton(
                          onPressed: addQty,
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 25,
                          )),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                TextButton.icon(
                  onPressed: addToCart,
                  icon: Icon(
                    Icons.shopping_cart,
                    size: 40,
                  ),
                  label: Text(
                    'DALBO',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          )),
        ]),
      ),
    );
  }
}
