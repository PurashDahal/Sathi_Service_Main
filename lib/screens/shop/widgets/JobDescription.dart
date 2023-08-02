import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:singleclinic/common/widgets/drawer.dart';
import '../../../modals/Doctor_model.dart';
import '../../../utils/colors.dart';
import '../../../utils/helper.dart';
import 'JobDesciptionModal.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class JobDesciptoion extends StatefulWidget {
  JobDesciptoion({
    Key key,
    this.job,
    this.title,
    this.text,
    this.requiremets,
    this.Salary,
    this.designation,
    this.duration,
    this.experience,
    this.location,
  }) : super(key: key);
  // final JobDesciptionModal;
  Doctor job;
  String title;
  String text;
  int requiremets;
  String experience;
  int Salary;
  String designation;
  String duration;
  String location;

  @override
  State<JobDesciptoion> createState() => _JobDesciptoionState();
}

class _JobDesciptoionState extends State<JobDesciptoion> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    List info = [
      {
        "title": "Experience",
        "subtitle": widget.experience,
      },
      {
        "title": "Salary",
        "subtitle": widget.Salary,
      },
      {
        "title": "Location",
        "subtitle": widget.location,
      },
    ];
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.height * 0.4,
            child: FloatingActionButton(
              child: Text(
                "Apply Now",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11)),
              onPressed: () {
                // print(widget.expiryDate);
              },
            ),
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Job Description",
          ),
          backgroundColor: Color(0xff002745),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Column(children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xff002745),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(22),
                        bottomLeft: Radius.circular(22))),
                height: MediaQuery.of(context).size.height * 0.26,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 50.0,
                      child: ClipOval(
                        child: Image.network(
                          getDoctorImageUrl(widget.job.image),
                          fit: BoxFit.cover,
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                      ),
                    ),
                    Text(widget.job.name,
                        style: GoogleFonts.yantramanav().copyWith(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600)
                        // TextStyle(color: Colors.white, fontSize: 20,),
                        ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: 90,
                            padding: EdgeInsets.only(
                                left: 10, right: 10, top: 4, bottom: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11),
                              color: Colors.white.withOpacity(0.3),
                            ),
                            child: Center(
                                child: Text(
                              widget.duration,
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                          Container(
                              width: 90,
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, top: 4, bottom: 4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(11),
                                color: Colors.white.withOpacity(0.3),
                              ),
                              child: Center(
                                  child: Text(
                                widget.designation,
                                style: TextStyle(color: Colors.white),
                              )))
                          //
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Description",
                style: GoogleFonts.abhayaLibre().copyWith(fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.text),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  width: double.infinity,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: info.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 5,
                          child: ListTile(
                            title: Text(
                              info[index]['title'],
                            ),
                            subtitle: Text(info[index]['subtitle'].toString()),
                          ),
                        );
                      }),
                ),
              ),
              SizedBox(height: 50),
            ]),
          ),
        ),
      ),
    );
  }
}
