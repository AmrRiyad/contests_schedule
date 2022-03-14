import 'package:contests_schedule/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

import 'each_site.dart';

class NewHome extends StatefulWidget {
  const NewHome({Key? key}) : super(key: key);

  @override
  _NewHomeState createState() => _NewHomeState();
}

class _NewHomeState extends State<NewHome> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(25.0),
          child: Text(
            'Dream Team',
            style: TextStyle(
              fontFamily: 'Avenir',
              fontSize: 40,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.45,
          child: Swiper(
            itemCount: onlineJudge.length,
            itemWidth: MediaQuery.of(context).size.width - 2 * 50,
            layout: SwiperLayout.STACK,
            pagination: const SwiperPagination(
                builder: DotSwiperPaginationBuilder(
              activeColor: Colors.greenAccent,
            )),
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Positioned(
                    bottom: 40,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width - 2 * 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 120,
                            ),
                            Text(
                              onlineJudge[index].name,
                              style: const TextStyle(
                                fontFamily: 'Avenir',
                                fontSize: 40,
                                fontWeight: FontWeight.w900,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                // Navigator.pushNamed(
                                //     context, onlineJudge[index].route);
                                press:
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Site(
                                      site: onlineJudge[index],
                                    ),
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Text(
                                    'See Contests',
                                    style: TextStyle(color: Colors.blueGrey),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.blueGrey,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 0,
                      right: 0,
                      left: 0,
                      child: Hero(
                        tag: onlineJudge[index].route,
                        child: Image.asset(
                          onlineJudge[index].imageUrl,
                          height: 200,
                        ),
                      )),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
