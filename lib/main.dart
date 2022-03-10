import 'package:contests_schedule/Screens/OnlineJudges/atcoder.dart';
import 'package:contests_schedule/Screens/OnlineJudges/codechef.dart';
import 'package:contests_schedule/Screens/OnlineJudges/codeforces.dart';
import 'package:contests_schedule/Screens/OnlineJudges/hackerrank.dart';
import 'package:contests_schedule/Screens/OnlineJudges/leetcode.dart';
import 'Screens/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'home',
    theme: ThemeData(
      fontFamily: 'Avenir',
    ),
    routes: {
      'leetcode': (context) => leetcode(),
      'atcoder': (context) => atcoder(),
      'hackerrank': (context) => hackerrank(),
      'codechef': (context) => codechef(),
      'codeforces': (context) => codeforces(),
      'home': (context) => HomePage(),
    },
  ));
}
