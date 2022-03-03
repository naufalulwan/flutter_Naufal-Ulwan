# (7) Advance Function, Async-Await


Poin yang saya pelajari dari materi ini adalah
1. Fungsi(Lanjutan)
2. Async-Await, Tipe data future
3. Collection

## Resume

### 💡 Fungsi(Lanjutan), Async-Await, Tipe data future, Collection
#### 1. Fungsi(Lanjutan)

Fungsi/ function adalah pemetaan dari nol atau lebih parameter masukan ke nol atau lebih parameter keluaran.

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
#### 2. Async-Await

Async-Await atau istilah Asynchronous merupakan proses yang eksekusinya tidak harus sesuai urutan tapi berdasarkan waktu proses.

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
#### 3. Tipe data future

Future digunakan dalam penggunaan asynchronous programming.

``` dart
Future<String> data1() =>
    Future.delayed(Duration(seconds: 1), () => 'Hallo dari data1');

void main() async {
  var i = await data1();
  print(i);
}
```
#### 4. Collection

Dart, tidak seperti bahasa pemrograman lainnya, tidak mendukung array. Collection Dart dapat digunakan untuk mereplikasi struktur data seperti array. 

disini yang saya pahami hanya ada dua tipe data Collection yaitu :

- List

    List jika pada bahasa pemrograman lain disebut array, jadi dalam pemrograman dart list itu merupakan kumpulan untuk menyimpan lebih dari satu nilai atau banyak nilai dalam variable.

    ``` dart
    void main() {
        var scores = [4, 1, 8, 2, 5];
        for (var score in scores) {
            print(score);
        }
    }
    ``` 
- Map

    objek koleksi yang setiap elemennya berupa pasangan kunci (key) dan nilai (value). 

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

Soal :

  1. Buatlah sebuah fungsi dengan spesifikasi berikut : 

      - Menerima 2 parameter, yaitu list data dan pengali
        ``` dart
        listKali(List list_data, int pengali) async {}
        ```
      - Lakukan perulangan pada list data secara asyncronous
        ``` dart
        listKali(List list_data, int pengali) async {
            List new_data = [];

            for (var item in list_data) {
                int temp_num = await pengalian(item, pengali);
                new_data.add(temp_num);
            }
        }
        ```
      - Tiap perulangan, kalikan elemen list data denga pengali
        ``` dart
        
        listKali(List list_data, int pengali) async {
            List new_data = [];

            for (var item in list_data) {
                int temp_num = await pengalian(item, pengali);
                new_data.add(temp_num);
            }
        }
        pengalian(int _item, int _pengali) {
            return _item * _pengali;
        }
        ```
      - Return list baru yang berisi hasil proses di atas
        ``` dart
        void main() async {
            List list_input = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
            int pengali_input = 3;
            var result = await listKali(list_input, pengali_input);
            print(result);
        }

        listKali(List list_data, int pengali) async {
            List new_data = [];

            for (var item in list_data) {
                int temp_num = await pengalian(item, pengali);
                new_data.add(temp_num);
            }
            return new_data;
        }

        pengalian(int _item, int _pengali) {
            return _item * _pengali;
        }

        ```
  2. Buatlah list dengan spesifikasi berikut :

     - Tiap elementnya berupa list juga
        ``` dart
        void main() {
            List array = [
                []
            ];
        }
        ``` 
     - Tiap element wajib terdapat 2 data (sub-element)
        ``` dart
         void main() {
            List array = [
                [1, 2],
                [3, 4]
            ];
        }
        ```
      Buatlah sebuah Map dengan menggunakan list tersebut!
      ``` dart
        void main() {
            List array = [
                [1, 2],
                [3, 4]
            ];
            Map mapArray = {'data1': array[0], 'data2': array[1]};
            print(mapArray['data2']);
        }

      ```