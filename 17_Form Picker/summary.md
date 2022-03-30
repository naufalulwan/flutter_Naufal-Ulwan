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

### 3. File Picker

## Task 

Disini saya membuat aplikasi flutter dengan tiga page, yaitu tampilan pertaman untuk menampikan list gridview, tampilan kedua yaitu berisi form dan picker untuk mengambil data, dan tampilan ketiga yaitu untuk menampilkan hasil dari yang dibuat di halaman kedua secara single.

Untuk statenya saya menggunakan provider juga agar mempermudah dalam pengambilan data.

Screenshots : [SS flutter_post add_screen](screenshots/SS%20add_post_screen.png), [SS flutter_post view_screen](screenshots/SS%20view_post_screen.png), [SS flutter_post list_screen](screenshots/SS%20list_post_screen.png), [SS flutter_post list_screen_data](screenshots/SS%20add_post_screen_data.png)

Source code : [SC flutter_post](praktikum/flutter_post/)
