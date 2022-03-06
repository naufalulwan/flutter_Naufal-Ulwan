import 'dart:io';

void main() {
  stdout.write('Input = ');
  var input = int.parse(stdin.readLineSync()!);
  print('Return ${oddEven(input)}');
}

bool oddEven(int inputs) {
  if (inputs % 2 == 0) {
    return true;
  } else {
    return false;
  }
}
