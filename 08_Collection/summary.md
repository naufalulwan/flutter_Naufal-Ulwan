# (8) Collection


Poin yang saya pelajari dari materi ini adalah
1. Fungsi(Lanjutan)
2. Async-Await, Tipe data future
3. Collection

## Resume

### 1. Fungsi (Lanjutan)

Fungsi/ function adalah pemetaan dari nol atau lebih parameter masukan ke nol atau lebih parameter keluaran.

Fungsi di bahasa pemrograman Dart juga ada fungsi anonymouse dan juga fungsi arrow.

- Fungsi anonymouse, yaitu fungsi yang tidak memiliki nama dan juga parameter dan berfungsi untuk menyimpan data.
- Fungsi arrow, yaitu jenis fungsi yang sama seperti fungsi biasanya akan tetapi fungsi ini tidak memiliki kurawal dan tidak perlu return cukup tandan `=>` saja.

### 2. Async-Await dan tipe data future

Jenis Async-Await memberikan cara deklaratif untuk menentukan fungsi secara asinkron yaitu menjalankan fungsi tanpa perlu menunggu proses lain dijalankan, jika ada async berarti ada await, awiat disini bertugas untuk menunggu hingga proses async selesai.

tipe data future juga hampir sama dengan async await, bedanya tipe data future dapat mengatur waktu tunggu untuk pemrosesan, pemanggilannya menggunakan return dan dipanggil dengan async await.

### 3. Collection

Collection mereupakan kumpulan data yang disimpan pada satu tempat, collection di dart mempunyai berbagai jenis yaitu list, map, dan set

- list
  
  Merupakan kumpulan untuk menyimpan lebih dari satu nilai atau banyak nilai dalam variabel, artinya setiap elemen yang ada di list memiliki posisi tetap.

- set
  
  Mewakili sekumpulan objek dimana setiap objek hanya dapat muncul sekali.

- map

  Merupakan sekumpulan pasangan Key – Value yang tidak berurutan, tetapi key – values yang saling berkaitan.

## Task
 
### Task 1

Source code : [List Pengalian](praktikum/listPengalian.dart)

Fungsi yang dapat menerima 2 parameter sebagai nilai inputan yang diberi nama list_data dengan tipe data list dan pengali dengan tipe data int, list_data tesebut merupakan list yang digunakan untuk melakukan perulangan, disini saya membuat perulangan dengan fungsi async dan didalamnya saya membuat sebuah variabel dengan nama new_data dengan tipe data list, dari hasil perulangan tersebut menjalankan proses penambahan data list ke new_data dan dijalankannya fungsi pengalian, pada fungsi pengalian ini saya bedakan agar mudah dibacanya saat proses berjalan, jadi add list tadi menggunakan parameter fungsi pengalian dengan kunci await agar perulangan tersebut berjalan dengan asyncronus, selanjutnya jika proses perulangan selesai mereturn new_data agar ditampikan di fungsi main.

Screenshots : [screenshots hasil listPengalian](screenshots/ss%20listPengalian.png)

### Task 2

Source code : [list map](screenshots/ss%20listMap.png)

Disini saya menggunakan inputan statis, dan langsung berada di dalam map inputannya, jadi saya membuat sebuah variabel dengan tipe data list dan di beri nama array, didalamnya saya membuat compenent baru yaitu sub component atau dengan istilah list array multidimensi atau array berada di dalam array, dan di setiap sub element tersebut saya beri 2 data, yaitu `[1,2], [3,4]. 

Selanjutnya saya membuat fungsi baru dnegna tipe data map untuk sebuah mapnya jadi data sub element dari list tersebut dimasukan ke dalam map agar memanggil listnya menggunakan map, saya memberi key degan nama `data1` dan `data2` dan ditampilkan dengan menggunakan print

Screenshots : [screenshots hasil listMap](screenshots/ss%20listMap.png)