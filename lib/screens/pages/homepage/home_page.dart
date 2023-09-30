// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:elearning/screens/auth/auth_page.dart';
import 'package:elearning/screens/pages/homepage/calculator/calculator_page.dart';
import 'package:elearning/screens/pages/homepage/insurance/insurance_page.dart';
import 'package:elearning/screens/pages/homepage/insurance_claim/insurance_claim_page.dart';
import 'package:elearning/screens/pages/homepage/team/our_team.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../login/login_page.dart';
import 'weather/weather_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           MaterialButton(
//             onPressed: () {
//               FirebaseAuth.instance.signOut();
//             },
//             color: Colors.deepPurple[200],
//             child: Text('Sign Out'),
//           ),
//         ],
//       )),
//     );
//   }
// }
class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  // bool showLoginPage = true;

  // void toggleScreens() {
  //   setState(() {
  //     showLoginPage = !showLoginPage;
  //   });
  // }

  var height, width;

  List imgData = [
    "assets/images/weather.png",
    "assets/images/calculator.png",
    "assets/images/insurance.png",
    "assets/images/claim.png",
    "assets/images/about_us.png",
    "assets/images/log_out.png",
  ];

  List titles = [
    "Weather Forecast",
    "Insurance Calculator",
    "Insuarance Now",
    "Claim Insurance",
    "Our Team",
    "Log Out"
  ];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            color: Colors.green[900],
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(),
                  height: height * 0.25,
                  width: width,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 35,
                          left: 15,
                          right: 15,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.sort,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                            ClipRect(
                              child: Icon(
                                Icons.person_pin_outlined,
                                color: Colors.white,
                                size: 40,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 35,
                          left: 15,
                          right: 15,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "KrishiVue",
                              style: TextStyle(
                                  fontSize: 45,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1),
                            ),
                            // Text('Signed In As: ' + user.email!),
                            // MaterialButton(
                            //   onPressed: () {
                            //     FirebaseAuth.instance.signOut();
                            //   },
                            //   color: Colors.deepPurple[200],
                            //   child: Text('Sign Out'),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    // height: height * 0.75,
                    width: width,
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.1,
                          mainAxisSpacing: 25),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: imgData.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            switch (index) {
                              case 0:
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WeatherPage(),
                                  ),
                                );
                                break;

                              case 1:
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        CropInsuranceCalculatorApp(),
                                  ),
                                );
                                break;

                              case 2:
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => InsurancePage(),
                                  ),
                                );
                                break;

                              case 3:
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ClaimInsurancePage(),
                                  ),
                                );
                                break;

                              case 4:
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AboutUsPage(),
                                  ),
                                );

                                break;

                              case 5:
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => AuthPage()),
                                // );
                                FirebaseAuth.instance.signOut();
                                break;
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  spreadRadius: 1,
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  imgData[index],
                                  width: 100,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  titles[index],
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
