import 'package:contests_schedule/alarm/alart_info.dart';
import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String platform;
  final String contestName;
  final String contestDate;
  final String contestTime;
  final String contestDuration;

  const MyCard(
      {Key? key,
      required this.platform,
      required this.contestName,
      required this.contestDate,
      required this.contestTime,
      required this.contestDuration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // height: MediaQuery.of(context).size.height * 0.25,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.greenAccent.withOpacity(0.4),
              Colors.greenAccent.withOpacity(0.35)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.3, 0.8],
          ),
          // Colors.greenAccent.withOpacity(0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  platform,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Text(
                contestName,
                style: const TextStyle(fontSize: 22, color: Colors.white),
              ),
              Row(
                children: [
                  Text(
                    "Date : $contestDate",
                    style: const TextStyle(fontSize: 22, color: Colors.white),
                  ),
                  const Spacer(),
                  Text("Time : $contestTime",
                      style:
                          const TextStyle(fontSize: 22, color: Colors.white)),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Duration : $contestDuration",
                    style: const TextStyle(fontSize: 22, color: Colors.white),
                  ),
                  const Spacer(),
                   IconButton(
                    onPressed: () {
                      var alarm_info = new AlarmInfo(
                        alarmDataTime: DateTime.parse(contestDate),
                        // title:
                      );
                    },
                    icon: Icon(
                      Icons.alarm_add_outlined,
                      size: 30,
                      color: Colors.white38,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
