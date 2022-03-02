/* untuk menggunakan library dart:io yang berfungsi untuk membacah inputan 
keyboard, karena code di bawah mengandung inputan */
import 'dart:io';

String konversiNilai({required int nilai}) {
  /* branching atau statement untuk memilah nilai dengan operator comparison
  dan return digunakan untuk mengembalikan nilai dari fungsi */
  if (nilai > 70 && nilai <= 100)
    return "A";
  else if (nilai > 40 && nilai <= 70)
    return "B";
  else if (nilai > 0 && nilai <= 40)
    return "C";
  else
    return "";
}

void main() {
  // menampilkan teks apa adanya artinya tidak akan membuat baris baru
  stdout.write("Masukan Nilai : ");

  /*mengasilkan nilai dari inputan keyboard dan dikonversikan ke tipe data int
  dari int.parse() dengan persyaratan nilai tidak boleh kosong */
  int nilai = int.parse(stdin.readLineSync()!);

  /* menampilkan hasil dari nilai dan grade nilai dengan memanggil fungsi dan
  parameternya */
  print("Nilai $nilai dengan grade " + konversiNilai(nilai: nilai));
}
