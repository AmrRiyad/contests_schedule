class OnlineJudge {
  String name;
  String imageUrl;

  OnlineJudge(this.name, this.imageUrl);

  static List<OnlineJudge> onlineJudge = [
    OnlineJudge(
      'CodeForces',
      'assets/codeforces.png',
    ),
    OnlineJudge(
      'Code chef',
      'assets/codechef.png',
    ),
    OnlineJudge(
      'Hacker rank',
      'assets/hackerrank.png',
    ),
    OnlineJudge(
      'Leetcode',
      'assets/leetcode.png',
    ),
    OnlineJudge(
      'atcoder',
      'assets/atcoder.png',
    ),
  ];
}
