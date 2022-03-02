/* untuk menggunakan library dart:io yang berfungsi untuk membacah inputan 
keyboard, karena code di bawah mengandung inputan */
import 'dart:io';

/* fungsi untuk mengkonversi angka ke faktorial dengan parameter yang wajib ada
nilainya karena disitu membutuhkan required dan hasilnya menggunakan tipe data
double */
double faktorial({required int jumlah}) {
  /*jika inputan dengan jumlah 0 maka disini mengembalikan nilai 1
  karena faktorial 0 tidak bisa */
  if (jumlah == 0) return 1;
  return jumlah * faktorial(jumlah: jumlah - 1);
}

void main() {
  /* Menginput nilai dan memasukannya ke dalam variabel angka dengan tipe data
  integer */
  stdout.write("Masukan Angka : ");
  int? angka = int.parse(stdin.readLineSync()!);

  /* menampilkan hasil dari angka dan juga faktorialnya, disini terdapat method
  .toString() yang berfungsi untuk alih alih mengubahnya ke dalam String agar
  penggabungan dapa dilakukan sesama string */
  print("faktorial dari $angka adalah " + faktorial(jumlah: angka).toString());
}
