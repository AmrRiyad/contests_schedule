import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final String name;
  final String srcImg;
  final String navName;
  const MyContainer(
      {Key? key,
      required this.name,
      required this.srcImg,
      required this.navName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width * 0.4,
        child: Card(
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Image(image: AssetImage(srcImg)),
                const SizedBox(
                  height: 14.0,
                ),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
        // decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(20),
        //     color: Colors.deepPurpleAccent.withOpacity(0.5)),
        // child: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: GestureDetector(
        //     onTap: () {
        //       // Navigator.pushNamed(context, navName) ;
        //     },
        //     child: Column(
        //       children: [
        //         Image.asset(
        //           srcImg,
        //           height: MediaQuery.of(context).size.width * 0.25,
        //           width: MediaQuery.of(context).size.width * 0.25,
        //         ),
        //         Text(name, style: const TextStyle(fontSize: 23))
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
