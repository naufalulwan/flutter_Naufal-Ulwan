import 'class_fpb.dart';
import 'class_kpk.dart';

class Matematika
    implements KelipatanPersekutuanTerkecil, FaktorPersekutuanTerbesar {
  @override
  Matematika({this.x2 = 0, this.y2 = 0});
  int x2, y2;
  int get x => x2;
  int get y => y2;

  set x(int _x) => _x = x;
  set y(int _y) => _y = y;

  hasil() {
    int z = x2 * y2;
    do {
      int bil = x2 % y2;
      x2 = y2;
      y2 = bil;
    } while (y2 != 0);

    int fpb = x2;
    double kpk = z / fpb;

    return "KPK = ${kpk.toInt()}\nFPB = ${fpb}";
  }
}
