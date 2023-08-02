import 'package:flutter/material.dart';
import 'package:singleclinic/main.dart';
import 'package:singleclinic/screens/SearchScreen.dart';
import 'package:singleclinic/screens/doctors/doctors_list_screen.dart';
import 'package:singleclinic/utils/colors.dart';

class SearchArea extends StatelessWidget {
  final bool isLoggedIn;
  const SearchArea({Key key, this.isLoggedIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => JobsListScreen(),
        //     ));
      },
      child: Container(
        height: 265,
        color: background1,
        child: Stack(
          children: [
            Container(
              height: 265,
              width: MediaQuery.of(context).size.width,
              child: Opacity(
                opacity: 0.5,
                child: Image.asset(
                  "assets/homescreen/bannerImage.png",
                  fit: BoxFit.cover,
                ),
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 82, 81, 81),
                // borderRadius: BorderRadius.circular(30)
              ),
              // child: Align(
              //   alignment: Alignment.bottomRight,
              //   child: Image.asset(
              //     "assets/homescreen/banner_image2.png",
              //     width: 150,
              //     fit: BoxFit.contain,
              //   ),
              // ),
            ),
            Positioned(
              top: 90,
              right: 10,
              child: Container(
                width: 90,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2)),
                child: CircleAvatar(
                  radius: 26,
                  backgroundImage: AssetImage('assets/homescreen/profile.jpg'),
                ),
              ),
            ),
            Positioned(
              top: 30,
              left: 30,
              child: Image.asset(
                'assets/homescreen/logo.png',
                width: MediaQuery.of(context).size.width * 0.3,
              ),
            ),
            Positioned(
                top: 25,
                right: 30,
                child: InkWell(
                  onTap: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  child: Icon(
                    Icons.menu,
                    size: 40,
                    color: Colors.white,
                  ),
                )),
            Positioned(
                bottom: 105,
                left: 10,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome to",
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                      Text(
                        "Sathi Service",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "dyna"),
                      ),
                    ],
                  ),
                )),
            Positioned(
                bottom: 10,
                left: 15,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => JobsListScreen(),
                                  ));
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.width * 0.15,
                              width: MediaQuery.of(context).size.width * 0.7,
                              decoration: BoxDecoration(
                                  // borderRadius: BorderRadius.circular(25),
                                  color: Colors.white),
                              child: Center(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      // child: Icon(
                                      //   Icons.search,
                                      //   color: Colors.black,
                                      // ),
                                    ),
                                    Flexible(
                                        child: Text(
                                      "Search services here.....",
                                      style: TextStyle(color: Colors.grey),
                                    )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   width: 10,
                        // ),
                        // Container(
                        //   width: 60,
                        //   height: 60,
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(8),
                        //       color: Colors.white),
                        //   child: Icon(Icons.filter_list_outlined),
                        // ),
                      ],
                    ),
                  ),
                )),
            Positioned(
              bottom: 18,
              right: 25,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => JobsListScreen(),
                      ));
                },
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.15,
                  width: MediaQuery.of(context).size.width * 0.15,
                  color: primaryColor,
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
