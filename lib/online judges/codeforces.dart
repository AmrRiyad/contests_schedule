import 'package:flutter/material.dart';

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