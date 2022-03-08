class OnlineJudge {
  String name;
  String imageUrl;
  String route ;
  OnlineJudge(this.name, this.imageUrl , this.route );
}

List<OnlineJudge> onlineJudge = [
  OnlineJudge(
    'CodeForces',
    'assets/codeforces.png',
    'codeforces' ,
  ),
  OnlineJudge(
    'Code chef',
    'assets/codechef.png',
    'codechef' ,
  ),
  OnlineJudge(
    'Hacker rank',
    'assets/hackerrank.png',
    'hackerrank' ,
  ),
  OnlineJudge(
    'Leetcode',
    'assets/leetcode.png',
    'leetcode' ,
  ),
  OnlineJudge(
    'AtCoder',
    'assets/atcoder.png',
    'atcoder' ,
  ),
];
