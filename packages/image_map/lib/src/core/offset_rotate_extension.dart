import 'dart:math';
import 'dart:ui';

extension OffsetRotateExtension on Offset {
  Offset rotate(double angle, {Offset? origin}) {
    var sinAngle = sin(angle);
    var cosAngle = cos(angle);

    var res = this;
    if (origin != null) {
      res -= origin;
    }
    res = Offset(res.dx * cosAngle - res.dy * sinAngle,
        res.dx * sinAngle + res.dy * cosAngle);

    if (origin != null) {
      res += origin;
    }
    return res;
  }
}
