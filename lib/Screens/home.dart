import 'package:flutter/material.dart';

import '../Widgets/container.dart';
import 'homepagedata.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double pad = 0.01*MediaQuery.of(context).size.height ;
    return Padding(
      padding: EdgeInsets.all(pad),
      child: ListView.builder(
        itemCount: onlineJudge.length ,
        itemBuilder: (BuildContext context , int index){
          return Padding(
            padding:EdgeInsets.all(pad),
            child: Container(
              height: 0.3*MediaQuery.of(context).size.height,
              alignment:  index % 2 == 1 ? Alignment.centerRight : Alignment.centerLeft,
              child: SizedBox(
                height: 0.31*MediaQuery.of(context).size.height,
                width: 0.42*MediaQuery.of(context).size.width,
                child: GestureDetector(
                  onTap: (){
                     Navigator.pushNamed(context, onlineJudge[index].route ) ;
                  },
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        child: Container(
                          height: 0.2*MediaQuery.of(context).size.height,
                          width: 0.4*MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle ,
                              color: Colors.greenAccent
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: Column(
                          children: [
                            Container(
                              height: 0.2*MediaQuery.of(context).size.height,
                              width: 0.4*MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      onlineJudge[index].imageUrl ,
                                    ),
                                    fit: BoxFit.contain
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(pad),
                              child: Center(child: Text( onlineJudge[index].name , style: const TextStyle( fontSize: 25 , fontWeight: FontWeight.bold,color: Colors.white ), )),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
