import 'package:contests_schedule/Screens/temp.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'upcoming.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List pages = [
    const NewHome(),
    // const Home() ,
    const Upcoming()
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {},
        ),
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.purpleAccent, Colors.blueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.3, 0.7],
          )),
          child: pages[_currentIndex],
        ),
        backgroundColor: Colors.black,
        extendBody: true,
        bottomNavigationBar: CurvedNavigationBar(
          items: const [
            Icon(Icons.home),
            Icon(Icons.upcoming),
          ],
          backgroundColor: Colors.transparent,
          animationDuration: const Duration(milliseconds: 350),
          index: _currentIndex,
          height: 60,
          onTap: (int value) {
            setState(() {
              _currentIndex = value;
            });
          },
        ),
      ),
    );
  }
}
