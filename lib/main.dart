import 'package:unit6_assignment_continente/screens/about_me.dart';
import 'package:unit6_assignment_continente/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 31, 68, 149)),
      ),
      // Create the routes heres
      initialRoute: 'home',
      routes: {
        'home': (context) => const HomeScreen(),
        'about': (context) => const About_Me(),
      },    

    );
  }
}
