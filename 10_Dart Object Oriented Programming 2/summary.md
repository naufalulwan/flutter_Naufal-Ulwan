# (10) Dart Object Oriented Programming 2

Poin yang saya pelajari dari materi ini adalah
- Inheritance
- Overriding
- Konstruktor


## Resume 

### Inheritance 

Dart mendukung konsep inheritance yang mana inheritance merupakan kemampuan dari suatu program untuk membuat kelas baru dari kelas yang ada. Kelas tersebut adalah kelas yang diperluas untuk membuat kelas yang lebih baru atau dalam dart dikenal dengan istilah parent class atau super class.

dalam kelas Inheritance ini menggunakan istilah parent dan child, anggapannya parent merupakan induk, yang memiliki anak lalu menurunkan sifat parent tersebut ke child. 

cara penggunannya seperti ini :

``` dart
class child_class extends parent_class {}
```

### Overriding

Pada kelas Inheritance ini dimana kelas child dapat mendefinisikan ulang metode di kelas parent, yaitu dengan metode overriding.

caranya : 

``` dart
class child_class extends parent_class {
    @override
    // fungsi yang ada didalam class parent
}
```

### Konstruktor

Konstruktor dalam bahasa pemrograman dart adalah fungsi khusus dari suatu kelas yang bertanggung jawab untuk menginisialisasi variabel yang ada di suatu kelas. Dart mendefinisikan sebuah konstruktor dengan nama yang sama sebagai suatu kelas.

Contohnya : 

``` dart
class class_name { 
    class_name(tipe_data name){
        // proses dari konstruktor
    }
}
```


## Task

Source code : [Tugas Praktikum OOP 2](praktikum/task%201.dart)

Membuat sebuah kelas dengan nama BangunRuang, yang memiliki property yaitu panjang, lebar, tinggi dengan metode konstruktor, lalu membuat metode volume() didalam kelas BangunRuang

Selanjutnya membuat kelas dengan nama Kubus, dan Balok. yang dimana kedua kelas menjadi kelas child, dan kelas tersebut harus Inheritance dengan kelas BangunRuang, selanjutnya meng overriding metode volume() setiap masing masing kelas, lalu membuat rumus kubus dan balok di volume tersebut().

selanjutnya menampilkan hasil dari kelas kubus dan kelas balok di fungsi main, lalu memasukan nilai ke object tersebut.

Hasilnya : [Hasil tugas OOP 2](screenshots/ss%20tugas%20task%201%20no%201,%202.png)