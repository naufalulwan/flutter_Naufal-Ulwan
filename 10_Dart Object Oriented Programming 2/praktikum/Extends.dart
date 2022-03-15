class BangunRuang {
  BangunRuang({this.panjang = 0, this.lebar = 0, this.tinggi = 0});
  int panjang;
  int lebar;
  int tinggi;

  volume() {
    var rumus = panjang * lebar * tinggi;
    return rumus;
  }
}

class Balok extends BangunRuang {
  @override
  volume() {
    return super.volume();
  }
}

class Kubus extends BangunRuang {
  Kubus(this.sisi);
  int sisi;
  @override
  volume() {
    var rumus = sisi * sisi * sisi;
    return rumus;
  }
}

void main() {
  BangunRuang balok = Balok();
  balok.panjang = 10;
  balok.lebar = 5;
  balok.tinggi = 4;
  print("Hasil volume balok : ${balok.volume()}");

  int sisi = 10;
  BangunRuang kubus = Kubus(sisi);
  print("Hasil volume kubus : ${kubus.volume()}");
}
