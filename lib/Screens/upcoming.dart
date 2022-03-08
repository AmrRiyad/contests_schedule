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
  List<Contest> contests = [];
  late Future<List<Contest>> c ;
  Future getCodeforcesData() async{
    final response = await http.get(Uri.parse('https://c...content-available-to-author-only...s.com/api/contest.list?gym=false'));

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
        print('Hello') ;
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
    getCodeforcesData() ;
    c = contests as Future<List<Contest>> ;
  }


  Widget build(BuildContext context) {
    return FutureBuilder(
        future:  c,
        builder: (context, AsyncSnapshot<dynamic> snapshot ){
          if ( snapshot.connectionState == ConnectionState.waiting ){
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.greenAccent ,
              ),
            );
          }
          else if ( snapshot.connectionState == ConnectionState.done ){
            print(contests.length) ;
            return ListView.builder(
                itemCount: contests.length,
                itemBuilder: ( context , index ){
                  return MyCard(
                    platform: contests[index].platform,
                    contestDate: contests[index].contestDate,
                    contestDuration: contests[index].contestDuration,
                    contestName: contests[index].contestName,
                    contestTime: contests[index].contestTime,
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
