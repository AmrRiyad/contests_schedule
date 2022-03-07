import 'dart:convert';
import 'package:contests_schedule/Widgets/card.dart';
import 'package:contests_schedule/online%20judges/codeforces.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Upcoming extends StatefulWidget {
  const Upcoming({Key? key}) : super(key: key);

  @override
  State<Upcoming> createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  CodeforcesContest codeforcesContest = CodeforcesContest(platform: '', contestDate: '', contestDuration: '', contestName: '', contestTime: '');
  Future getCodeforcesData() async{
      final response = await http.get(Uri.parse('https://codeforces.com/api/contest.list?gym=false'));

      if(response.statusCode == 200){
        // If the server did return a 200 OK response,
        // then parse the JSON.
        setState(() {
          codeforcesContest = CodeforcesContest.fromJson(jsonDecode(response.body));
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
            platform: codeforcesContest.platform,
            contestDate: codeforcesContest.contestDate,
            contestDuration: codeforcesContest.contestDuration,
            contestName: codeforcesContest.contestName,
            contestTime: codeforcesContest.contestTime,
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
