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

import '../../common/widgets/drawer.dart';

class JobsListView extends StatefulWidget {
  static const routeName = "JobsListView";
  final Map<String, String> filtersMap;

  const JobsListView({Key key, this.filtersMap}) : super(key: key);

  @override
  State<JobsListView> createState() => _JobsListViewState();
}

class _JobsListViewState extends State<JobsListView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController searchController = TextEditingController();
  List<Doctor> searchedJobs;
  String _selectedValue;
  final Map<String, String> individual = {"individual": "yes"};

  @override
  void initState() {}

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<JobsScopedModel>(
        model: JobsScopedModel.instance,
        child: Builder(builder: (context) {
          print("Getting doctors from doctors screen");
          {
            JobsScopedModel.of(context)
                .getJobs(widget.filtersMap, isRefresh: false);
            return Text('Helleo');

            // return ScopedModelDescendant<JobsScopedModel>(
            //     builder: (context, _, model) {
            //   return Column(
            //     children: [
            //       ListView.builder(
            //         physics: BouncingScrollPhysics(),
            //         shrinkWrap: true,
            //         itemBuilder: (context, index) => DoctorItemVertical(
            //           doctor: searchedJobs[index],
            //           onTap: () {
            //             Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                     builder: (c) => DoctorAppointmentScreen(
            //                           doctor: searchedJobs[index],
            //                           back: true,
            //                         )));
            //           },
            //         ),
            //         itemCount: searchedJobs.length,
            //       )
            //     ],
            //   );
            // });
          }
        }));
  }
}
