import 'dart:io';

void main() {
  stdout.write("Input = ");
  var input = int.parse(stdin.readLineSync()!);
  print("Return ${azimuth(input)}");
}

int azimuth(int inputs) {
  if (inputs >= 180 && inputs < 360) {
    return inputs - 180;
  } else if (inputs < 180 && inputs > 0) {
    return inputs + 180;
  } else {
    return 0;
  }
}
