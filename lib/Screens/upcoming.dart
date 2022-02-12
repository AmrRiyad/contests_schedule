import 'package:contests_schedule/Widgets/card.dart';
import 'package:flutter/material.dart';

class Upcoming extends StatelessWidget {
  const Upcoming({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          MyCard(
            platform: "Codeforces",
            contestDate: "12/02/2022",
            contestDuration: "2 hours",
            contestName: "Global round 19",
            contestTime: "16:35 pm",
          ),
          MyCard(
            platform: "Codeforces",
            contestDate: "12/02/2022",
            contestDuration: "2 hours",
            contestName: "Global round 19",
            contestTime: "16:35 pm",
          ),
          MyCard(
            platform: "Codeforces",
            contestDate: "12/02/2022",
            contestDuration: "2 hours",
            contestName: "Global round 19",
            contestTime: "16:35 pm",
          ),
          MyCard(
            platform: "Codeforces",
            contestDate: "12/02/2022",
            contestDuration: "2 hours",
            contestName: "Global round 19",
            contestTime: "16:35 pm",
          ),
          MyCard(
            platform: "Codeforces",
            contestDate: "12/02/2022",
            contestDuration: "2 hours",
            contestName: "Global round 19",
            contestTime: "16:35 pm",
          ),
        ],
      ),
    );
  }
}
