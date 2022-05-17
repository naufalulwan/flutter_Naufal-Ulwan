class UserModel {
  String? uid;
  String? name;
  String? email;
  bool? status;
  String? url;

  UserModel({this.uid, this.name, this.email, this.status, this.url});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      uid: json['uid'],
      name: json['name'],
      email: json['email'],
      status: json['contributor'],
      url: json['url']);
}
