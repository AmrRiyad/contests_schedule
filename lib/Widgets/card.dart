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
        height: MediaQuery.of(context).size.height * 0.205,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.deepPurpleAccent,
            borderRadius: BorderRadius.circular(15)),
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
                  const IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.alarm_add_outlined,
                        size: 30,
                        color: Colors.white38,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
