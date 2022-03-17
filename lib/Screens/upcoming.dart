import 'package:contests_schedule/Widgets/card.dart';
import 'package:contests_schedule/online%20judges/fetch.dart';
import 'package:flutter/material.dart';




class Upcoming extends StatefulWidget {
  const Upcoming({Key? key}) : super(key: key);

  @override
  State<Upcoming> createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  List<Contest> contests = [];
  Future ?data ;


  @override
  void initState(){
    super.initState();
    print("test");
    getContestsData(resourceName: 'codeforces.com');
    print("test");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: data ,
        builder: (context, AsyncSnapshot<dynamic> snapshot ){
          if ( snapshot.connectionState == ConnectionState.waiting ){
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.greenAccent ,
              ),
            );
          }
          else if ( snapshot.connectionState == ConnectionState.done ){
            return ListView.builder(
              itemCount: contests.length,
                itemBuilder: ( context , index ){
                  return MyCard(
                    platform: contests[index].platform,
                    contestDate: contests[index].date,
                    contestDuration: contests[index].duration,
                    contestName: contests[index].name,
                    contestTime: contests[index].time,
                  );
                }
            );
          }else{
            return Container() ;
          }
        }
    ) ;
  }
}
