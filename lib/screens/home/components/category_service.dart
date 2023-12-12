import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:singleclinic/common/widgets/heading_tile.dart';
import 'package:singleclinic/main.dart';
import 'package:singleclinic/modals/JobsList.dart';
import 'package:singleclinic/scoped_models/department_scoped_model.dart';
import 'package:singleclinic/screens/department/department_screen.dart';
import 'package:singleclinic/screens/doctors/doctors_list_screen.dart';
import 'package:singleclinic/utils/colors.dart';
import 'package:singleclinic/utils/extensions/padding.dart';
import 'package:singleclinic/utils/helper.dart';

import '../../doctors/job_list.dart';

class CategoryServices extends StatelessWidget {
  const CategoryServices({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<DepartmentScopedModel>(
      model: DepartmentScopedModel.instance,
      child: Builder(builder: (context) {
        DepartmentScopedModel.of(context).getDepartments();
        return ScopedModelDescendant<DepartmentScopedModel>(
            builder: (context, _, model) {
          return Container(
            color: background2,
            child: Column(
              children: [
                HeadingTile(
                  title: "Categories",
                  route: DepartmentListScreen.routeName,
                ),
                SizedBox(
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              model.departmentsList[index].name,
                              style: GoogleFonts.poppins(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            JobsListView(filtersMap: {
                              "department_id":
                                  model.departmentsList[index].name.toString()
                            })
                          ],
                        )
                      ],
                    ).px(10),
                    itemCount: model.departmentsList.length,
                  ),
                )
              ],
            ),
          );
        });
      }),
    );
  }
}
