
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:contactus/contactus.dart';
import '../widgets/button.dart';

class IntoPage extends StatelessWidget {
  const IntoPage({super.key});

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
        elevation: 0,
      ),
      backgroundColor: Color.fromARGB(255, 184, 100, 94),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 0,
              ),
              Text(
                'GACAYTE HOTE',
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 28,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                height: 175,
                width: 200,
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
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'hada adigu qadanayso ama rabtid in laguu soo diro fdlan dalba cuntada waqitigaa hada lojoogo ',
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 15,
                  color: Colors.grey[200],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: MyButton(
                  text: 'jiid',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
