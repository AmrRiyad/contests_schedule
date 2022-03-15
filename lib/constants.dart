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
    'CodeForces',
    'assets/codeforceswithno.png',
    'codeforces',
  ),
  OnlineJudge(
    'Codechef',
    'assets/codechef.png',
    'codechef',
  ),
  OnlineJudge(
    'Hackerrank',
    'assets/hackerrankwithno.png',
    'hackerrank',
  ),
  OnlineJudge(
    'Leetcode',
    'assets/leetcodewithno.png',
    'leetcode',
  ),
  OnlineJudge(
    'AtCoder',
    'assets/atcoderwithno.png',
    'atcoder',
  ),
];
