import 'dart:convert';
import 'package:contests_schedule/Widgets/card.dart';
import 'package:contests_schedule/online%20judges/fetch.dart';
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

  late Future<List<Contest>> futureContests;
  Future<List<Contest>> getCodeforcesData() async{
    final response = await http.get(Uri.parse('https://c...content-available-to-author-only...s.com/api/contest.list?gym=false'));
    List<Contest> contests = [];
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
    return contests;
  }

  @override
  void initState(){
    super.initState();
    futureContests = getCodeforcesData();
  }


  Widget build(BuildContext context) {
    return FutureBuilder(
        future:  futureContests,
        builder: (context, AsyncSnapshot<dynamic> snapshot ){
          if ( snapshot.connectionState == ConnectionState.waiting ){
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.greenAccent ,
              ),
            );
          }
          else if ( snapshot.connectionState == ConnectionState.done ){
            return ListView.builder(
                itemCount: snap,
                itemBuilder: ( context , index ){
                  return MyCard(
                    platform: '1',
                    contestDate: '1',
                    contestDuration: '1',
                    contestName: '1',
                    contestTime: '1',
                  );
                }
            );
          }else{
            return Container() ;
          }
        }
    ) ;
  }
}
