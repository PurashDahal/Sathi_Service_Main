import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:singleclinic/modals/Doctor_model.dart';
import 'package:singleclinic/services/api_service.dart';
import 'package:singleclinic/utils/AppExceptions.dart';

class HospitalJobsScopedModel extends Model {
  static HospitalJobsScopedModel of(BuildContext context) =>
      ScopedModel.of<HospitalJobsScopedModel>(context);

  HospitalJobsScopedModel._();

  static HospitalJobsScopedModel instance = HospitalJobsScopedModel._();

  ApiService _service = ApiService.instance;
  RefreshController doctorRefreshController = RefreshController();

  int _currentPage = 1;
  var filteredParams = {};

  List<Doctor> doctorsList = [];
  List<Doctor> homePageDoctorList = [];

  getJobs(var data, {bool isRefresh = false}) async {
    print("Getting doctors");
    if (isRefresh) {
      print("Refreshing list");
      _currentPage = 1;
      doctorsList.clear();
    }
    filteredParams = data;
    data["page"] = _currentPage.toString();
    print(data);
    try {
      var list = await _service.getFilteredJobs(data);
      _currentPage++;
      doctorsList.addAll(list);
    } on NoMoreResult catch (_) {
      print("No more data");
      doctorRefreshController.footerMode.value = LoadStatus.noMore;
    }
    notifyListeners();
  }

  getHomePageJobs(var data, {bool isRefresh = false}) async {
    data["page"] = "1";
    var list = await _service.getFilteredJobs(data);
    homePageDoctorList.addAll(list);
    notifyListeners();
  }

  onFilteredLoad() async {
    print("On Loading");
    getJobs(filteredParams);
  }
}
