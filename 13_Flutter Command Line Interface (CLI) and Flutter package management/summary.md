# (13) Flutter Command Line Interface (CLI) and Flutter package management

Poin yang saya pelajari yaitu : 
1. Pengertian CLI dan Package Flutter
2. Mengetahui beberapa command CLI pada Flutter 
3. Menginstall package Flutter dan mengimportnya

## Resume 

### 1. Pengertian CLI Commands dan Package Flutter

CLI merupakan singkatan dari Command Line Interface yang dimana user bisa mengetikan perintah dalam bentuk teks dan memberikan instruksi pada komputer untuk mengerjakan tugas tertentu, pada flutter CLI ini berguna untuk memanagement flutter agar dapat beroprasi sesuai command yang ingin di input.

Package Flutter berisi kerangka program atau seperti template pada widget tertent untuk mempercepat kita memprogram sebuah aplikasi.

### 2. Mengetahui beberapa command CLI pada Flutter 

Beberapa CLI yang saya ketahui dan dicoba yaitu 

- Flutter Doctor 
  
  Berguna untuk mengecek versi dari flutter, dan juga enviroment apa saja yang ga ada atau yang dibutuhkan, biasanya akan ada tanda ceklis dan silang, jika ceklis sudah tersedia, jika silang tandanya tidak ada dan harus diinstall, dan untuk yang tidak ada penginstallanya sudah tersedia dideskripsi jadi tidak perlu bingung.

- Flutter Run  
  
  Perintah untuk menjalankan program flutter kita.

- Flutter Pub
  
  Perintah untuk mendapatkan sebuah package yang ada di pubspec / global dan diletakan di dependencies biasanya menggunakan get untuk mendapatkannya package yang berada di pubspecseperti `flutter pub get` dan untuk mendapatkan dari global menggunakan `flutter pub add nama_package`

- Flutter Clean
  
  Perintah untuk membersihkan file yang tidak terpakai di flutter saat menjalankan programnya agar dapat memperkecil ukuran project tersebut.

### 3. Menginstall package Flutter dan mengimportnya

yang pertama mencari sebuah package yang ingin kita pakai di project dengan mengakses situs https://pub.dev/, disitu terdapat banyak package tinggal dipilih saja, selanjutnya klik package yang dibutuhkan lalu cari tombol Installing, dan klik, lalu disitu terdapat cara pennginstallannya, biasanya jika lewat CLI kita harus mengetikan perintah `flutter pub add nama_package`, setelah itu baru kita ketik perintah pada commands yaitu `flutter pub get` dan terakhir tinggal import package tersebut ke dalam program dart kita.

Jika manual tinggal copy depedencies packagenya lalu salin ke pubspec.yaml  di baris bawahnya depedencies, setelah itu save, flutter akan otomatis menjalankan perintah pub get.

## Task

### 1. Badge Package

Menggunakan Package dari https://pub.dev/packages/barcode_widget, lalu membuat beberapa badge seperti yang ada disoal.

Source Code : [SC Badge Package](praktikum/flutter_badges/)

Screenshots : [SS Badge Package](screenshots/ss_package%20badge.png)

### 2. Barcode package

Menggunakan Package dari https://pub.dev/packages/barcode_widget, lalu membuat tampilan barcode dari data yang sudah ada di soal

Source Code : [SC Barcode Package](praktikum/flutter_barcode/)

Screenshots : [SS Barcode Package 1](screenshots/SS_package%20barcode1.png), [SS Barcode Package 2](screenshots/SS_package%20barcode2.png), [SS Barcode Package 3](screenshots/SS_package%20barcode3.png)


