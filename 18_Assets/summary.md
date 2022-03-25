# (15) Assets

Hal yang saya pelajari dari materi ini adalah :
1. Cara menambahkan gambar dan memanggilnya
2. Cara menambahkan fonts di pubspec.yaml
3. Cara memanggil fonts dari package

## Resume
### 1. Cara menambahkan gambar di pubspec.yaml

Pertama yang harus disiapkan adalah sebuah gambar yang bisa di download di google, lalu buatlah folder assets pada directory project flutternya, setelah itu gambar yang sudah disiapkan tadi dipindahkan ke folder asset yang sudah dibuat, setelah itu masuk ke project flutter, dan cari file bernama pubspec.yaml lalu cari ke urutan yang ada bacaan seperti ini
```
flutter:
    uses-material-design: true
    assets:
        - assets/...
        - assets/...
```
setelah ditambahkan assetsnya di pubspec.yaml lalu save dengan `ctrl + save` atau bisa diketik di terminal dengan cara `flutter pub get`.


### 2. Cara menambahkan fonts di pubspec.yaml

Sama seperti gambar tadi, siapkan fonts nya terlebih dahulu, bisa di download di https://fonts.google.com/, setelah itu masuk ke file pubspec.yaml lalu cari di barisan seperti ini

```
fonts:
     - family: ...
       fonts:
         - asset: fonts/...
```
jika sudah ditambahkan lalu save, font telah berhasil ditambahkan.

### 3. Cara memanggil fonts dari package

import package di file dart project flutter, lalu ketikan seperti ini

`import 'package:google_fonts/google_fonts.dart';`

setelah itu panggilkan font yang ada dipackage tadi ke dalam code dart. ketikkan

``` 
Text(
    'Hello World',
    style : GoogleFonts.Roboto(),
),
```
dan fonts berhasil ditambahkan.
## Task
