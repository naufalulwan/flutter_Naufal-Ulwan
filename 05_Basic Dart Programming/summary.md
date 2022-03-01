# (5) Basic Dart Programming

## Resume

Poin yang saya pelajari dari materi ini adalah
1. Fungsi main.
2. Komentar, variabel, tipe data, dan operator.
3. Fungsi(Lanjutan), Async-Await, Tipe data future, Collection

### 💡 Fungsi main
- Batgian yang dijalankan pertama kali
- Dapat memiliki tipe data void atau int
- Memiliki nama <b>main</b>

Contoh : 
``` dart
Void main(){
    Print('Selamat datang dibahasa pemrograman dart!');
}
```
### 💡 Komentar, variabel, tipe data, dan operator.

1. Komentar 
   
   Baris kode yang tidak dijalankan dengan tujuan untuk memberikan catatan pada kode, dan mencegah perintah dijalankan. Contoh :
   ``` dart
    void main(){
        // ini merupakan komentar
        // garis miring 2x atau bisa juga menggunakan
        /*
        komentar seperti ini, komentar seperti ini digunakan  jika komentar dengan line banyak
        */
    }
   ```

2. Variabel
   
   Variabel digunakan untuk menyimpan suatu data yang memiliki nama, dan sebuah tipe data dan nilainya dapat berubah. Contoh :
   ``` dart
   void main(){
       var nama = "Naufal Ulwan"; // ini merupakan variabel yang diberi suatu nilai dengan tipe data default string
       print(nama); // print digunakan untuk menampilkan hasil
   }
   ```

3. Tipe data
   
   Tipe data adalah sebuah pengklasifikasian data berdasarkan jenis data tersebut yang dapat dikelola. Tipe data dibutuhkan agar kompiler dapat mengetahui bagaimana sebuah data akan digunakan. Jenis - jenisnya :
   * int = bilangan bulat
   * double = bilangan pecahan
   * bool = true/false
   * string = teks
    
    Contoh :
    ``` dart
    void main(){
        int usia = 20;
        double beratBadan = 69.5;
        bool laki = true;
        String nama = "Naufal Ulwan";
    }
    ```

4. Operator
   
   Digunakan untuk operasi pengelolaan data. data yang dikelola disebut operand. Contoh :
   ``` javascript
       // Arithmatica
       +, -, *, /, %
       // Assigment 
       =, +=, -=, *=, /=, %=
       // Comparison
       ==, <, <=, >, >=
       // logical
       &&, ||, !
   ```

### 💡 Fungsi(Lanjutan), Async-Await, Tipe data future, Collection
1. Fungsi(Lanjutan)
   - Anonymouse Function
        ``` dart
        var hello = () {
            print('hello');
        };

        var jumlah = (int a, int b) {
            return a + b;
        };

        void main() {
            hello();
            print(jumlah(1, 2));
        }
        ```
   - Arrow Function
        ``` dart
        var hello = () => print('Hello');

        var jumlah = (int a, int b) => a + b;

        void main() {
            hello();
            print(jumlah(1, 2));
        }
        ```
2. Async-Await
    ``` dart
    void p1() {
    Future.delayed(Duration(seconds: 1), () {
        print('Hello dari p1');
    });
    }

    void p2() {
    print('Hello dari p2');
    }

    void main() {
    p1();
    p2();
    }   
    ```
    ``` dart
    Future<void> p1() async => await Future.delayed(Duration(seconds: 2), () {
        print('Hello dari p1');
        });

    void p2() => print('Hello dari p2');

    void main() async {
    await p1();
    p2();
    }
    ```
3. Tipe data future
    ``` dart
    Future<String> data1() =>
        Future.delayed(Duration(seconds: 1), () => 'Hallo dari data1');

    void main() async {
    var i = await data1();
    print(i);
    }
    ```
4. Collection
   - List
       ``` dart
       void main() {
           var scores = [4, 1, 8, 2, 5];
           for (var score in scores) {
               print(score);
           }
       }
       ``` 
   - Map
       ``` dart
       void main() {
           var student = {
               'name': 'Naufal Ulwan',
               'age': 12,
           };
           for (var key in student.keys) {
               print(student[key]);
           }
       }
       ```
## Task
1. Membuat luas lingkaran

    ``` dart
    void main(List<String> args) {
        double pi = 3.14;
        int r = 10;
        // Luas lingkaran
        var luas = pi * r * r;
        print(luas);
    }
    ```
    atau bisa ke file berikut : 
    [luas_lingkaran.dart](praktikum/luas_lingkaran.dart)

    Hasil : 

    ![luas_lingkaran](screenshots/hasil%20code%20luas_lingkaran.png)
    ![luas_lingkaran2](screenshots/hasil%20code%20luas_lingkaran2.png)

2. Membuat 3 buah variabel yang berisi string, lalu sambungkan string tersebut

    ``` dart
    void main(List<String> args) {
        var subjek = "Kakak";
        var predikat = " menanam";
        var objek = " tanaman";

        print(subjek + predikat + objek);
    }
    ```

    atau bisa ke file berikut :
    [variabel.dart](praktikum/Variabel.dart)

    Hasil :
    
    ![variabel](screenshots/Hasil%20code%20variabel.png) 