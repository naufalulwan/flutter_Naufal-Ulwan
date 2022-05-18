class ApiModel {
  List<TourPlace>? tourPlace;

  ApiModel({this.tourPlace});

  ApiModel.fromJson(Map<String, dynamic> json) {
    if (json['tour_place'] != null) {
      tourPlace = <TourPlace>[];
      json['tour_place'].forEach((v) {
        tourPlace!.add(TourPlace.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (tourPlace != null) {
      data['tour_place'] = tourPlace!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TourPlace {
  int? id;
  String? name;
  String? caption;
  String? status;
  String? url;
  String? updatedAt;
  String? createdAt;

  TourPlace(
      {this.id,
      this.name,
      this.caption,
      this.status,
      this.url,
      this.updatedAt,
      this.createdAt});

  TourPlace.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    caption = json['caption'];
    status = json['status'];
    url = json['url'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['caption'] = caption;
    data['status'] = status;
    data['url'] = url;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    return data;
  }
}
