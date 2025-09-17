
import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';
import 'package:gacayte_f_d/pages/cart.dart';
import 'package:google_fonts/google_fonts.dart';

import '../api/itemApi.dart';
import '../widgets/itemcardwidget.dart';

class Cabitaan extends StatefulWidget {
  const Cabitaan({super.key});

  @override
  State<Cabitaan> createState() => _CabitaanState();
}

class _CabitaanState extends State<Cabitaan> {
  String searchBy = 'cabitan';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 234, 122, 114),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(35)),
              color: Color.fromARGB(255, 162, 86, 81),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'GACAYTE HOTE',
                    style: GoogleFonts.dmSerifDisplay(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Container(
                    height: 100,
                    width: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/gacayteFDLogo.jpg'),
                          fit: BoxFit.contain),
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Kusoo Dhawoow Adeega Cunto Qadahsada Ee Maqaaxida Gacayte Hotel',
                    style: GoogleFonts.dmSerifDisplay(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.call,
                      size: 40,
                    ),
                    title: Text('002520000000'),
                    subtitle: Text('www.gaaytepeak.com'),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Text('sharkada samaysay appka '),
                        SizedBox(
                          height: 15,
                        ),
                        ContactUs(
                          companyName: 'Som Devops',
                          companyFontSize: 25,
                          textColor: Colors.white,
                          cardColor: Colors.tealAccent,
                          companyColor: Colors.black,
                          taglineColor: Colors.greenAccent,
                          email: "somoappmaker@gmail.com",
                          phoneNumber: '00252905500009',
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 10,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CartPage(),
                ));
              },
              icon: Icon(
                Icons.shopping_cart,
                size: 35,
              ),
            ),
          )
        ],
      ),
      backgroundColor: Colors.yellow[200],
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 50,
              child: Text(
                '${searchBy}'.toUpperCase(),
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: FutureBuilder(
                    future: ItemApi().getItemList(),
                    builder: (context, s) {
                      if (s.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (s.hasError) {
                        return Text('${s.error}');
                      } else {
                        final items = s.data!
                            .where((item) => item.category == searchBy)
                            .toList();
                        return GridView.builder(
                          itemCount: items.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) {
                            final item = items[index];
                            return ItemCardWidget(items: item);
                          },
                        );
                      }
                    })),
          ],
        ),
      ),
    );
  }
}
