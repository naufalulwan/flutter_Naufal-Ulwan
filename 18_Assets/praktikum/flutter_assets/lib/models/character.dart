class Character {
  final int id;
  final String name;
  final String imgUrl;

  const Character({
    required this.id,
    required this.name,
    required this.imgUrl,
  });
}

const chara = [
  Character(
    id: 0,
    name: 'Connie',
    imgUrl: 'assets/img/connie.jpg',
  ),
  Character(
    id: 1,
    name: 'Pixis',
    imgUrl: 'assets/img/pixis.jpg',
  ),
  Character(
    id: 2,
    name: 'Falco',
    imgUrl: 'assets/img/falco.jpg',
  ),
];
