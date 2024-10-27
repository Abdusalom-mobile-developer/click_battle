import 'package:click_battle/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // The width of the current Device.
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: Stack(
        children: [
          Transform.translate(
            offset: Offset(screenWidth / 2.3, -screenWidth / 3.3),
            child: Container(
              alignment: Alignment.topRight,
              child: Transform.rotate(
                angle: 9,
                child: Icon(
                  Icons.cloud,
                  color: Colors.blue[800],
                  size: screenWidth / 1.3,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(-screenWidth / 3, screenWidth / 2.5),
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Transform.rotate(
                angle: 6,
                child: Icon(
                  Icons.cloud,
                  color: Colors.red[800],
                  size: screenWidth / 1.3,
                ),
              ),
            ),
          ),
          // Transform.translate(
          //   offset: Offset(-screenWidth / 11, screenWidth / 1.7),
          //   child: Container(
          //     alignment: Alignment.bottomLeft,
          //     child: Icon(
          //       Icons.circle,
          //       color: Colors.red[800],
          //       size: screenWidth / 1.3,
          //     ),
          //   ),
          // ),
        ],
      ),
      backgroundColor: const Color(0xFFE8E9F3),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                flex: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(FontAwesomeIcons.crown,
                        color: Colors.yellow[900], size: screenWidth / 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Tap Battle",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: screenWidth / 8,
                              fontFamily: "Permanent-Marker"),
                        ),
                      ],
                    ),
                  ],
                )),
            Expanded(
                flex: 11,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: screenWidth / 2.5,
                    ),
                    Container(
                      height: screenWidth / 7.5,
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth / 11),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(screenWidth / 10),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              colors: [
                                Colors.blue[800]!,
                                Colors.red[800]!.withOpacity(0.9),
                                Colors.red[800]!,
                              ])),
                      child: TextButton(
                        onPressed: () {
                          context.go("/battle_screen");
                        },
                        child: Text(
                          "Start",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth / 19,
                          ),
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}






//  floatingActionButton: Stack(
//         children: [
//           Transform.translate(
//             offset: Offset(screenWidth / 3, -screenWidth / 4.1),
//             child: Container(
//               alignment: Alignment.topRight,
//               child: Icon(
//                 Icons.circle,
//                 color: Colors.blue[800],
//                 size: screenWidth / 1.7,
//               ),
//             ),
//           ),
//           Transform.translate(
//             offset: Offset(-screenWidth / 3, screenWidth / 2.3),
//             child: Container(
//               alignment: Alignment.bottomLeft,
//               child: Icon(
//                 Icons.circle,
//                 color: Colors.red[800],
//                 size: screenWidth / 1.3,
//               ),
//             ),
//           ),
//           Container(
//               alignment: Alignment.bottomRight,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Transform.translate(
//                     offset: Offset(-screenWidth / 21, 0),
//                     child: Icon(
//                       Icons.circle,
//                       color: Colors.blue[800],
//                       size: screenWidth / 19,
//                     ),
//                   ),
//                   Icon(
//                     Icons.circle,
//                     color: Colors.red[800],
//                     size: screenWidth / 19,
//                   ),
//                   Transform.translate(
//                     offset: Offset(-screenWidth / 15, 0),
//                     child: Icon(
//                       Icons.circle,
//                       color: Colors.blue[800],
//                       size: screenWidth / 19,
//                     ),
//                   ),
//                 ],
//               ))
//         ],
//       ),





       // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Transform.translate(
            //       offset: const Offset(18, 0),
            //       child: Icon(
            //         Icons.circle,
            //         color: Colors.red[800],
            //         size: screenWidth / 4.3,
            //       ),
            //     ),
            //     Transform.translate(
            //       offset: const Offset(-18, 0),
            //       child: Icon(
            //         Icons.circle,
            //         color: Colors.blue[800],
            //         size: screenWidth / 4.3,
            //       ),
            //     ),
            //   ],
            // ),
            // SizedBox(
            //   height: screenWidth / 5,
            // ),