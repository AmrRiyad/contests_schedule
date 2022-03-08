import 'dart:convert';
import 'package:contests_schedule/Widgets/card.dart';
import 'package:contests_schedule/online%20judges/codeforces.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

int compareTwoContestsBasedOnDate(Contest contest1, Contest contest2){
  if(contest1.key.compareTo(contest2.key) > 0){
    return 1;
  }else{
    return 0;
  }
}
class Contest{
  final String platform;
  final String contestDate;
  final String contestDuration;
  final String contestName;
  final String contestTime;
  final DateTime key;

  Contest({
    required this.platform,
    required this.contestDate,
    required this.contestDuration,
    required this.contestName,
    required this.contestTime,
    required this.key,
  });
}
class Upcoming extends StatefulWidget {
  const Upcoming({Key? key}) : super(key: key);

  @override
  State<Upcoming> createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  List<Contest> contests = [];
  Future getCodeforcesData() async{
      final response = await http.get(Uri.parse('https://codeforces.com/api/contest.list?gym=false'));

      if(response.statusCode == 200){
        // If the server did return a 200 OK response,
        // then parse the JSON.
        setState(() {
            for(int i = 0; i < 10; i++){
                if(jsonDecode(response.body)['result'][i]['phase'] != "FINISHED"){
                    contests.add(CodeforcesContest.fromJson(jsonDecode(response.body), i));
                }
            }
            contests.sort(compareTwoContestsBasedOnDate);
        });
      }else{
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load Codeforces data');
      }
  }

  @override
  void initState(){
    super.initState();
    getCodeforcesData();
  }


  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children:[
          MyCard(
            platform: contests[0].platform,
            contestDate: contests[0].contestDate,
            contestDuration: contests[0].contestDuration,
            contestName: contests[0].contestName,
            contestTime: contests[0].contestTime,
          ),
          MyCard(
            platform: contests[1].platform,
            contestDate: contests[1].contestDate,
            contestDuration: contests[1].contestDuration,
            contestName: contests[1].contestName,
            contestTime: contests[1].contestTime,
          ),
          MyCard(
            platform: contests[1].platform,
            contestDate: contests[1].contestDate,
            contestDuration: contests[1].contestDuration,
            contestName: contests[1].contestName,
            contestTime: contests[1].contestTime,
          ),
          MyCard(
            platform: "Codeforces",
            contestDate: "12/02/2022",
            contestDuration: "2 hours",
            contestName: "Global round 19",
            contestTime: "16:35 pm",
          ),
          MyCard(
            platform: "Codeforces",
            contestDate: "12/02/2022",
            contestDuration: "2 hours",
            contestName: "Global round 19",
            contestTime: "16:35 pm",
          ),
        ],
      ),
    );
  }
}
