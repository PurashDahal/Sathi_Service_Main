import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:singleclinic/common/widgets/heading_tile.dart';
import 'package:singleclinic/main.dart';
import 'package:singleclinic/scoped_models/department_scoped_model.dart';
import 'package:singleclinic/screens/department/department_screen.dart';
import 'package:singleclinic/screens/doctors/doctors_list_screen.dart';
import 'package:singleclinic/utils/colors.dart';
import 'package:singleclinic/utils/extensions/padding.dart';
import 'package:singleclinic/utils/helper.dart';

class OurDepartments extends StatelessWidget {
  const OurDepartments({Key key}) : super(key: key);

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
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Column(
                      children: [
                        Card(
                          // color: primaryColor,
                          // shape: CircleBorder(),
                          child: IconButton(
                            onPressed: () {
                              print(model.departmentsList[index].id.toString());
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => JobsListScreen(
                                              filtersMap: {
                                                "department_id": model
                                                    .departmentsList[index].name
                                                    .toString()
                                              })));
                            },
                            iconSize: 55,
                            icon: Image.network(
                              getDepartmentImageUrl(
                                  model.departmentsList[index].image),
                              width: double.infinity,
                            ).p(0),
                          ),
                        ),
                        Text(
                          model.departmentsList[index].name,
                          style: GoogleFonts.poppins(fontSize: 11),
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
