# (19) Flutter Navigation

Hal yang saya pelajari disini adalah 

1. Navigation
2. Navigation biasa
3. Navigation dengan named

## Resume

### 1. Navigation
Dalam sebuah aplikasi mobile biasanya memiliki full-screen elemen yang disebut “screen” atau “page”.  Di Flutter, elemen ini disebut route dan dikelola oleh widget Navigator. Widget navigator berfungsi untuk menampilkan konten ke halaman atau layar baru. Widget Navigator bekerja seperti tumpukan layar (stack), ia menggunakan prinsip LIFO (Last-In, First-Out). Ada dua method yang dapat digunakan pada Navigator widget yaitu :
 
 - Navigator.push (): Metode push digunakan untuk menambahkan rute lain ke atas tumpukan screen (stack) saat ini. Halaman baru ditampilkan di atas halaman sebelumnya.
 - Navigator.pop (): Metode pop menghapus rute paling atas dari tumpukan. Ini menampilkan halaman sebelumnya kepada pengguna.

### 2. Navigation biasa
Cara penggunaanya cukup simple yaitu kita harus memanggil kode seperti ini
```
Navigator.push(
    context, 
   	MaterialPageRoute(builder: (context) {
  		return Page()
  	})
);
```
Dalam contoh penerapannya, kita akan membuat routing sederhana menggunakan metode Navigator.push untuk navigasi ke layar baru dan Navigator.pop untuk kembali ke layar sebelumnya.

### 3. Navigation dengan named
Sesuai namanya, Named Routing yaitu memberi nama pada routing dengan tujuan untuk mempermudah dalam membaca dan menentukan arah dari suatu navigasi. Sedikit berbeda dengan simple routing, disini kita akan menggunakan Navigator.pushNamed untuk menuju ke halaman baru namun tetap menggunakan Navigator.pop untuk kembali ke halaman sebelumnya.

Navigator.pushNamed membutuhkan dua properti wajib yaitu context dan string sebagai nama routenya. Kita juga dapat mengirim parameter object ke dalam route, Contohnya seperti ini

```
void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: <String, WidgetBuilder>{
      '/': (context) => HomePage(),
      '/two': (context) => PageTwo(),
    },
  ));
```

Cara manggilnya cukup simple juga kita hanya mendeklarasikannya seperti ini `Navigator.pushNamed(context, '/two');`

## Task

Disini saya membuat dua page dan dua tab pada halaman utamanya, tab disini berfungsi untuk menyelesaikan persoalan no.2 yaitu melakukan navigation dengan atau tanpa named routes, tab satu yaitu menggunakan named dan tab kedua tidak menggunakan named, untuk menuju kehalaman berikutnya disini saya menggunakan floating action button dengan melakukan kondisi yaitu dimana tab dengan index 0 maka dia akan menggenerate onTap-nya menjadi fungsi navigator dengan named, jika indexnya 1 maka akan menggenerate onTap-nya menjadi navigater tanpa named, untuk tampilan pada halaman utama disini saya menggunakan listview yang dapat diinput pada halaman kedua yaitu halaman create contact yang berisi form - form yang dapat diinput.

Screenshots : [SS flutter_navigation](./screenshots/)

Source code : [SC flutter_navigation](./praktikum/)