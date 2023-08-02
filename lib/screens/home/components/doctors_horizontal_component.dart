import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:singleclinic/common/widgets/heading_tile.dart';
import 'package:singleclinic/common/widgets/horizontal_shimmer_list.dart';
import 'package:singleclinic/scoped_models/doctors_model.dart';
import 'package:singleclinic/screens/appointment/appointment_booking_screen.dart';
import 'package:singleclinic/screens/shop/widgets/JobDescription.dart';
import 'package:singleclinic/utils/colors.dart';
import 'package:singleclinic/utils/extensions/padding.dart';
import 'package:singleclinic/utils/helper.dart';

class JobsHorizontalList extends StatelessWidget {
  const JobsHorizontalList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, String> individual = {"individual": "yes"};
    print("Hello world");
    return ScopedModel<JobsScopedModel>(
      model: JobsScopedModel.instance,
      child: Builder(builder: (context) {
        print("Building Horizontal");
        JobsScopedModel.of(context)
            .getHomePageJobs(individual, isRefresh: true);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              HeadingTile(
                title: "Our Services",
                route: "JobsListScreen",
              ),
              ScopedModelDescendant<JobsScopedModel>(
                  builder: (context, child, model) {
                return model.homePageDoctorList.length > 0
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.33,
                          width: double.infinity,
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              children: model.homePageDoctorList.map((e) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (c) => JobDesciptoion(
                                            job: e,
                                            title: "Software engineer",
                                            designation: "Junior",
                                            experience: "2 years",
                                            requiremets: 3,
                                            Salary: 25000,
                                            // postedDate: "2023/07/23",
                                            // expiryDate: "2023/08/23",
                                            duration: "Full Time",
                                            text:
                                                '''Are you interested in having your products be used by 1000s of brands globally? Does building a global brand excite you? Does having your solutions be used by the world’s top brand get you up from bed? GrowByData is on a mission to expand its distribution to the world’s retailers and is seeking energetic, creative, and self-driven individuals to join the challenge. We are looking for a motivated, and talented individual to join us as Software Engineer to deliver our enterprise platform! ''',
                                            location: "Biratnagar",
                                          ),
                                        ));
                                  },
                                  child: Container(
                                      // width: double.infinity,
                                      width: MediaQuery.of(context).size.width *
                                          0.48,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.2,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 6),
                                      // padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(18)),
                                      child: Column(
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.19,
                                            child: ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                  // bottomLeft:
                                                  //     Radius.circular(10)
                                                ),
                                                child: e.image != null
                                                    ? e.image.endsWith("g")
                                                        ? Container(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.1,
                                                            child:
                                                                Image.network(
                                                              getDoctorImageUrl(
                                                                  e.image),
                                                              width: 80,
                                                              height: 50,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          )
                                                        : Container(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.1,
                                                            child: Image.asset(
                                                                "assets/doctor_placeholder.jpg"),
                                                          )
                                                    : Image.asset(
                                                        "assets/doctor_placeholder.jpg")),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                e.name,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              width: double.infinity,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("Avg Rate:"),
                                                  SizedBox(
                                                    height: 1,
                                                  ),
                                                  Text(
                                                    e.appointmentFee != null &&
                                                            e.appointmentFee ==
                                                                0
                                                        ? "Free"
                                                        : "Rs ${e.appointmentFee ?? "Free"}",
                                                    style: GoogleFonts.poppins()
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                primaryColor),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      )

                                      // Row(
                                      //   // crossAxisAlignment: CrossAxisAlignment.start,
                                      //   mainAxisAlignment:
                                      //       MainAxisAlignment.spaceAround,
                                      //   children: [
                                      //     ClipRRect(
                                      //         borderRadius:
                                      //             BorderRadius.circular(10),
                                      //         child: e.image != null
                                      //             ? e.image.endsWith("g")
                                      //                 ? Container(
                                      //                     height:
                                      //                         MediaQuery.of(context)
                                      //                                 .size
                                      //                                 .height *
                                      //                             0.1,
                                      //                     child: Image.network(
                                      //                       getDoctorImageUrl(
                                      //                           e.image),
                                      //                       width: 80,
                                      //                       height: 50,
                                      //                       fit: BoxFit.cover,
                                      //                     ),
                                      //                   )
                                      //                 : Container(
                                      //                     height:
                                      //                         MediaQuery.of(context)
                                      //                                 .size
                                      //                                 .height *
                                      //                             0.1,
                                      //                     child: Image.asset(
                                      //                         "assets/doctor_placeholder.jpg"),
                                      //                   )
                                      //             : Image.asset(
                                      //                 "assets/doctor_placeholder.jpg")),
                                      //     Expanded(
                                      //       child: Column(
                                      //         children: [
                                      //           Text(
                                      //             e.name,
                                      //             // "ABC Compnay",
                                      //             style: GoogleFonts.poppins()
                                      //                 .copyWith(
                                      //                     fontWeight:
                                      //                         FontWeight.w700),
                                      //           ),
                                      //           // SizedBox(
                                      //           //   height: 5,
                                      //           // ),
                                      //           Expanded(
                                      //             child: Row(
                                      //               mainAxisAlignment:
                                      //                   MainAxisAlignment
                                      //                       .spaceBetween,
                                      //               children: [
                                      //                 SizedBox(
                                      //                   width: 20,
                                      //                 ),
                                      //                 Text("Questel Jobs"),
                                      //                 Spacer(),
                                      //                 Text(
                                      //                   e.appointmentFee != null &&
                                      //                           e.appointmentFee ==
                                      //                               0
                                      //                       ? "Free"
                                      //                       : "Rs ${e.appointmentFee ?? "Free"}",
                                      //                   style:
                                      //                       GoogleFonts.poppins(),
                                      //                 ),
                                      //                 SizedBox(
                                      //                   width: 23,
                                      //                 ),
                                      //               ],
                                      //             ),
                                      //           ),
                                      //           // SizedBox(
                                      //           //   width: double.infinity,
                                      //           //   child: Align(
                                      //           //     alignment: Alignment.centerRight,
                                      //           //     child: Text(
                                      //           //       e.appointmentFee != null &&
                                      //           //               e.appointmentFee == 0
                                      //           //           ? "Free"
                                      //           //           : "Rs ${e.appointmentFee ?? "Free"}",
                                      //           //       style: GoogleFonts.poppins(),
                                      //           //     ),
                                      //           //   ),
                                      //           // ),
                                      //         ],
                                      //       ),
                                      //     )
                                      //   ],
                                      // ),

                                      ),
                                );
                              }).toList()
                              // Container(
                              //   height: 200,
                              //   width: 100,
                              //   color: Colors.yellow,
                              // ),
                              // Container(
                              //   height: 200,
                              //   width: 100,
                              //   color: Colors.red,
                              // ),
                              // Container(
                              //   height: 200,
                              //   width: 100,
                              //   color: Colors.green,
                              // ),
                              // Container(
                              //   height: 200,
                              //   width: 100,
                              //   color: Colors.deepOrangeAccent,
                              // ),
                              // Container(
                              //   height: 200,
                              //   width: 100,
                              //   color: Colors.tealAccent,
                              // ),

                              ),
                        ),
                      )
                    // SizedBox(
                    //     child: Text("jj"),

                    //     // child: ListView(
                    //     //   shrinkWrap: true,
                    //     //   scrollDirection: Axis.vertical,
                    //     //   physics: NeverScrollableScrollPhysics(),
                    //     //   // padding: EdgeInsets.all(10),
                    //     //   children: model.homePageDoctorList.map((e) {
                    //     //     return InkWell(
                    //     //       onTap: () {
                    //     //         Navigator.push(
                    //     //             context,
                    //     //             MaterialPageRoute(
                    //     //               builder: (c) => JobDesciptoion(
                    //     //                 job: e,
                    //     //                 title: "Software engineer",
                    //     //                 designation: "Junior",
                    //     //                 experience: "2 years",
                    //     //                 requiremets: 3,
                    //     //                 Salary: 25000,
                    //     //                 // postedDate: "2023/07/23",
                    //     //                 // expiryDate: "2023/08/23",
                    //     //                 duration: "Full Time",
                    //     //                 text:
                    //     //                     '''Are you interested in having your products be used by 1000s of brands globally? Does building a global brand excite you? Does having your solutions be used by the world’s top brand get you up from bed? GrowByData is on a mission to expand its distribution to the world’s retailers and is seeking energetic, creative, and self-driven individuals to join the challenge. We are looking for a motivated, and talented individual to join us as Software Engineer to deliver our enterprise platform! ''',
                    //     //                 location: "Biratnagar",
                    //     //               ),
                    //     //             ));
                    //     //       },
                    //     //       child: Container(
                    //     //         width: double.infinity,
                    //     //         height: MediaQuery.of(context).size.height * 0.12,
                    //     //         margin: EdgeInsets.symmetric(
                    //     //             horizontal: 8, vertical: 6),
                    //     //         padding: EdgeInsets.all(10),
                    //     //         decoration: BoxDecoration(
                    //     //             color: Colors.white,
                    //     //             borderRadius: BorderRadius.circular(8)),
                    //     //         child: Row(
                    //     //           // crossAxisAlignment: CrossAxisAlignment.start,
                    //     //           mainAxisAlignment:
                    //     //               MainAxisAlignment.spaceAround,
                    //     //           children: [
                    //     //             ClipRRect(
                    //     //                 borderRadius: BorderRadius.circular(10),
                    //     //                 child: e.image != null
                    //     //                     ? e.image.endsWith("g")
                    //     //                         ? Container(
                    //     //                             height: MediaQuery.of(context)
                    //     //                                     .size
                    //     //                                     .height *
                    //     //                                 0.1,
                    //     //                             child: Image.network(
                    //     //                               getDoctorImageUrl(e.image),
                    //     //                               width: 80,
                    //     //                               height: 50,
                    //     //                               fit: BoxFit.cover,
                    //     //                             ),
                    //     //                           )
                    //     //                         : Container(
                    //     //                             height: MediaQuery.of(context)
                    //     //                                     .size
                    //     //                                     .height *
                    //     //                                 0.1,
                    //     //                             child: Image.asset(
                    //     //                                 "assets/doctor_placeholder.jpg"),
                    //     //                           )
                    //     //                     : Image.asset(
                    //     //                         "assets/doctor_placeholder.jpg")),
                    //     //             Expanded(
                    //     //               child: Column(
                    //     //                 children: [
                    //     //                   Text(
                    //     //                     e.name,
                    //     //                     // "ABC Compnay",
                    //     //                     style: GoogleFonts.poppins().copyWith(
                    //     //                         fontWeight: FontWeight.w700),
                    //     //                   ),
                    //     //                   // SizedBox(
                    //     //                   //   height: 5,
                    //     //                   // ),
                    //     //                   Expanded(
                    //     //                     child: Row(
                    //     //                       mainAxisAlignment:
                    //     //                           MainAxisAlignment.spaceBetween,
                    //     //                       children: [
                    //     //                         SizedBox(
                    //     //                           width: 20,
                    //     //                         ),
                    //     //                         Text("Questel Jobs"),
                    //     //                         Spacer(),
                    //     //                         Text(
                    //     //                           e.appointmentFee != null &&
                    //     //                                   e.appointmentFee == 0
                    //     //                               ? "Free"
                    //     //                               : "Rs ${e.appointmentFee ?? "Free"}",
                    //     //                           style: GoogleFonts.poppins(),
                    //     //                         ),
                    //     //                         SizedBox(
                    //     //                           width: 23,
                    //     //                         ),
                    //     //                       ],
                    //     //                     ),
                    //     //                   ),
                    //     //                   // SizedBox(
                    //     //                   //   width: double.infinity,
                    //     //                   //   child: Align(
                    //     //                   //     alignment: Alignment.centerRight,
                    //     //                   //     child: Text(
                    //     //                   //       e.appointmentFee != null &&
                    //     //                   //               e.appointmentFee == 0
                    //     //                   //           ? "Free"
                    //     //                   //           : "Rs ${e.appointmentFee ?? "Free"}",
                    //     //                   //       style: GoogleFonts.poppins(),
                    //     //                   //     ),
                    //     //                   //   ),
                    //     //                   // ),
                    //     //                 ],
                    //     //               ),
                    //     //             )
                    //     //           ],
                    //     //         ),
                    //     //       ),
                    //     //     );
                    //     //   }).toList(),
                    //     // ),
                    //   ).p(8)
                    : HorizontalSimmerList();
              }),
            ],
          ),
        );
      }),
    );
  }
}
