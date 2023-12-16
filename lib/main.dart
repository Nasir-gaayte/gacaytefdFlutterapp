import 'package:flutter/material.dart';
import 'package:gacayte_f_d/home.dart';
import 'package:gacayte_f_d/porvider/itemsProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ItemProvider(),
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: HomePage()),
    );
  }
}

class SnackBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(
          'sms permission is for send text message only<si add u codsatid waa in aad ogalaato sms Permission>'),
    );
  }
}

class SnackBarWidgetS1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text('you can send sms know '),
    );
  }
}
