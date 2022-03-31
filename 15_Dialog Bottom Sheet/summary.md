# (15) Dialog Bottom Sheet

Hal yang saya pelajari dari materi ini adalah
1. Membuat bottom sheet
2. Membuat dialog show alert
3. Memodifikasi bottom sheet

## Resume

### 1. Membuat Modal Bottom Sheet

Modal Bottom Sheet adalah salah satu dari ketiga tipe bottom sheet yang disediakan oleh Material Design. Ketiga tipe tersebut dibedakan dari perbedaan use case pada masing-masing bottom sheet. Menurut material design, modal bottom sheet berguna untuk menampilkan sebuah set of choices dengan memblokade interaksi antara bottom sheet dan sisa layar dengan menampilkan scrim yang tampak seperti overlay. Secara default, initial-height modal bottom sheet adalah 50% dari tinggi layar dan dapat di scroll untuk menampilkan keseluruhan layar jika tingginya lebih dari 50% ukuran layar. 

Modal Bottom Sheet dapat dikotumisasi didalamnya, kita bisa menambahkan berbagai macam widget agar tampilannya semakin interaktif.

Cara penggunaannya yaitu dengan memanggil fungsi showModalBottomSheet dan dalam fungsi tersebut membutuhkan dua properti wajib yaitu context dan builder, dibuilder ini kita bisa memodifikasi bottom sheet sesuka kita.

```
showModalBottomSheet(
    context: context,
    builder: (context) => Widget()
)
```

### 2. Membuat dialog show alert

Dialog adalah widget flutter yang menampilkan pesan secara pop up pada halaman aplikasi. Dialog biasanya ditampilkan dalam bentuk peringatan atau pesan kepada user. Bisa juga digunakan untuk menerima inputan dari user. Dialog yang akan digunakan ini yaitu alert dialog yang dimana membutuhkan widget helper method showDialog. cara penggunannya yaitu :

```
showDialog(
    context: context
    builder: (context) => AlertDialog(
        content: WidgetText(),
        action: [
            WidgetButton()
        ],
    ),
);
```

### 3. Komponen yang ada di dalam BottomSheet

komponen yang paling penting ialah `context` dan `builder`, akan tetapi di dalam BottomSheet juga memiliki kompenen untuk user experience, yaitu kita dapat menggunakan komponen `shape` untuk membentuk BottomSheet menjadi bentuk kotak dengan lengkungan atau tidak, cara ujung atas bottomsheet menjadi tumpul yaitu menggunakan properti `RoundedRectangleBorder` yang ditempatkan di dalam properti shape, tinggal diatur radiusnya dengan `BorderRadius.only`, dan kita dapat mengatur apakah bottomsheet tersebut dapat didismisable atau tidak dengan menambahkan komponen `isDismissible` bisa di set true atau false.

## Task

Membuat aplikasi gallery dengan tema twice, karena saya seorang ONCE wkwk, jadi tampilan aplikasi ini berupa gridview karena menampilkannya seperti sebuah gallery gambar, dan gambarnya masih statis, dan berupa list di dalam folder models.

grid tersebut dapat ditekan, karena saya menambahkan method inkwell, yang dimana widget tersebut bisa ditekan, jadi disini saya memiliki 2 kompenen dari inkwell yaitu onTap dan onLongPress, jika di onTap maka akan mengeluarkan dialog alert, dan jika di onLongPress maka akan mengeluarkan BottomSheet, pada dialog alert menghasilkan gambar, dan nama. sama seperti bottomsheet menghasilkan gambar dan nama. didalam dialog alert terdapat tombol view photos, yang dimana masih belum berfungsi karena keterbatasan waktu.

Source Code : [SC flutter_dialogbottomsheet](./praktikum/flutter_dialogbottomsheet/)

Screenshots : [SS flutter_dialogbottomsheet HomePage](./screenshots/ss%20homepage.png), [SS flutter_dialogbottomsheet bottomsheet](./screenshots/ss%20bottomsheet.png), [SS flutter_dialogbottomsheet dialog](./screenshots/ss%20dialog.png)