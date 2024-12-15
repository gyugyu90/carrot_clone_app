import 'package:intl/intl.dart';

extension IntExtension on int {
  String withComma() {
    return NumberFormat('#,###').format(this);
  }
}
