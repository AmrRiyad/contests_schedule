import 'package:contests_schedule/Screens/OnlineJudges/atcoder.dart';
import 'package:contests_schedule/Screens/OnlineJudges/codechef.dart';
import 'package:contests_schedule/Screens/OnlineJudges/codeforces.dart';
import 'package:contests_schedule/Screens/OnlineJudges/hackerrank.dart';
import 'package:contests_schedule/Screens/OnlineJudges/leetcode.dart';
import 'package:flutter/material.dart';

import 'Screens/homepage.dart';

class OnlineJudge {
  String name;
  String imageUrl;
  String route;
  OnlineJudge(this.name, this.imageUrl, this.route);
}

List<OnlineJudge> onlineJudge = [
  OnlineJudge(
    'codeforces',
    'assets/codeforceswithno.png',
    'codeforces',
  ),
  OnlineJudge(
    'codechef',
    'assets/codechef.png',
    'codechef',
  ),
  OnlineJudge(
    'hackerrank',
    'assets/hackerrankwithno.png',
    'hackerrank',
  ),
  OnlineJudge(
    'leetcode',
    'assets/leetcodewithno.png',
    'leetcode',
  ),
  OnlineJudge(
    'atcoder',
    'assets/atcoderwithno.png',
    'atcoder',
  ),
];
