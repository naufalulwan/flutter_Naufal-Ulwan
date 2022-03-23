class User {
  final int id;
  final String name;
  final int telp;

  User({
    required this.id,
    required this.name,
    required this.telp,
  });
}

List<User> users = [
  User(
    id: 0,
    name: 'Historia',
    telp: 082124293938,
  ),
  User(
    id: 1,
    name: 'Erwin',
    telp: 081248635310,
  ),
  User(
    id: 2,
    name: 'Armin',
    telp: 089512831290,
  ),
  User(
    id: 3,
    name: 'Levi',
    telp: 089212312315,
  ),
];
