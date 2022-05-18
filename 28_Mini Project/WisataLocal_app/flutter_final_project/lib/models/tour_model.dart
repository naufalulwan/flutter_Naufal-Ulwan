import 'package:cloud_firestore/cloud_firestore.dart';

class TourModel {
  String? uid;
  String? nameTour;
  String? caption;
  String? url;

  TourModel({this.uid, this.nameTour, this.caption, this.url});

  TourModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    nameTour = json['name'];
    caption = json['caption'];
    url = json['url'];
  }
}
