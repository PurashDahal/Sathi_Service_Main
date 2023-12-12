import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:singleclinic/common/widgets/LazyLoaderFooter.dart';
import 'package:singleclinic/modals/Doctor_model.dart';
import 'package:singleclinic/scoped_models/department_scoped_model.dart';
import 'package:singleclinic/scoped_models/doctors_model.dart';
import 'package:singleclinic/screens/appointment/appointment_booking_screen.dart';
import 'package:singleclinic/screens/doctors/widget/doctor_item_widget_vertical.dart';
import 'package:singleclinic/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/widgets/drawer.dart';
import '../pleaseLogin.dart';

class JobsListScreen extends StatefulWidget {
  static const routeName = "JobsListScreen";
  final Map<String, String> filtersMap;

  const JobsListScreen({Key key, this.filtersMap}) : super(key: key);

  @override
  State<JobsListScreen> createState() => _JobsListScreenState();
}

class _JobsListScreenState extends State<JobsListScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController searchController = TextEditingController();
  List<Doctor> searchedJobs;
  String _selectedValue;
  final Map<String, String> individual = {"individual": "yes"};
  String token;

  shredPre() async {
    var pref = await SharedPreferences.getInstance();
    token = pref.getString("token");
  }

  // ourDepartment() async {
  //   if (widget.filtersMap != null) {
  //     String currentId = widget.filtersMap['department_id'];
  //     await DepartmentScopedModel.instance.getDepartments();
  //     for (Department department
  //         in DepartmentScopedModel.instance.departmentsList) {
  //       print(currentId);
  //       print(department.id);
  //       if (currentId == department.id.toString()) {
  //         print("chiryo");
  //         if (department?.name != null) {
  //           _selectedValue = department.name.toLowerCase();
  //         } else {
  //           print("not found");
  //         }
  //         break;
  //       } else {
  //         print("chierena");
  //       }
  //     }
  //     searchJobsDepartment(
  //         _selectedValue.toLowerCase(), JobsScopedModel.instance);
  //     setState(() {});
  //   }
  // }

  @override
  void initState() {
    if (widget.filtersMap != null) {
      String text = widget.filtersMap.toString();
      text = text.replaceAll('{department_id: ', '').replaceAll('}', '');
      print("getting this is selected ${text}");
      _selectedValue = text.toLowerCase();
    }
    print("getting this is selected ${_selectedValue}");
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color(0xfff6f6f6),
        appBar: AppBar(
          title: Text(
            "Services",
            style: GoogleFonts.poppins().copyWith(color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
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
        body: ScopedModel<JobsScopedModel>(
            model: JobsScopedModel.instance,
            child: Builder(builder: (context) {
              print("Getting doctors from doctors screen");

              // JobsScopedModel.of(context).getJobs(
              //     widget.filtersMap == null
              //         ? individual
              //         : individual,
              //     isRefresh: true);
              if (_selectedValue == null) {
                JobsScopedModel.of(context).getJobs(
                  widget.filtersMap == null ? individual : individual,
                  // isRefresh: true
                ); // this is added after commented the new one
                return ScopedModelDescendant<JobsScopedModel>(
                    builder: (context, _, model) {
                  print("getting This IS NOT WORKING");
                  if (searchedJobs?.length != null) {
                    print("getting secobd if ");
                    return searchedJobs.length != null
                        ? SingleChildScrollView(
                            child: Column(
                              children: [
                                searchField(model),
                                ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) =>
                                      DoctorItemVertical(
                                    isInBooking: false,
                                    doctor: searchedJobs[index],
                                    onTap: () {
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (c) =>
                                      //             DoctorAppointmentScreen(
                                      //               doctor: searchedJobs[index],
                                      //               back: true,
                                      //             )));
                                      if (token != null) {
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (c) =>
                                        //             DoctorAppointmentScreen(
                                        //               doctor:
                                        //                   searchedJobs[index],
                                        //               back: true,
                                        //             )));
                                      } else {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (c) => PleaseLogin(
                                                      Feature: 'Services',
                                                    )));
                                      }
                                    },
                                  ),
                                  itemCount: searchedJobs.length,
                                )
                              ],
                            ),
                          )
                        : Center(
                            child: Text('No doctors available'),
                          );
                  } else {
                    print("getting secobd else ");

                    return model.doctorsList.length > 0
                        ? SingleChildScrollView(
                            child: Column(
                              children: [
                                searchField(model),
                                ListView.builder(
                                    physics: BouncingScrollPhysics(),
                                    itemCount: model.doctorsList.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      print(
                                          "Length ${model.doctorsList.length}");
                                      return DoctorItemVertical(
                                        isInBooking: false,
                                        doctor: model.doctorsList[index],
                                        onTap: () {
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //     builder: (c) =>
                                          //         DoctorAppointmentScreen(
                                          //       doctor:
                                          //           model.doctorsList[index],
                                          //       back: true,
                                          //     ),
                                          //   ),
                                          // );
                                          if (token != null) {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (c) =>
                                                        DoctorAppointmentScreen(
                                                          doctor: searchedJobs[
                                                              index],
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
                                      );
                                    }),
                              ],
                            ),
                          )
                        : Center(child: CircularProgressIndicator());
                  }
                });
              } else {
                JobsScopedModel.of(context).getJobs(
                  widget.filtersMap == null ? individual : individual,
                  // isRefresh: true
                );
                // return ScopedModelDescendant<JobsScopedModel>(
                //     builder: (context, _, model) {
                //   searchedJobs = [];
                //   model.doctorsList.forEach((e) {
                //     if (e.department != null) {
                //       if (e.department.name.toLowerCase() ==
                //           (_selectedValue.toLowerCase())) {
                //         searchedJobs.add(e);
                //       }
                //     }
                //     // if (e.name.toLowerCase().contains(_selectedValue.toLowerCase())) {
                //     //     searchedJobs.add(e);
                //     // }
                //   });
                //   print("getting a this is $searchedJobs");
                //   if (searchedJobs?.length != null) {
                //     return searchedJobs != null
                //     ? SingleChildScrollView(
                //       child: Column(
                //         children: [
                //           searchField(model),
                //           ListView.builder(
                //                   physics: BouncingScrollPhysics(),
                //                   shrinkWrap: true,
                //                   itemBuilder: (context, index) =>
                //                       DoctorItemVertical(
                //                     doctor: searchedJobs[index],
                //                     onTap: () {
                //                       Navigator.push(
                //                           context,
                //                           MaterialPageRoute(
                //                               builder: (c) =>
                //                                   DoctorAppointmentScreen(
                //                                     doctor:
                //                                         searchedJobs[index],
                //                                   )));
                //                     },
                //                   ),
                //                   itemCount: searchedJobs.length,
                //                 )
                //              ,
                //         ],
                //       ),
                //     ) : Center(
                //                   child: Text('No doctors available'),
                //                 );
                //   } else {
                //     return model.doctorsList.length > 0
                //         ? SingleChildScrollView(
                //           child: Column(
                //             children: [
                //               searchField(model),
                //               ListView.builder(
                //                 physics: BouncingScrollPhysics(),
                //                 shrinkWrap: true,
                //                 itemBuilder: (context, index) =>
                //                     DoctorItemVertical(
                //                   doctor: model.doctorsList[index],
                //                   onTap: () {
                //                     Navigator.push(
                //                         context,
                //                         MaterialPageRoute(
                //                             builder: (c) =>
                //                                 DoctorAppointmentScreen(
                //                                   doctor: model
                //                                       .doctorsList[index],
                //                                 )));
                //                   },
                //                 ),
                //                 itemCount: model.doctorsList.length,
                //               ),
                //             ],
                //           ),
                //         )
                //         : Center(child: CircularProgressIndicator());
                //   }
                // });
                return ScopedModelDescendant<JobsScopedModel>(
                    builder: (context, _, model) {
                  print("getting This IS NOT WORKING");
                  if (searchedJobs?.length != null) {
                    print("getting secobd if ");
                    return searchedJobs.length != null
                        ? SingleChildScrollView(
                            child: Column(
                              children: [
                                searchField(model),
                                ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) =>
                                      DoctorItemVertical(
                                    isInBooking: false,
                                    doctor: searchedJobs[index],
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (c) =>
                                                  DoctorAppointmentScreen(
                                                    doctor: searchedJobs[index],
                                                    back: true,
                                                  )));
                                    },
                                  ),
                                  itemCount: searchedJobs.length,
                                )
                              ],
                            ),
                          )
                        : Center(
                            child: Text('No doctors available'),
                          );
                  } else {
                    print("getting secobd else ");

                    return model.doctorsList.length > 0
                        ? SingleChildScrollView(
                            child: Column(
                              children: [
                                searchField(model),
                                ListView.builder(
                                    physics: BouncingScrollPhysics(),
                                    itemCount: model.doctorsList.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      print(
                                          "Length ${model.doctorsList.length}");
                                      return DoctorItemVertical(
                                        isInBooking: false,
                                        doctor: model.doctorsList[index],
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (c) =>
                                                  DoctorAppointmentScreen(
                                                doctor:
                                                    model.doctorsList[index],
                                                back: true,
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    }),
                              ],
                            ),
                          )
                        : Center(child: CircularProgressIndicator());
                  }
                });
              }
            })));
  }

  searchJobs(String doctorName, JobsScopedModel model) {
    searchedJobs = [];
    if (_selectedValue == null) {
      model.doctorsList.forEach((e) {
        if (e.name.toLowerCase().contains(doctorName.toLowerCase())) {
          print("getting this to change$doctorName");
          setState(() {
            searchedJobs.add(e);
          });
        }
      });
    } else {
      model.doctorsList.forEach((e) {
        if (e.name.toLowerCase().contains(doctorName.toLowerCase()) &&
            e.department.name
                .toLowerCase()
                .contains(_selectedValue.toLowerCase())) {
          print("getting this to change$doctorName");
          setState(() {
            searchedJobs.add(e);
          });
        }
      });
    }

    if (searchedJobs == []) {
      print("getting time check");
    }
  }

  searchJobsDepartment(String doctorName, JobsScopedModel model) {
    searchedJobs = [];
    model.doctorsList.forEach((e) {
      if (e.department != null) {
        if (e.department.name.toLowerCase() == (doctorName.toLowerCase())) {
          setState(() {
            searchedJobs.add(e);
          });
        }
      }
    });
  }

  searchField(JobsScopedModel model) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Select a category"),
              ScopedModel<DepartmentScopedModel>(
                  model: DepartmentScopedModel.instance,
                  child: Builder(builder: (context) {
                    DepartmentScopedModel.of(context).getDepartments();
                    return ScopedModelDescendant<DepartmentScopedModel>(
                        builder: (context, _, departmentModel) {
                      return DropdownButton<String>(
                        value: _selectedValue,
                        onChanged: (String newValue) {
                          searchJobsDepartment(newValue, model);
                          _selectedValue = newValue.toLowerCase();
                          setState(() {});
                        },
                        items: departmentModel.departmentsList
                            .map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value.name.toLowerCase(),
                            child: Text(value.name.toLowerCase()),
                          );
                        }).toList(),
                      );
                    });
                  })),
            ],
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 7,
                      offset: Offset(3, 3))
                ]),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none)),
              onChanged: (value) {
                searchJobs(value, model);
              },
            ),
          ),
        ],
      ),
    );
  }
}
