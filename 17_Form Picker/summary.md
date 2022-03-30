# (17) Form Picker

Hal yang saya pelajari di materi ini adalah : 
1. Date picker
2. Color Picker
3. File Picker

## Resume 

### 1. Date picker
Cara membuat date picker ini dengan menggunakan fungsi bawaan flutter yaitu showDatePicker, dari fungsi showDatePicker ini menggunakan tipe data future. Fungsi showDatePicker memerlukan parameter context, initialDate, firsDate dan lastDate. initialDate adalah tanggal yg aktif saat DatePicker ditampilkan, firstDate adalah tanggal awal yang bisa dipilih dan lastDate adalah tanggal akhir yang bisa dipilih. Pada code dibawah, Date Picker akan menampilkan tanggal yang bisa dipilih dari awal tahun 2020 hingga tanggal saat ini, dengan tanggal aktif adalah tanggal hari ini.
```
 showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime.now(),
 );
```
### 2. Color Picker

Untuk color picker disini menggunakan package tambahan package flutter_colopicker 1.0.3, linknya bisa diakses disini https://pub.dev/packages/flutter_colorpicker, cara penggunanya cukup simple yaitu menggunaka dialog sebagai warpnya, dan juga membutuh alertdialog juga, dengan child yaitu ColorPicker untuk memanggil color picker.

Dan cara memanggil packagenya yaitu ketik di cmd $ flutter pub add flutter_colorpicker 

di file codingannya tambahkan `import 'package:flutter_colorpicker/flutter_colorpicker.dart'; `

### 3. File Picker

File picker yaitu kemampuan untuk mengambil segala macam jenis yaitu bisa berformat gambar, text, maupun video. Lalu ditempatkan di extension tambahan yaitu dengan package open_file 3.2.1 agar dapat membuka file yang diambil di file picker.

File picker tersendiri menggunakan package file_picker 4.3.3, cara installnya dan penggunannya bisa diliat di link berikut https://pub.dev/packages/file_picker, karena sudah lengkap dijelaskannya.

## Task 

Disini saya membuat aplikasi flutter dengan tiga page, yaitu tampilan pertaman untuk menampikan list gridview, tampilan kedua yaitu berisi form dan picker untuk mengambil data, dan tampilan ketiga yaitu untuk menampilkan hasil dari yang dibuat di halaman kedua secara single.

Untuk statenya saya menggunakan provider juga agar mempermudah dalam pengambilan data.

Screenshots : [SS flutter_post add_screen](screenshots/SS%20add_post_screen.png), [SS flutter_post view_screen](screenshots/SS%20view_post_screen.png), [SS flutter_post list_screen](screenshots/SS%20list_post_screen.png), [SS flutter_post list_screen_data](screenshots/SS%20add_post_screen_data.png)

Source code : [SC flutter_post](praktikum/flutter_post/)
