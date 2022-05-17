class TourModel {
  String? uid;
  String? nameTour;
  String? caption;
  bool? status;
  String? url;
  String? createdAt;

  TourModel(
      {this.uid,
      this.nameTour,
      this.caption,
      this.status,
      this.url,
      this.createdAt});

  factory TourModel.fromJson(Map<String, dynamic> json) => TourModel(
        uid: json['uid'],
        nameTour: json['name'],
        caption: json['caption'],
        status: json['status'],
        url: json['url'],
        createdAt: json['createdAt'],
      );
}
