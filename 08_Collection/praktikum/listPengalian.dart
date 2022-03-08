void main() async {
  List list_input = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  int pengali_input = 3;
  var result = await listKali(list_input, pengali_input);
  print(result);
}

listKali(List list_data, int pengali) async {
  List new_data = [];

  for (var item in list_data) {
    new_data.add(await pengalian(item, pengali));
  }
  return new_data;
}

pengalian(int _item, int _pengali) {
  return _item * _pengali;
}
