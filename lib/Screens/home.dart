import 'package:flutter/material.dart';

import '../Widgets/container.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            MyContainer(name: 'Codeforces', srcImg: 'assets/codeforces.png', navName: '') ,
            MyContainer(name: 'Codechef', srcImg: 'assets/codechef.png', navName: '')
          ],
        ) ,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            MyContainer(name: 'AtCoder', srcImg: 'assets/atcoder.png', navName: '') ,
            MyContainer(name: 'Hackerrank', srcImg: 'assets/hackerrank.png', navName: '') ,
          ],
        ) ,
        const MyContainer(name: 'Leetcode', srcImg: 'assets/leetcode.png', navName: '')
      ],
    );
  }
}
