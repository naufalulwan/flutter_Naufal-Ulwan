class ContactModel {
  int? id;
  String? name;
  String? phone;

  ContactModel({this.id, this.name, this.phone});

  ContactModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
  }
}
