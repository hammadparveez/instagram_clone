import 'package:flutter/material.dart';

import 'package:instagram_clone/src/config/scroll_config.dart';
import 'package:instagram_clone/src/view/home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: DragScrollBehaviorMacOS(),
      theme: ThemeData(
          bottomNavigationBarTheme:
              const BottomNavigationBarThemeData(backgroundColor: Colors.white),
          primaryColor: Colors.white,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white, centerTitle: false, elevation: 0),
          scaffoldBackgroundColor: Colors.white,
          colorScheme: const ColorScheme.light(onPrimary: Colors.black)),
      home: const HomeScreen(),
    );
  }
}
