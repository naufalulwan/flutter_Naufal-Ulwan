# (12) Platform Widget

Poin yang saya pelajari dari materi ini adalah

1. Mengetahui widget navigation
2. Mampu membuat navigation drawer
3. Mengetahui apa itu Cupertino

## Resume

### 1. Widget navigation 

Navigasi digunakan untuk interaksi dan berpindah dari halaman satu ke halaman lainnya.

Di Flutter memiliki tiga opsi berbeda untuk menavigasi antar layar.

- Navigasi Langsung dengan MaterialPageRoute
- Navigasi Statis dengan Peta Rute
- Navigasi Dinamis dengan Rute yang Dihasilkan

### 2. Navigation drawer

Navigation Drawer merupakan menu navigasi yang tampil penuh pada sisi kanan atau kiri sebuah aplikasi. Untuk memunculkan Navigation Drawer bisa dengan cara di mengeser / swipe layar atau dengan menekan icon menu pada appBar.

untuk jenis drawer sendiri ada 2, yaitu : 
1. Drawer
2. End drawer

bedanya pada tata letaknya, drawer di kiri, end drawer di kanan.

### 3. Cupertino
Cupertino adalah style widget pada flutter yang dikhususkan untuk membuat style IOS.

diperlukan import cupertino agar bisa digunakan, yaitu dengan cara : 

    import 'package:flutter/cupertino.dart';

Biasanya menggunakan MaterialApp untuk android, di cupertino kita menggunakan CupertinoApp, dan untuk scaffold menggunakan CupertinoPageScaffold, mengganti AppBar dengan NavigationBar dan mengganti body dengan child.

## Task

1. Membuat aplikasi antarmuka page home aplikasi chat

screenshots : [Screenshots Chat Group No.1](screenshots/ss%20home%20chat%20group%20no.1.png), [Screenshots home chat No.1](screenshots/ss%20home%20chat%20no.1.png), [Screenshots sidebar No.1](screenshots/ss%20sidebar%20no.1.png)

file : [File flutter_widget](praktikum/flutter_widget/)

2. Membuat aplikasi home chat dengan menggunakan widget cupertino

screenshots : [Screenshots cupertino chat](screenshots/ss%20flutter_cupertino.png)

file : [File flutter_cuppertino](prakitkum/flutter_cupertino/)