import 'package:contests_schedule/Screens/upcoming.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

int compareTwoContestsBasedOnDate(Contest firstContest, Contest secondContest) {
  if (firstContest.key.compareTo(secondContest.key) > 0) {
    return 1;
  } else {
    return 0;
  }
}

List<Contest> getContestsList(String objectsListJSON) {
  List<Contest> contests = [];
  for (var contestObjectJSON in jsonDecode(objectsListJSON)['objects']) {
    contests.add(Contest.fromJson(contestObjectJSON));
  }
  return contests;
}

Future<String> getContestsData(
    {String resourceName =
        'codeforces.com,leetcode.com,codechef.com,atcoder.jp,hackerrank.com'}) async {
  var url =
      'https://clist.by:443/api/v2/contest/?upcoming=true&start__gt=${DateTime.now()}&resource=$resourceName&format=json&username=BemwaMalak&api_key=02b1fc173fc1459c0cc9369df0e0473f2ac922e5';
  print(DateTime.now());
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then return the JSON.
    return response.body;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Codeforces data');
  }
}

class Contest {
  final String platform;
  final String name;
  final String date;
  final String time;
  final String duration;
  final DateTime key;

  Contest({
    required this.platform,
    required this.name,
    required this.date,
    required this.time,
    required this.duration,
    required this.key,
  });

  //Factory constructor extracts data from the JSON
  factory Contest.fromJson(Map<String, dynamic> json) {
    //Extracting platform name
    String platformName =
        json['host'].substring(0, json['host'].indexOf('.')).toString();
    //Extracting contest name
    String contestName = json['event'].toString();
    //Extracting contest date
    String contestDate = json['start'].substring(0, 10).toString();
    //Extracting contest time
    String contestStartTime = json['start'].substring(11, 16).toString();
    //Extracting contest duration
    int contestDurationInHours = json['duration'] ~/ 3600;
    int contestDurationInDays = contestDurationInHours ~/ 24;
    int contestDurationInMinutes = (json['duration'] % 3600) ~/ 60;
    String contestDuration = '';
    if (contestDurationInMinutes < 10) {
      contestDuration = contestDurationInHours.toString() +
          ':0' +
          contestDurationInMinutes.toString() +
          ' Hours';
    } else if (contestDurationInMinutes >= 10) {
      contestDuration = contestDurationInHours.toString() +
          ':' +
          contestDurationInMinutes.toString() +
          ' Hours';
    }
    if (contestDurationInDays > 0) {
      contestDuration = contestDurationInDays.toString() + ' Days';
    }

    //returning a Contest object
    return Contest(
      platform: platformName,
      name: contestName,
      date: contestDate,
      time: contestStartTime,
      duration: contestDuration,
      key: DateTime.parse(json['start']),
    );
  }
}
