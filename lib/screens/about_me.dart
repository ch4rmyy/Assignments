import 'package:unit6_assignment_continente/components/tab_widget_1.dart';
import 'package:unit6_assignment_continente/components/tab_widget_2.dart';
import 'package:flutter/material.dart';

class About_Me extends StatefulWidget {
  const About_Me({super.key});

  @override
  State<About_Me> createState() => _AboutMeState();
}

class _AboutMeState extends State<About_Me> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("About Me"),
          bottom: const TabBar(
            tabs: [
              Tab(icon: TabWidget1()),
              Tab(icon: TabWidget2()),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("I love Art.", style: TextStyle(fontSize: 25),),
                  Image.network(
                    'https://ilovelibraries.org/wp-content/uploads/2020/08/libartists-opengraph-768x403.png',
                    height: 180,
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("I love Music.", style: TextStyle(fontSize: 25),),
                  Image.network(
                    'https://i.pinimg.com/736x/6d/55/e9/6d55e9c69cd29198bdfc38b00e0212a4.jpg',
                    height: 350,
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
