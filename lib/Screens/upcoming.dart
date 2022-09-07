import 'dart:convert';

import 'package:contests_schedule/Widgets/card.dart';
import 'package:contests_schedule/localStorage/sqlDB.dart';
import 'package:contests_schedule/online%20judges/fetch.dart';
import 'package:flutter/material.dart';

class Upcoming extends StatefulWidget {
  const Upcoming({Key? key}) : super(key: key);

  @override
  State<Upcoming> createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  List<Contest> contests = [];
  String? contestsJSONFuture;
  bool isLoading = true;

  @override
  Future Load() async {
    // SqlDb sqlDb = SqlDb();
    // sqlDb.mydeleteDatebase();
    try {
      contestsJSONFuture = await getContestsData();
      await fillDataBase(contestsJSONFuture);
      contests = await getContestsList('select * from ContestsTable order by "key" ASC ');
    } catch (_) {
      contests = await getContestsList('select * from ContestsTable order by "key" ASC ');
    }
    print("hint");
    isLoading = false;
    if (this.mounted) setState(() {});

  }

  void initState() {
    Load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.greenAccent,
              ),
            ),
          )
        : ListView.builder(
            itemCount: contests.length,
            itemBuilder: (context, index) {
              return MyCard(
                platform: contests[index].platform,
                contestDate: contests[index].date,
                contestDuration: contests[index].duration,
                contestName: contests[index].name,
                contestTime: contests[index].time,
                backColor:  Colors.greenAccent,
              );
            });
  }
}
