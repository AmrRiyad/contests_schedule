import 'package:contests_schedule/Screens/upcoming.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


int compareTwoContestsBasedOnDate(Contest contest1, Contest contest2){
  if(contest1.key.compareTo(contest2.key) > 0){
    return 1;
  }else{
    return 0;
  }
}
Future getContestsData(String resourceName) async{
  var url = 'https://clist.by/api/v1/contest/?format=json&resource__name=codeforces.com&username=BemwaMalak&api_key=02b1fc173fc1459c0cc9369df0e0473f2ac922e5';
  final response = await http.get(Uri.parse(url));
  print(response.statusCode);
  print('hello');
  if(response.statusCode == 200){
    // If the server did return a 200 OK response,
    // then parse the JSON.
  }else{
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Codeforces data');
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
  //Factory constructor extracts data from the JSON
  factory Contest.fromJson( Map<String,dynamic> json ){


    //returning a CodeforcesContest object
    return Contest(
      platform: 'Codeforces',
      contestDate: 'contestDate',
      contestDuration: 'durationSeconds.toString()',
      contestName: '',
      contestTime: 'contestTime',
      key: DateTime.now(),
    );
  }
}