import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/languages.dart';
import 'package:get_x/screen_two.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // themeMode: ThemeMode.system,
      // theme: ThemeData(
      //   appBarTheme: AppBarTheme(
      //     backgroundColor: Colors.purple.shade800,
      //     titleTextStyle: const TextStyle(color: Colors.white,fontSize: 25),
      //     centerTitle: true,
      //   ),
      // ),
      // darkTheme: ThemeData(
      //   appBarTheme: AppBarTheme(
      //       backgroundColor: Colors.purple.shade800,
      //       titleTextStyle: const TextStyle(color: Colors.white,fontSize: 25),
      //       centerTitle: true,
      //     ),
      //   listTileTheme: const ListTileThemeData(
      //     titleTextStyle: TextStyle(color: Colors.black),
      //   )
      // ),

      // home: MyHome(),
      translations: Languages(),
      locale: const Locale('bn','BD'),
      fallbackLocale: const Locale('en','US'),
      getPages: [
        GetPage(name: '/', page: ()=> const MyHome()),
        GetPage(name: '/ScreenTwo', page: ()=> ScreenTwo()),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}

