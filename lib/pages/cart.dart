import 'package:flutter/material.dart';
import 'package:gacayte_f_d/widgets/button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:gacayte_f_d/porvider/itemsProvider.dart';
import 'package:gacayte_f_d/widgets/cartItemwidget.dart';

import 'package:provider/provider.dart';

import '../model/itemModle.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    double totalP = 0.0;
    final List<String> roomlist = [
      'fadlan gali qolkaga',
      'A1',
      'A2',
      'A3',
      'A4',
      'A5',
      'A6',
      'A7',
      'A8',
      'A9',
      'A10',
      'B1',
      'B2',
      'B3',
      'B4',
      'B5',
      'B6',
      'B7',
      'B8',
      'B9',
      'B10',
      'C1',
      'C2',
      'C3',
      'C4',
      'C5',
      'C6',
      'C7',
      'C8',
      'D1',
      'D2',
      'D3',
      'D4',
      'D5',
      'D6',
      'D7',
      'D8',
      'E1',
      'E2',
      'E3',
      'E4',
      'E5',
      'E6',
      'E7',
      'E8',
      'F1',
      'F2',
      'F3',
      'F4',
      'F5',
      'F6',
      'F7',
      'F8',
    ];
    String roomNum = roomlist.first;

    List<Items> i = Provider.of<ItemProvider>(context, listen: false).items;
    gettotalPrice() {
      double t = 0.0;

      i.forEach((element) {
        t += element.price;
      });
      setState(() {
        print(t);
        totalP = t;
      });
    }

    sendWithSms(String tel, String sms) async {
      final url = Uri.parse('sms:$tel?body=$sms');
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Waxbaa kaa qaldamay ';
      }
    }

    sendWithWhatsapp(String tel, String sms) async {
      final url = Uri.parse('https://wa.me/$tel?body=$sms');
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Waxbaa kaa qaldamay ';
      }
    }

    gettotalPrice();

    // void _sendSMS(String message, String recipents) async {
    //   String _result = await sendSMS(message: message, recipients: [recipents])
    //       .catchError((onError) {
    //     return onError;
    //   });
    //   print(_result);
    // }

    return Consumer<ItemProvider>(
        builder: (context, value, child) => Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 7,
                title: Center(child: Text('ADEEGAGA')),
              ),
              backgroundColor: Color.fromARGB(255, 250, 184, 184),
              body: SafeArea(
                  child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 5,
                          child: ListView.builder(
                            itemCount: value.items.length,
                            itemBuilder: (context, index) {
                              final Items items = value.items[index];
                              return CartItemWidget(items: items);
                            },
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 230,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 253, 119, 110),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15))),
                          child: Center(
                            child: Text(
                              'TOTAL \$ ${totalP}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.yellowAccent,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 253, 119, 110)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 200,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 250, 184, 184),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: TextButton.icon(
                              onPressed: () async {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 300,
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            child: TextButton.icon(
                                                onPressed: () async {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        content: Text(
                                                            'Dooro qaabka xiriirka'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () {
                                                              sendWithSms(
                                                                  '00252904144066',
                                                                  'WAA DALAB XAA FADEED ${value.items.map((e) => e.item.toString())} \n \n total ${totalP}');
                                                            },
                                                            child: Text(
                                                                'Kudir SMS'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () {
                                                              sendWithWhatsapp(
                                                                  '+252904144066',
                                                                  'WAA DALAB XAA FADEED ${value.items.map((e) => e.item.toString())} \n \n total ${totalP}');
                                                            },
                                                            child: Text(
                                                                'Kudir WhatSapp'),
                                                          )
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                                icon: Icon(
                                                  Icons.taxi_alert,
                                                  size: 25,
                                                  color: Colors.white,
                                                ),
                                                label: ListTile(
                                                  title: Text('XAAFADA',
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                  subtitle: Text(
                                                      'waxaa lagu soo sarayaa taxi',
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                )),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Container(
                                            width: 300,
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            child: TextButton.icon(
                                                onPressed: () async {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        content: Text(
                                                            'Dooro qaabka xiriirka'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () {
                                                              sendWithSms(
                                                                  '00252904144066',
                                                                  'WAA DALAB XAA FADEED ${value.items.map((e) => e.item.toString())} \n \n total ${totalP}');
                                                            },
                                                            child: Text(
                                                                'Kudir SMS'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () {
                                                              sendWithWhatsapp(
                                                                  '+252904144066',
                                                                  'WAA DALAB XAA FADEED ${value.items.map((e) => e.item.toString())} \n \n total ${totalP}');
                                                            },
                                                            child: Text(
                                                                'Kudir WhatSapp'),
                                                          )
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                                icon: Icon(
                                                  Icons.handshake,
                                                  size: 25,
                                                  color: Colors.white,
                                                ),
                                                label: ListTile(
                                                  title: Text(
                                                    'SODOONO',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  subtitle: Text(
                                                      'adigaa u imaanaya waqtiga fadlan sheeg',
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                )),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Container(
                                            width: 300,
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            child: TextButton.icon(
                                                onPressed: () async {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: SimpleDialog(
                                                          backgroundColor:
                                                              Color.fromARGB(
                                                                  255,
                                                                  250,
                                                                  229,
                                                                  169),
                                                          title: Text(
                                                            'dooro qolka',
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          children: [
                                                            DropdownButton<
                                                                String>(
                                                              dropdownColor:
                                                                  Color
                                                                      .fromARGB(
                                                                          255,
                                                                          237,
                                                                          253,
                                                                          155),
                                                              value: roomNum,
                                                              onChanged:
                                                                  (value) {
                                                                setState(() {
                                                                  roomNum = value
                                                                      .toString();
                                                                });
                                                              },
                                                              items: roomlist
                                                                  .map((String
                                                                      value) {
                                                                return DropdownMenuItem<
                                                                    String>(
                                                                  child: Text(
                                                                      value),
                                                                  value: value,
                                                                );
                                                              }).toList(),
                                                            ),
                                                            Row(
                                                              children: [
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      roomNum =
                                                                          roomlist
                                                                              .first;
                                                                    });
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child: MyButton(
                                                                      text:
                                                                          'Ka noqo'),
                                                                ),
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    if (roomNum
                                                                            .isNotEmpty &&
                                                                        roomNum !=
                                                                            roomlist.first) {
                                                                      showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return AlertDialog(
                                                                            content:
                                                                                Text('Dooro qaabka xiriirka'),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () {
                                                                                  sendWithSms('00252904144066', 'WAA DALAB XAA FADEED ${value.items.map((e) => e.item.toString())} \n \n total ${totalP}');
                                                                                },
                                                                                child: Text('Kudir SMS'),
                                                                              ),
                                                                              TextButton(
                                                                                onPressed: () {
                                                                                  sendWithWhatsapp('+252904144066', 'WAA DALAB XAA FADEED ${value.items.map((e) => e.item.toString())} \n \n total ${totalP}');
                                                                                },
                                                                                child: Text('Kudir WhatSapp'),
                                                                              )
                                                                            ],
                                                                          );
                                                                        },
                                                                      );
                                                                      setState(
                                                                          () {
                                                                        roomNum =
                                                                            roomlist.first;
                                                                      });
                                                                    } else {
                                                                      showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return AlertDialog(
                                                                            title:
                                                                                Text('fadlan gali qol horta '),
                                                                            actions: [
                                                                              IconButton(
                                                                                icon: Icon(Icons.done),
                                                                                onPressed: () {
                                                                                  Navigator.pop(context);
                                                                                },
                                                                              )
                                                                            ],
                                                                          );
                                                                        },
                                                                      );
                                                                    }
                                                                  },
                                                                  child: MyButton(
                                                                      text:
                                                                          'Dalbo'),
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                icon: Icon(
                                                  Icons.room,
                                                  size: 25,
                                                  color: Colors.white,
                                                ),
                                                label: ListTile(
                                                  title: Text(
                                                    'hotelka',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  subtitle: Text(
                                                    'waxaa lagu soo sarayaa taxi',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                )),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Container(
                                            width: 200,
                                            decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 250, 184, 184),
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            child: TextButton.icon(
                                              onPressed: () async {
                                                Navigator.pop(context);
                                              },
                                              icon: Icon(
                                                Icons.payment,
                                                size: 25,
                                                color: Colors.white,
                                              ),
                                              label: Text(
                                                'Ka noqo',
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              icon: Icon(
                                Icons.arrow_drop_down,
                                size: 25,
                                color: Colors.white,
                              ),
                              label: Text(
                                'Qabka',
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            width: 200,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 250, 184, 184),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: TextButton.icon(
                              onPressed: () {
                                setState(() {
                                  value.items.clear();
                                });
                              },
                              icon: Icon(
                                Icons.exit_to_app_rounded,
                                size: 25,
                                color: Colors.white,
                              ),
                              label: Text(
                                'KA NOQO',
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )),
            ));
  }
}
