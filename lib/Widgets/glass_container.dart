import 'package:flutter/material.dart';

import 'glass_morphism.dart';

class GlassContainer extends StatelessWidget {
  final String contestName;
  final String contestDate;
  final String contestTime;
  final String contestDuration;
  final Color color;

  const GlassContainer(
      {Key? key,
      required this.contestName,
      required this.contestDate,
      required this.contestTime,
      required this.contestDuration,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GlassMorphism(
          blur: 2,
          opacity: 0.3,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contestName,
                    style: TextStyle(color: color, fontSize: 28),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.date_range,
                            color: color,
                          ),
                          Text(
                            contestDate,
                            style: TextStyle(color: color, fontSize: 26),
                          ),
                        ],
                      ),
                      Text(
                        contestTime,
                        style: TextStyle(color: color, fontSize: 26),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.timelapse_outlined,
                        color: color,
                      ),
                      Text(
                        '$contestDuration M',
                        style: TextStyle(color: color, fontSize: 26),
                      )
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
