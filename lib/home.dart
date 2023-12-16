import 'dart:isolate';

import 'package:flutter/material.dart';

import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:gacayte_f_d/pages/cabitaan.dart';
import 'package:gacayte_f_d/pages/cart.dart';
import 'package:gacayte_f_d/pages/casho.dart';
import 'package:gacayte_f_d/pages/qado.dart';
import 'package:gacayte_f_d/pages/into_page.dart';
import 'package:gacayte_f_d/pages/quraac.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[300],
      body: CarouselSlider(
          unlimitedMode: true,
          slideIndicator: CircularSlideIndicator(
            padding: EdgeInsets.only(bottom: 15),
            currentIndicatorColor: Colors.white,
          ),
          slideTransform: const CubeTransform(),
          children: [
            IntoPage(),
            QuraacPage(),
            QadoPage(),
            CashoPage(),
            Cabitaan(),
            CartPage(),
          ]),
    );
  }
}
