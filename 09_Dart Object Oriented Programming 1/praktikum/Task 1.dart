import 'dart:io';

void main() {
  // Pemanggilan Object Hewan dan disimpan kedalam variable hewan
  Hewan hewan = Hewan();
  // Pemanggilan Object Mobil dan disimpan kedalam variable mobil
  Mobil mobil = Mobil();

  while (mobil.angkut == true) {
    stdout.write("Masukkan berat hewan yang akan diinput : ");
    int beratHewan = int.parse(stdin.readLineSync()!);
    hewan.berat = beratHewan;

    // Masukkan hewan ke dalam mobil muatan
    mobil.tambahMuatan(hewan.berat);
    print("Daftar muatan : ${mobil.muatan}");

    if (mobil.angkut == false) {
      print(mobil.tambahMuatan(hewan.berat));
      stdout.write("Lanjut? (Y/N) : ");
      String? check = stdin.readLineSync();
      if (check?.toUpperCase() != "Y") {
        break;
      } else {
        mobil.angkut = true;
      }
    }
  }
}

class Hewan {
  Hewan({this.berat = 0});
  int berat;
}

class Mobil {
  Mobil({this.kapasitas = 100, this.muatan, this.angkut = true});
  int kapasitas;
  List? muatan;
  bool angkut;
  // Membuat method tambahMuatan
  tambahMuatan(berat) {
    int total = totalMuatan();
    List tempMuatan = muatan ?? [];

    if ((total + berat) > kapasitas) {
      angkut = false;
      return "Kapasitas kepenuhan!";
    } else if (berat <= 0) {
      angkut = false;
      return "Ga bisa mines";
    } else {
      tempMuatan.add(berat);
      angkut = true;
      return muatan = tempMuatan;
    }
  }

  // Membuat method totalMuatan
  int totalMuatan() {
    int total = 0;
    List tempMuatan = muatan ?? [];

    if (tempMuatan.isNotEmpty) {
      for (int item in tempMuatan) {
        total += item;
      }
    }
    return total;
  }
}
