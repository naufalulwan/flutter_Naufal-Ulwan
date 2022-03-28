# (16) Form Input Button

Materi yang saya pelajari dari section ke 16 ini yaitu : 
1. Form
2. Widget Inputan
3. Widget Button


## Resume
### 1. Form
Form merupakan hal yang umum ditemukan dan penting dalam sebuah aplikasi mobile. Penggunaan form juga sangat beragam, dari mulai untuk form login, register, kolom komentar, halaman order, dan banyak lagi. Karena pentingnya memahami penggunaan form pada sebuah aplikasi mobile, untuk itu dalam kesempatan ini kita akan membahas cara membuat form di Flutter menggunakan Form widget beserta komponen dan widget di dalamnya.

Form widget sendiri berfungsi untuk mempermudah dalam proses pembuatan dan memberi keamanan lebih pada aplikasi flutter seperti validasi, dan aksi lainnya yang umum terdapat pada sebuah form.

Contoh pembuatan form seperti ini

```
final _formKey = GlobalKey<FormState>();

Form(
    key: _formKey,
    child: Container(),
)
```
### 2. Widget Inputan
Adapun selain widget form widget inputan ada berbagai macam jenis yaitu : 
- TextFormField widget
  
  TextFormField berfungsi sebagai input field, biasanya digunakan untuk input nama lengkap, searching, email, password dan input lainnya. Untuk contoh kode penggunaannya seperti ini `TextFormField();` untuk TextFormField dapat menambahkan widget lain seperti icon, label, placeholder, dan juga bisa mengatur focus pada TextFormField ini, dan juga ada banyak keyboard type untuk mengatur keyboard sesuai kebutuhan pada form.
  
  Jika ingin inputan aman gunakanlah validation 
    ```
    validator: (value){
        // statement
    }
    ```
- CheckBox dan SwitchButton
  
  Pada flutter, untuk membuat check box bisa menggunakan Checkbox widget. Dan untuk Switch button menggunakan Switch Widget. Nilai atau value untuk kedua widget tersebut berupa boolean (true / false).

  ```
    // contoh checkbox
    Checkbox(
        value: true,
        onChanged: (value) {},
    ),

    // contoh Switch
    Switch(
        value: true,
        onChanged: (value) {},
    ),
  ```
- Slider widget
  
  Sesuai namanya, untuk membuat input slider pada flutter silahkan gunakan Slider Widget. Nilai pada widget ini berupa Number (double). 



### 3. Widget Button

penggunaan tombol biasanya untuk men-trigger validasi dan form itu sendiri. Contoh penggunannya yaitu dengan cara seperti ini

```
RaisedButton(
  child: Text(
    "Submit",
    style: TextStyle(color: Colors.white),
  ),
  color: Colors.blue,
  onPressed: () {
    if (_formKey.currentState.validate()) {}
  },
),
```
## Task

1. Membuat halaman dengan title di appbarnya yaitu "Contacts" dan dapat menampilkan data nama dan nomor telepon dalam bentuk list view

Screenshots : [SS home_page](screenshots/ss%20home_page_list.png)

2. menambahkan tombol yang mengarah ke halaman baru yang dimana halaman baru diberi title "Create New Contact", dan menampilkan sebuah form input nama, dan nomor telepon, dan juga ada tombol dengan nama "Submit". Disini tombol yang mengarah ke halaman baru menggunakan floating action button.

Saya membuat aplikasi flutter_contact dengan menggunakan package provider dan uuid, saya belum tau jelas dengan package provider dan uuid, tetapi dari yang saya tau yaitu state akan mengambil semua data yang diperlukan untuk membangun sebuah User Interface(UI) pada waktu tertentu dan dijalankan di memori perangkat baik itu assets, variable, font, dan yang lainnya.

Sedangkan untuk package uuid ini untuk mengenerate indetitas unique agar form lebih aman.

Jenis folder yaitu :
- components
  
  folder compenents disini yaitu berupa sebuah widget yang berisi card agar lebih mudah dalam mengatur isi dari list

- modals
  
  folder modals disini yaitu untuk menginisialisasi data pada aplikasi

- screens
  
  folder screens disini berupa user interface / tampilan yang dijalankan di aplikasi

Screenshots : [SS create_page](screenshots/ss%20create_page_telp.png)

Source Code : [SC flutter_contact](praktikum/flutter_contact/)

