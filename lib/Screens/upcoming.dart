import 'dart:convert';
import 'package:contests_schedule/Widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class CodeforcesContest{
  final String platform;
  final String contestDate;
  final String contestDuration;
  final String contestName;
  final String contestTime;

  CodeforcesContest({
    required this.platform,
    required this.contestDate,
    required this.contestDuration,
    required this.contestName,
    required this.contestTime,
  });

  factory CodeforcesContest.fromJson(Map<String, dynamic>json){
    int relativeSeconds = json['result'][0]['relativeTimeSeconds'] * -1;
    double durationSeconds = json['result'][0]['durationSeconds']~/3600 + ((((json['result'][0]['durationSeconds']/3600)-(json['result'][0]['durationSeconds']~/3600))*60)/100);
    String formattedDate = DateTime.now().add(Duration(seconds: relativeSeconds)).toString();
    String contestDate = formattedDate.substring(0,10);
    String contestTime = formattedDate.substring(10,16);
    return CodeforcesContest(
      platform: 'Codeforces',
      contestDate: contestDate,
      contestDuration: durationSeconds.toString() + ' Hours',
      contestName: json['result'][0]['name'],
      contestTime: contestTime,
    );
  }
}
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
