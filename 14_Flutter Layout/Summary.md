# (14) Flutter Layout

Poin yang saya pelajari dari materi ini yaitu 
1. Container dan cara buatnya
2. Listview dan cara buatnya
3. Gridview dan cara buatnya

## Resume 
### 1. Container dan cara buatnya
Apa itu widget Container, Container adalah parent widget (widget induk) dalam Framework Flutter yang bisa berisikan berbagai child widget atau widget anak yang dapat mengaturnya dengan efisien melalui width, height, padding, background color, dan lain sebagainya.

widget ini digunakan untuk membungkus widget lain dan juga dapat menggunakan berbagai property untuk memodif atau memperapih tampilan, widget ini merupakan single child widget.

cara menggunakan widget ini yaitu:

```
Container(
  nama_property, 
  child: nama_widget,
)
```

### 2. ListView dan cara buatnya
ListView dalam flutter merupakan sebuah widget dengan kemampuan multi child widget yaitu widget yang bisa menampung banyak widget, akan tetapi di listview ini menmpikan widget dalam bentuk list yaitu menampilkan data dalam bentuk tersusun, yang juga membuat tampilannya dapat di scroll. widget ini digunakan biasanya untuk menampilkan sebuah data yang sama jenisnya.

penggunannya bisa dengan code dibawah ini :

```
ListView(
  children<widget>[
  nama_widget, 
  nama_widget, 
  ...,
 ]
),
```
### 3. GridView dan cara buatnya
GridView sama dengan ListView yaitu sama - sama menerima widget banyak, dalam bentuk list juga. Bedanya disini berupa tampilan list tetapi berbentuk kotak-kotak, jika dalam sebuah list hanya bisa menampung satu item per row atau baris namun tidak pada list dalam bentuk GridView ini, ia dapat diatur jumlah column dalam suatu baris sesuai dengan yang kita inginkan.

Cara buatnya yaitu :

```
GridView.builder(
  itemCount : jumlah_item_list, 
  itemBuilder : nama_widget,
)
```

## Task
