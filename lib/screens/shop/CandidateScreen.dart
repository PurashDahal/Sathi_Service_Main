import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:singleclinic/main.dart';
import 'package:singleclinic/common/widgets/drawer.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';

class CandidateScreen extends StatefulWidget {
  const CandidateScreen({Key key}) : super(key: key);

  @override
  State<CandidateScreen> createState() => _CandidateScreenState();
}

class _CandidateScreenState extends State<CandidateScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<Map<String, dynamic>> Candidates = [
    {
      "name": "Jenny Welson",
      "imgPath": "assets/doctor_placeholder.jpg",
      "Post": "Software engineer"
    },
    {
      "name": "Jonny Welson",
      "imgPath": "assets/doctor_placeholder.jpg",
      "Post": "Software engineer"
    },
    {
      "name": "Helly Welson",
      "imgPath": "assets/doctor_placeholder.jpg",
      "Post": "Software engineer"
    },
    {
      "name": "Menny Welson",
      "imgPath": "assets/doctor_placeholder.jpg",
      "Post": "Software engineer"
    },
    {
      "name": "Tenny Welson",
      "imgPath": "assets/doctor_placeholder.jpg",
      "Post": "Software engineer"
    },
    {
      "name": "Renny Welson",
      "imgPath": "assets/doctor_placeholder.jpg",
      "Post": "Software engineer"
    },
    {
      "name": "Fenny Welson",
      "imgPath": "assets/doctor_placeholder.jpg",
      "Post": "Software engineer"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Candidates",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Color(0xffFAFAFA),
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
          icon: Icon(
            Icons.menu,
            size: 30,
            color: primaryColor,
          ),
        ),
      ),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 7),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3), //
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search Candidates",
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                  ),
                ),
              ),
            ),
            ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: Candidates.map((e) {
                return Container(
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(.2),
                            spreadRadius: 2,
                            blurRadius: 2)
                      ]),
                  height: 90,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                      ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          child: Image.asset(
                            "assets/doctor_placeholder.jpg",
                            width: 60,
                          )),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              e['name'],
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontFamily: GoogleFonts.poppins().fontFamily),
                            ),
                            Text(
                              e['Post'],
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontFamily: GoogleFonts.poppins().fontFamily),
                            )
                          ]),
                    ]),
                  ),
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
