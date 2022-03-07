import 'dart:io';

void main() {
  stdout.write("Input =  ");
  var input = int.parse(stdin.readLineSync()!);
  jamPasir(input);
}

void jamPasir(int inputs) {
  int i, j;
  for (i = 1; i < 2 * inputs; i++) {
    for (j = 1; j <= inputs; j++) {
      stdout.write(' ');
      if ((i <= j && j < 2 * inputs) || (i + j >= 2 * inputs))
        stdout.write("*");
    }
    print('');
  }
}
