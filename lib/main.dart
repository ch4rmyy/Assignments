import 'package:unit7_assignment_continente/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:unit7_assignment_continente/screens/second_page.dart';
import 'package:unit7_assignment_continente/screens/third_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demon Slayer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 234, 20, 41)),
        useMaterial3: true,
      ),

      initialRoute: "/",
      routes: {
        "/":(context) => const HomeScreen(),
        "/secondPage":(context) =>const SecondPage(),
        "/thirdPage": (context) => const ThirdPage(),
      },
    );
  }
}
