class Contest {
  String day;
  int lenght;

  Contest(this.day, this.lenght);
}

class OnlineJadge {
  String name;
  String imageUrl;
  List<Contest> contest;

  OnlineJadge(this.name, this.imageUrl, this.contest);

  static List<OnlineJadge> onilneJadge = [
    OnlineJadge(
      'CodeForces',
      'assets/codeforces.png',
      [
        Contest('11 / 3', 3),
        Contest('11 / 4', 3),
        Contest('11 / 5', 2),
      ],
    ),
    OnlineJadge(
      'Code chef',
      'assets/codechef.png',
      [
        Contest('11 / 3', 3),
        Contest('11 / 4', 3),
        Contest('11 / 5', 2),
      ],
    ),
    OnlineJadge(
      'Hacker rank',
      'assets/hackerrank.png',
      [
        Contest('11 / 3', 3),
        Contest('11 / 4', 3),
        Contest('11 / 5', 2),
      ],
    ),
    OnlineJadge(
      'Leetcode',
      'assets/leetcode.png',
      [
        Contest('11 / 3', 3),
        Contest('11 / 4', 3),
        Contest('11 / 5', 2),
      ],
    ),
    OnlineJadge(
      'atcoder',
      'assets/atcoder.png',
      [
        Contest('11 / 3', 3),
        Contest('11 / 4', 3),
        Contest('11 / 5', 2),
      ],
    ),
  ];
}
