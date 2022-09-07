import 'package:contests_schedule/Widgets/glass_container.dart';
import 'package:contests_schedule/constants.dart';
import 'package:contests_schedule/notification_system/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

import '../Widgets/card.dart';
import '../online judges/fetch.dart';
import 'upcoming.dart';

class Site extends StatefulWidget {
  final OnlineJudge? site;

  const Site({Key? key, this.site}) : super(key: key);

  @override
  State<Site> createState() => _SiteState();
}

class _SiteState extends State<Site> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(130, 147, 248, 1.0),
                  Colors.indigoAccent
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.3, 0.8],
              ),
            ),
          ),
          siteBody(
            site: widget.site,
          ),
        ],
      ),
    );
  }
}

class siteBody extends StatefulWidget {
  final OnlineJudge? site;

  const siteBody({Key? key, this.site}) : super(key: key);

  @override
  State<siteBody> createState() => _siteBodyState();
}

class _siteBodyState extends State<siteBody> {
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
      contests = await getContestsList('select * from ContestsTable WHERE platform = "${widget.site!.name}" order by "key" ASC ');
    } catch (_) {
      contests = await getContestsList('select * from ContestsTable WHERE platform = "${widget.site!.name}" order by "key" ASC ');
    }
    print("hint");
    isLoading = false;
    if (this.mounted) setState(() {});
  }

  void initState() {
    Load();
    super.initState();
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            width: size.width,
            child: Stack(
              children: [
                Container(
                    margin: EdgeInsets.only(top: size.height * 0.1),
                    padding: EdgeInsets.only(
                        top: size.height * 0.12, right: 20, left: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(24),
                        topRight: const Radius.circular(24),
                      ),
                      color: Colors.white,
                    ),
                    child: isLoading
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
                                backColor:
                                // Colors.indigo,
                                Color(0xf101B59FF),
                              );
                            })),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.04,
                      horizontal: size.width * 0.04),
                  child: Text(
                    widget.site!.name,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.5,
                          ),
                          Expanded(
                            child: Hero(
                              tag: widget.site!.route,
                              child: Image.asset(
                                widget.site!.imageUrl,
                                height: size.height * 0.18,
                                // width: 100,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
