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
      String? checkLanjut = stdin.readLineSync();
      if (checkLanjut?.toUpperCase() != "Y") {
        break;
      } else {
        mobil.angkut = true;
      }
    }
  }
}

class Hewan {
  // Membuat Constructor pada masing-masing property di kelas Hewan
  Hewan({this.berat = 0});

  // Membuat Getter pada masing-masing property di kelas Hewan
  int berat;
}

class Mobil {
  // Membuat Constructor pada masing-masing property di kelas Mobil
  Mobil({this.kapasitas = 100, this.muatan, this.angkut = true});

  // Membuat Getter pada masing-masing property di kelas Mobil
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
      return "Ga jelas";
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
