import 'dart:io';

void main() {
  stdout.write("Input = ");
  var input = int.parse(stdin.readLineSync()!);
  diagonal(input);
}

void diagonal(int inputs) {
  for (int i = 1; i <= inputs; i++) {
    for (int a = 1; a < i; a++) {
      stdout.write(' ');
    }
    print(i);
  }
}
