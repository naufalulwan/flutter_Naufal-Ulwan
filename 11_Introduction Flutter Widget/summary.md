# (11) Introduction Flutter Widget

Hal yang dipelajari dari materi ini adalah :
1. Penggunaan Stateless widget
2. Penggunaan Stateful widget
3. Widget dasar yaitu MaterialApp, Container, Center, dan Scaffold

## Resume 

### Penggunaan Stateless widget

Stateless Widget adalah widget yang hanya bertugas untuk menampilkan suatu secara statis. Tanpa melakukan tracking perubahan data dari waktu ke waktu. tampilan pada Stateless widget hanya itu - itu saja tanpa ada perubahan.

Statless widget ini berguna untuk dipakai pada tampilan yang statis, atau antarmuka saja yang tidak perlu adanya perubahan pada data.

### Penggunaan Stateful widget

Stateful Widget merupakan suatu widget yang sifatnya dinamis atau dapat berubah - ubah, kebalikan dari Stateless widget. Stateful widget dapat mengubah atau mengupdate tampilan, mengubah widget lainnya, mengubah nilai variabel, icon, warna, dll.

Stateful widget dapat mengubah dirinya kapanpun dibutuhkan berdasarkan action dari pengguna atau bahkan ketika terjadi perubahan data dari sisi database.

### Widget dasar yaitu MaterialApp, Container, Center, dan Scaffold

- MaterialApp

MaterialApp yaitu sebuah widget untuk membuat aplikasi yang menerapkan material design, selain itu MaterialApp ini berfungsi untuk menetapkan widget di awal pemanggilan, artinya yang dibaca pertama kali merupakan yang ada widget MaterialApp.

- Container 

Widget container adalah sebuah widget yang bertugas sebagai pembungkus dari widget lain.
Container sendiri memiliki berbagai property seperti : 

      - Padding
      - Margin
      - Border
      - Border radius 
      - Box shadow, dll
- Scaffold
  
Widget Scaffold ini berguna untuk memberikan tema material yang menjadi dasar dari tampilan android pada waktu artikel ini dibuat. Scaffold di biasa diletakan pada awal dari builderState. hal ini ditujukan untuk children atau Widget yang terletak di dalam Widget dari Scaffold ini akan mendapatkan material Design dari Scaffold ini. Hal ini lebih mudah dibanding untuk mengimplementasikan satu persatu dalam setiap widget yang diperlukan.

- Center

Center adalah widget layout untuk membuat widget ke tengah.

## Task 

1. Membuat Stateful widget yang kontennya dapat berubah setiap detik.

    Source Code : [File Flutter](praktikum/number1/lib/main.dart)

    Hasil : [Gambar Screenshots](./praktikum/../screenshots/ss%20task%20section%2011.png)

2. Dari widget tesebut, pisahkan menjadi beberapa widget tanpa mengubah tampilannya.

Disini saya memisahkan terlebih dahulu file main.dart dengan jadi setiap class saya membuat file tersendiri, class pertama yaitu file my_app / class MyApp disini saya menggunakan stateless widget dengan widget material app, jadi class ini yang pertama kali dibuild duluan, yang berisi class HomePage dengan parameter masukan yaitu title, dan backgroun, untuk membuil sebuah app bar.

Selanjutnya saya membuat file home_page yang berisi class HomePage yang dimana menggunakan stateless widget karena masih berupa tampilan statis, disini membuild sebuah tampilan home : appbar, dan body yang dimana menggunakan class Clock.'

class Clock ini menggunakan stateful widget untuk membuat jam, karena jam selalu berubah nilainya setiap detik berarti saya harus menggunakan stateful widget. untuk menjalankan widget jamnya saya menggunakan method tersendiri yaitu startTime() menggunakan time.periodic agar perubahan terjadi setiap parameter duration dimasukan, mau itu detik, menit, ataupun jam.

Setelah itu saya menggunakan anonymouse function untuk mau mengambil waktu kapan dengan method DateTime.now() berarti disini mengambil waktu sekaran/berjalan. lalu di setState, yaitu memasukan nilai ke state, dan menginitnya.

