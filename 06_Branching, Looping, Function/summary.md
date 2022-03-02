# (6) Branching, Looping, Function

## Resume

Poin yang saya pelajari dari materi ini adalah : 
- Pengambilan keputusan / Branching
- Perulangan, Break, dan Continue
- Fungsi
 
### 💡 Pengambilan keputusan / Branching

Menentukan alur program pada kondisi tertentu

1. IF 
   
    - Memerlukan nilai bool (dari operator logical atau comparison)
    - Menjalankan bagian proses jika nilai bool bernilai true

    Dituliskan dengan : 
    ``` dart
    if(nilai_bool){
        // proses jika nilai_bool bernilai true
    }
    ```

2. IF-ELSE
    
    - Berjalan dengan if
    - Menambahkan alternatif jika nilai bool adalah false

    Dituliskan dengan : 
    ``` dart
    if(nilai_bool){
        // proses jika nilai_bool bernilai true
    } else {
        // proses jika nilai_bool bernilai false
    }
    ```

3. ELSE-IF
   
    - Berjalan dengan if
    - Menambahkan alternatif jika nilai bool adalah false
    - Menambahkan pengujian nilai bool lain

    Dituliskan dengan :
    ``` dart
    if(nilai_bool){
        // proses jika nilai_bool bernilai true
    } else if (nilai_booll) {
        // proses jika nilai_bool bernilai false
        //dan nilai_booll adalah true
    }
    ```
### 💡 Perulangan, Break, dan Continue
1. FOR

    - Diketahui berapa kali perulangan terjadi
    - Memerlukan nilai awal
    - Memerlukan nilai bool, jika true maka perulangan dilanjutkan
    - Memerlukan pengubah nilai

    Ditulis dengan :
    ``` dart
    for (nilai_awal; nilai_bool; pengubah_nilai_awal){
        // proses berulang jika nilai_bool adalah true
    }
    ``` 

2. WHILE
   
   - Tidak diketahui beberapa kali perulangan terjadi
   - Memerlukan nilai bool, jika true maka perulangan dilanjutkan

    Ditulis dengan : 
    ``` dart
   while (nilai_bool){
       // proses berulang jika nilai_bool adalah true
   }
    ``` 

3. DO-WHILE
   
   - Mengubah bentuk while
   - Proses dijalankan minimum sekali, akan diteruskan jika nilai bool adalah true

    Dituliskan dengan : 
    ``` dart
    do {
        // proses berulang jika nilai_bool adalah true
    } while (nilai_bool);
    ``` 

4. Break
   
   Menghentikan seluruh proses perulangan

5. Continue

    Menghentikan satu kali proses perulangan

### 💡 Fungsi

- Kumpulan perintah
- Dapat digunakan berkali-kali
- cukup mengubah fungsi sekali, penggunaan lainnya akan ikut berubah

#### Membuat fungsi
``` dart
tipe_data nama_fungsi(){
    // perintah yang dijalankan saat fungsi dipanggil
}
``` 

#### Memanggil fungsi
``` dart
nama_fungsi()
```

#### Fungsi dengan parameter
Mengirmkan data saat menjalankan fungsi
``` dart
tipe data nama_fungsi(tipe_data nama_parameter){
    // perintah yang dijalankan saat fungsi dipanggil
}
``` 

#### Fungsi dengan Return
Memberi nilai pada saat fungsi dipanggil
``` dart
tipe_data nama_fungsi(tipe_data nama_parameter){
    // perintah yang dijalankan saat fungsi dipanggil
    return nilai;
}
```

## Task
Penjelasannya ada didalam code

1. Terdapat sebuah nilai
   
   a. Jika nilai >  70 : return A

   b. Jika nilai >  40 : return B

   c. Jika nilai >  0 : return C

   d. Selain itu return teks kosong


``` dart
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
```
Hasilnya:

![nilai_grade](screenshots/ss%20nilai_grade.png)

2. Tampilkan nilai faktorial dari : 
   
   a. 10

   b. 20

   c. 30

``` dart 
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

```

Hasilnya :

![faktorial](screenshots/ss%20faktorial.png)