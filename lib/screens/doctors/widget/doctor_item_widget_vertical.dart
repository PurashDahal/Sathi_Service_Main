import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:singleclinic/modals/DepartmentDetails.dart';
import 'package:singleclinic/modals/Doctor_model.dart';
import 'package:singleclinic/modals/department_model.dart';
import 'package:singleclinic/modals/doctor_details_model.dart';
import 'package:singleclinic/scoped_models/department_scoped_model.dart';
import 'package:singleclinic/screens/AppointmentScreen.dart';
import 'package:singleclinic/utils/colors.dart';
import 'package:singleclinic/utils/helper.dart';

import '../../appointment/appointment_booking_screen.dart';
import '../../pleaseLogin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorItemVertical extends StatelessWidget {
  final Doctor doctor;
  final Function onTap;
  final bool isInBooking;
  DoctorItemVertical({Key key, this.doctor, this.onTap, this.isInBooking})
      : super(key: key);
  String token;

  shredPre() async {
    var pref = await SharedPreferences.getInstance();
    token = pref.getString("token");
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: onTap,
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ServiceDetailScreen(
            doctor: doctor,
          );
        }));
        // ServiceDetailScreen(
        //   doctor: doctor,
        // );
        print("pressed");
        // showDoctorDetails(context: context, doctor: doctor),
      },

      child: Container(
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: doctor.image != null
                          ? doctor.image.endsWith("g")
                              ? Image.network(
                                  getDoctorImageUrl(doctor.image),
                                  width: 50,
                                  height: 50,
                                )
                              : SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Image.asset(
                                      "assets/doctor_placeholder.jpg"))
                          : SizedBox(
                              height: 50,
                              width: 50,
                              child: Image.asset(
                                  "assets/doctor_placeholder.jpg"))),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctor.name ?? "",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: GoogleFonts.poppins().fontFamily),
                      ),
                      // Text(doctor.aboutUs ?? ""),
                      // Text(doctor.service ?? ""),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                // GestureDetector(
                //   onTap: () =>
                //       showDoctorDetails(context: context, doctor: doctor),
                //   child: Container(
                //       decoration: BoxDecoration(
                //           color: primaryColor,
                //           borderRadius: BorderRadius.circular(6)),
                //       padding: EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                //       child: Text(
                //         "View profile",
                //         style: GoogleFonts.poppins()
                //             .copyWith(fontSize: 12, color: Colors.white),
                //       )),
                // )
// Commented

                // Column(
                //   children: [
                //     IconButton(onPressed: (){}, icon: Icon(Icons.more_vert_sharp,color: primaryColor,)),
                //     IconButton(onPressed: (){}, icon: RotatedBox(child: Icon(Icons.arrow_circle_down,color: primaryColor,),quarterTurns: -1)),
                //
                //   ],
                // )
              ],
            ),
          )),
    );
  }

  showDoctorDetails({
    @required var context,
    @required Doctor doctor,
  }) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Service Details"),
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      CupertinoIcons.xmark,
                      color: Colors.black54,
                      size: 20,
                    ))
              ],
            ),
            content: ScopedModel<DepartmentScopedModel>(
              model: DepartmentScopedModel.instance,
              child: Builder(builder: (context) {
                DepartmentScopedModel.of(context).getDepartments();
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Divider(),

                    SizedBox(
                      height: 10,
                    ),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: doctor.image != null
                            ? doctor.image.endsWith("g")
                                ? Image.network(
                                    getDoctorImageUrl(doctor.image),
                                    width: 250,
                                    height: 50,
                                  )
                                : SizedBox(
                                    height: 50,
                                    width: 250,
                                    child: Image.asset(
                                        "assets/doctor_placeholder.jpg"))
                            : SizedBox(
                                height: 50,
                                width: 250,
                                child: Image.asset(
                                    "assets/doctor_placeholder.jpg"))),

                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      doctor?.name ?? "",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 6.0),
                        //   child: ClipRRect(
                        //       borderRadius: BorderRadius.circular(8),
                        //       child: doctor.image != null
                        //           ? Image.network(
                        //               getDoctorImageUrl(doctor.image),
                        //               width: 50,
                        //               height: 50,
                        //             )
                        //           : SizedBox(
                        //               height: 50,
                        //               width: 50,
                        //               child: Image.asset(
                        //                   "assets/doctor_placeholder.jpg"))),
                        // ),
                        SizedBox(
                          width: 15,
                        ),
                        ScopedModelDescendant<DepartmentScopedModel>(
                            builder: (context, child, model) {
                          Department doctorDepartment;
                          model.departmentsList.forEach((element) {
                            if (element.id == doctor.departmentId) {
                              doctorDepartment = element;
                            }
                          });
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // SizedBox(
                              //   height: 40,
                              //   width: 84,
                              //   child: Text(
                              //     doctor?.name ?? "",
                              //     style: TextStyle(
                              //         fontSize: 17,
                              //         fontWeight: FontWeight.w600),
                              //   ),
                              // ),
                              SizedBox(
                                height: 10,
                              ),
                              doctorDetails(
                                  title: "NMC No",
                                  data: "${doctor.nmc ?? "not available"}"),
                              SizedBox(
                                height: 10,
                              ),
                              doctorDetails(
                                  title: "Department",
                                  data:
                                      "${doctorDepartment.name ?? "not available"}"),
                              SizedBox(
                                height: 10,
                              ),
                              // doctorDetails(
                              //   title: "Qualification",
                              //   data:
                              //       "${doctor.qualification ?? "not available"}",
                              // ),
                              // SizedBox(
                              //   height: 10,
                              // ),
                              // doctorDetails(
                              //   title: "Experience",
                              //   data: "${doctor.experience ?? "not available"}",
                              // ),
                            ],
                          );
                        }),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            doctorDetails(
                              title: "Qualification",
                              data:
                                  "${doctor.qualification ?? "not available"}",
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            doctorDetails(
                              title: "Experience",
                              data: "${doctor.experience ?? "not available"}",
                            ),
                            // SizedBox(
                            //   width: 100,
                            //   height: 40,
                            //   child: Text(
                            //     "Consultation Fee:",
                            //     style: TextStyle(
                            //         fontSize: 17, fontWeight: FontWeight.w600),
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            // Text(
                            //   "${doctor.appointmentFee ?? "0"}",
                            //   style: TextStyle(
                            //     fontSize: 14,
                            //     color: Colors.black54,
                            //   ),
                            // )
                          ],
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Consultation Fee:",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        // SizedBox(
                        //   width: 80,
                        // ),
                        Text(
                          "Rs ${doctor.appointmentFee ?? "0"}",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.green,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                );
              }),
            ),
            actions: [
              !isInBooking
                  ? GestureDetector(
                      onTap: () {
                        if (token == null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (c) => DoctorAppointmentScreen(
                                        doctor: doctor,
                                        back: true,
                                      )));
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (c) => PleaseLogin(
                                        Feature: 'Services',
                                      )));
                        }
                      },
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(8)),
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Center(
                          child: Text(
                            "View profile",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  : Container(),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(8)),
                  padding: EdgeInsets.symmetric(vertical: 7),
                  child: Center(
                    child: Text(
                      "close",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          );
        });
  }

  doctorDetails({final String title, final String data}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title + ":",
          style: TextStyle(
              fontSize: 14, color: Colors.black54, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          width: 84,
          child: Text(
            data,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
        )
      ],
    );
  }
}

class ServiceDetailScreen extends StatelessWidget {
  ServiceDetailScreen({Key key, this.doctor}) : super(key: key);
  Doctor doctor;
  doctorDetails({final String title, final String data}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title + ":",
          style: TextStyle(
              fontSize: 14, color: Colors.black54, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          width: 84,
          child: Text(
            data,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Service Details",
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(
              //   width: double.infinity,
              //   child: Row(
              //     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       IconButton(
              //           onPressed: () => Navigator.pop(context),
              //           icon: Icon(
              //             CupertinoIcons.back,
              //             color: Colors.black,
              //             size: 40,
              //           )),
              //       SizedBox(
              //         width: 20,
              //       ),
              //       Text(
              //         "Service Details",
              //         style: TextStyle(fontSize: 20),
              //       ),
              //     ],
              //   ),
              // ),
              // ScopedModel<DepartmentScopedModel>(
              //     model: DepartmentScopedModel.instance,
              //     child: Builder(
              //       builder: (context) {
              //         DepartmentScopedModel.of(context).getDepartments();
              //         return Column(
              //           mainAxisSize: MainAxisSize.min,
              //           children: [
              //             Divider(),
              //             ClipRRect(
              //                 borderRadius: BorderRadius.circular(8),
              //                 child:
              //                  doctor.image != null

              //                     ? doctor.image.endsWith("g")

              //                         ? Image.network(
              //                             getDoctorImageUrl(doctor.image),
              //                             width: 250,
              //                             height: 50,
              //                           )
              //                         :
              //                         SizedBox(
              //                             height: 50,
              //                             width: 250,
              //                             child: Image.asset(
              //                                 "assets/doctor_placeholder.jpg"))
              //                     :
              //                     SizedBox(
              //                         height: 50,
              //                         width: 250,
              //                         child: Image.asset(
              //                             "assets/doctor_placeholder.jpg"))),
              //           ],
              //         );
              //       },
              //     ))
              SizedBox(
                height: 40,
              ),
              ScopedModel<DepartmentScopedModel>(
                model: DepartmentScopedModel.instance,
                child: Builder(builder: (context) {
                  DepartmentScopedModel.of(context).getDepartments();
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Divider(),

                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            // border: Border.all(color: Colors.amber)
                            ),
                        // width: 5000,
                        height: 200,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: doctor.image != null
                                ? doctor.image.endsWith("g")
                                    ? Image.network(
                                        getDoctorImageUrl(doctor.image),
                                        width: double.infinity,
                                        height: 50,
                                        fit: BoxFit.cover,
                                      )
                                    : SizedBox(
                                        height: 50,
                                        width: double.infinity,
                                        child: Image.asset(
                                            "assets/doctor_placeholder.jpg"))
                                : SizedBox(
                                    height: 50,
                                    width: double.infinity,
                                    child: Image.asset(
                                        "assets/doctor_placeholder.jpg"))),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        doctor?.name ?? "",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600),
                      ),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Padding(
                          //   padding: const EdgeInsets.only(top: 6.0),
                          //   child: ClipRRect(
                          //       borderRadius: BorderRadius.circular(8),
                          //       child: doctor.image != null
                          //           ? Image.network(
                          //               getDoctorImageUrl(doctor.image),
                          //               width: 50,
                          //               height: 50,
                          //             )
                          //           : SizedBox(
                          //               height: 50,
                          //               width: 50,
                          //               child: Image.asset(
                          //                   "assets/doctor_placeholder.jpg"))),
                          // ),
                          SizedBox(
                            width: 15,
                          ),
                          ScopedModelDescendant<DepartmentScopedModel>(
                              builder: (context, child, model) {
                            Department doctorDepartment;
                            model.departmentsList.forEach((element) {
                              if (element.id == doctor.departmentId) {
                                doctorDepartment = element;
                              }
                            });
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // SizedBox(
                                //   height: 40,
                                //   width: 84,
                                //   child: Text(
                                //     doctor?.name ?? "",
                                //     style: TextStyle(
                                //         fontSize: 17,
                                //         fontWeight: FontWeight.w600),
                                //   ),
                                // ),

                                SizedBox(
                                  height: 10,
                                ),
                                doctorDetails(
                                    title: "NMC No",
                                    data: "${doctor.nmc ?? "not available"}"),
                                SizedBox(
                                  height: 10,
                                ),
                                doctorDetails(
                                    title: "Department",
                                    data:
                                        "${doctorDepartment.name ?? "not available"}"),
                                SizedBox(
                                  height: 10,
                                ),
                                // doctorDetails(
                                //   title: "Qualification",
                                //   data:
                                //       "${doctor.qualification ?? "not available"}",
                                // ),
                                // SizedBox(
                                //   height: 10,
                                // ),
                                // doctorDetails(
                                //   title: "Experience",
                                //   data: "${doctor.experience ?? "not available"}",
                                // ),
                              ],
                            );
                          }),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              doctorDetails(
                                title: "Qualification",
                                data:
                                    "${doctor.qualification ?? "not available"}",
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              doctorDetails(
                                title: "Experience",
                                data: "${doctor.experience ?? "not available"}",
                              ),
                              // SizedBox(
                              //   width: 100,
                              //   height: 40,
                              //   child: Text(
                              //     "Consultation Fee:",
                              //     style: TextStyle(
                              //         fontSize: 17, fontWeight: FontWeight.w600),
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 10,
                              // ),
                              // Text(
                              //   "${doctor.appointmentFee ?? "0"}",
                              //   style: TextStyle(
                              //     fontSize: 14,
                              //     color: Colors.black54,
                              //   ),
                              // )
                            ],
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Consultation Fee:",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          // SizedBox(
                          //   width: 80,
                          // ),
                          Text(
                            "Rs ${doctor.appointmentFee ?? "0"}",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.green,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Container(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return DoctorAppointmentScreen(
                                      back: true,
                                      doctor: doctor,
                                    );
                                  }));
                                },
                                child: Text("Book Now"))),
                      )
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
