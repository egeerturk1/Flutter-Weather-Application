import 'package:flutter/material.dart';
import 'package:hava_durumu/tools/locator.dart';
import 'package:hava_durumu/view/login_page.dart';
import 'package:hava_durumu/view_model/login_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          title: 'Hava Durumu',
          theme: ThemeData.dark(),
          home: ChangeNotifierProvider(
            create:(context) => LoginViewModel(),
            child: LoginPage(),
          ),
      ),
    );
  }
}