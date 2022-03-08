import 'package:flutter/material.dart' ;
import 'home.dart';

import '../Widgets/container.dart';
import 'upcoming.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List pages = [
    const Home() ,
    const Upcoming()
  ];
  int _currentIndex = 0 ;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text( "Contest Schedule" , style: TextStyle( fontSize: 25 ),),
          centerTitle: true,
          backgroundColor: Colors.greenAccent,
        ),
        body: pages[_currentIndex] ,
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon( Icons.home_outlined ) , label: "home") ,
            BottomNavigationBarItem(icon: Icon( Icons.upcoming_outlined ) , label: "upcoming" ) ,
          ],
          currentIndex: _currentIndex ,
          selectedItemColor: Colors.greenAccent,
          onTap: ( int value ){
            setState(() {
              _currentIndex = value ;
            });
          },
        )
      ),
    );
  }
}
