import 'package:flutter/material.dart';

import '../Widgets/container.dart';
import 'homepagedata.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: ListView.builder(
          itemCount: OnlineJudge.onlineJudge.length ,
          itemBuilder: (BuildContext ctx, int index) {
            context = ctx;
            if (index & 1 == 0) {
              return TwoWebsites(index);
            }
            return Spacer(
              flex: 3,
            );
          },
        ),
      ),
    );
  }
}

Widget TwoWebsites(int index) {
  int length = OnlineJudge.onlineJudge.length;
  return Row(children: [
    websitee(obj: OnlineJudge.onlineJudge[index]),
    const SizedBox(
      width: 10.0,
    ),
    if (length & 1 == 0 || length & 1 == 1 && index + 1 < length)
      websitee(obj: OnlineJudge.onlineJudge[index + 1])
  ]);
}

class websitee extends StatelessWidget {
  final OnlineJudge obj;

  const websitee({Key? key, required this.obj}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.45,
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Image(
                fit: BoxFit.fitHeight,
                image: AssetImage(obj.imageUrl),
                height: MediaQuery.of(context).size.width * 0.40,
                // width: MediaQuery.of(context).size.width * 0.30,
              ),
              const SizedBox(
                height: 25.0,
              ),
              Text(
                obj.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
