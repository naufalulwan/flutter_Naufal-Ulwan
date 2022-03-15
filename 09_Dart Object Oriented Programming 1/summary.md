# (9) Dart Object Oriented Programming 1

Poin yang saya pelajari dari materi ini adalah
    - Pengertian class
    - Cara membuat method, property
    - Cara memanggil class beserta method, dan property

## Resume

### 1. Pengertian class

Class merupakan blueprint atau rancangan awal dari suatu object. dibuatnya class yaitu kita dapat menghandle suatu program di dalam classnya dengan mudah atau seperti membuat method custom.

### 2. Cara membuat method, property

Cara membuat method yaitu sama dengan membuat fungsi pada biasanya, bedanya letak penempatannya jika fungsi berada paling paling luar, dan method berada di dalam class, Contoh :

    class nama {
        // yang dibawah ini merupakan method orang() dan hewan()
        void orang(parameter) {}
        void hewan(parameter) {}
    }

Cara membuat property yaitu seperti membuat variable tetapi variable tersebut berada didalam class, Contohnya : 

    class nama {
        // ini merupakan property
        var arti = "baik";
    }
### 3. Cara memanggil class beserta method, dan property

Cara memanggil class yaitu `var i = nama();` atau bisa juga dengan `nama i = nama();` tetapi lebih direkomendasikan yaitu yang tipe data dengan nama classnya langsung karena bersifat instant,selanjutnya yaitu memanggil method dengan cara `i.orang(argument);`, dan property yaitu `i.arti;`


Pemanggilan class sangat fleksibel bisa antar class ataupun antar fungsi, dan juga bisa dipanggil berkali-kali.

## Task 


Source code : [tugas oop 1](praktikum/Task%201.dart)

Pada program tugas dart saya ini data/nilai yang digunakan menggunakan inputan, yang dilakukan dengan perulangan agar dapat memasukan data inputan kesebuah list.

Membuat 2 buah class yaitu dengan nama hewan dan mobil.

Pada class hewan berfungsi untuk menyimpan nilai berat dari hasil inputan dengan menggunakan metode konstruktor non parameter dengan kata kunci 'this', dan juga hasil inputan di fungsi main dialokasikan ke property getter.

Pada class mobil sama menggunakan property getter dan konstrukor, dan di class mobil ini memiliki 2 method yaitu tambahMuatan() dan totaMuatan().

method tambahMuatan() tersebut digunakan untuk menguji apakah muatan dari class hewan itu muat dengan kapasitas mobil, jika muat maka diangkut, dan jika tidak muat maka tidak diangkut.

method totalMuatan(), method ini berfungsi menghitung total yang ada di dalam list muatan. lalu jika sudah dijumlahkan semua nilai yang ada di list, method ini masih digunakan oleh method tambahMuatan() yang tujuan nnya sebagai tolak ukur pada statement.

Hasil screenshots : [hasil screenshots oop 1](screenshots/ss%20dart%20oop%201.png)