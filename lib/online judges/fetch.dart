import 'package:contests_schedule/Screens/upcoming.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../localStorage/sqlDB.dart';

Future<List> readData() async {
  List dataFromDataBase = [];
  SqlDb sqlDb = SqlDb();
  List<Map> response =
      await sqlDb.readData('select * from ContestsTable order by "key" ASC ');
  dataFromDataBase.addAll(response);
  return dataFromDataBase;
}

Future addtoDatabase(Contest dataContest) async {
  SqlDb sqlDb = SqlDb();
  int response = await sqlDb.insertData('''
           INSERT INTO ContestsTable(platform ,contestName,contestDate,contestStartTime,contestDuration,"key") 
           VALUES('${dataContest.platform}', '${dataContest.name}','${dataContest.date}','${dataContest.time}','${dataContest.duration}','${dataContest.key}')           
                         ''');
  print(response);
}

Future deleteOldContests() async {
  SqlDb sqlDb = SqlDb();
  int response = await sqlDb.deleteData(
      "DELETE FROM ContestsTable WHERE 'key' < ('${DateTime.now()}')");
}

Future fillDataBase(String? objectsListJSON) async {
  SqlDb sqlDb = SqlDb();
  DateTime? mostRes;
  List<Map> response = await sqlDb
      .readData('select * from ContestsTable order by "key" ASC limit 1');
  bool isDBempty = response.isEmpty;
  if (!isDBempty) {
    mostRes = DateTime.parse(response[0]['key']);
    print("most resent $mostRes");
    await deleteOldContests();
  }

  for (var contestObjectJSON in jsonDecode(objectsListJSON!)['objects']) {
    Contest contest = Contest.fromJson(contestObjectJSON);
    if (isDBempty)
      addtoDatabase(contest);
    else if (contest.key.compareTo(mostRes!) < 0) addtoDatabase(contest);
  }
}

Future<List<Contest>> getContestsList() async {
  List<Contest> contests = [];
  List dataFromDataBase = await readData();
  for (var contestObjectJSON in dataFromDataBase) {
    contests.add(Contest.fromDateBase(contestObjectJSON));
  }
  for (var x in contests) print("contests name ${x.name}");

  return contests;
}

Future<String> getContestsData(
    {String resourceName =
        'codeforces.com,leetcode.com,codechef.com,atcoder.jp,hackerrank.com'}) async {
  var url =
      'https://clist.by:443/api/v2/contest/?upcoming=true&start__gt=${DateTime.now()}&resource=${resourceName}&format=json&username=BemwaMalak&api_key=02b1fc173fc1459c0cc9369df0e0473f2ac922e5';
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

  factory Contest.fromDateBase(Map response) {
    return Contest(
        platform: response['platform'],
        name: response['contestName'],
        date: response['contestDate'],
        time: response['contestStartTime'],
        duration: response['contestDuration'],
        key: DateTime.parse(response['key']));
  }
}
