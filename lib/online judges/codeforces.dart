import 'package:contests_schedule/Screens/upcoming.dart';
import 'package:flutter/material.dart';

class CodeforcesContest extends Contest{

  //CodeforcesContest constructor delegates the constructing to Contest Constructor
  CodeforcesContest({required String platform, required String contestDate, required String contestDuration, required String contestName, required String contestTime, required DateTime key}) : super(platform: platform, contestDate: contestDate, contestDuration: contestDuration, contestName: contestName, contestTime: contestTime, key: key);

  //Factory constructor extracts data from the JSON
  factory CodeforcesContest.fromJson(Map<String, dynamic>json, int index){
    int relativeSeconds = json['result'][index]['relativeTimeSeconds'] * -1;
    double durationSeconds = json['result'][index]['durationSeconds']~/3600 + ((((json['result'][index]['durationSeconds']/3600)-(json['result'][index]['durationSeconds']~/3600))*60)/100);
    String formattedDate = DateTime.now().add(Duration(seconds: relativeSeconds)).toString();
    String contestDate = formattedDate.substring(0,10);
    String contestTime = formattedDate.substring(10,16);

    //returning a CodeforcesContest object
    return CodeforcesContest(
      platform: 'Codeforces',
      contestDate: contestDate,
      contestDuration: durationSeconds.toString() + ' Hours',
      contestName: json['result'][index]['name'],
      contestTime: contestTime,
      key: DateTime.now().add(Duration(seconds: relativeSeconds)),
    );
  }
}