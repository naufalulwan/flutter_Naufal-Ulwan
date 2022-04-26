class FoodModel {
  int? id;
  String? name;

  FoodModel({this.id, this.name});

  FoodModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
