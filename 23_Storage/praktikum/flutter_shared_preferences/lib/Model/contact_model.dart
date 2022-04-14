class Contact {
  final String name;
  final String numberPhone;

  Contact({
    required this.name,
    required this.numberPhone,
  });

  Map toJson() => {
        'name': name,
        'numberPhone': numberPhone,
      };

  Contact.fromJson(Map json)
      : name = json['name'],
        numberPhone = json['numberPhone'];
}
