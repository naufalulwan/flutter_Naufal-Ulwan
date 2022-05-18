import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_final_project/models/api_model.dart';
import 'package:flutter_final_project/models/tour_model.dart';
import 'package:flutter_final_project/services/api_services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var tour = FirebaseFirestore.instance;
  ApiService service = ApiService();

  var tourData = <TourModel>[].obs;

  var apiTourData = <TourPlace>[].obs;

  @override
  void onInit() async {
    tourData.bindStream(readTour());
    getDataApiTour();
    super.onInit();
  }

  Stream<List<TourModel>> readTour() =>
      tour.collection('tour').snapshots().map((event) =>
          event.docs.map((data) => TourModel.fromJson(data.data())).toList());

  getDataApiTour() async {
    var apiTour = await service.getApi();
    if (apiTour != null) {
      apiTourData.assignAll(apiTour);
    }
  }
}
