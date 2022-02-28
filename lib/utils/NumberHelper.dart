import 'package:intl/intl.dart';

num convertToNum({required String value}) {
  num? val = double.tryParse(value);
  if (val! % 1 == 0) {
    val = val.toInt();
  } else {
    val = double.tryParse(val.toStringAsFixed(val.truncateToDouble() == val ? 0 : 2));
  }
  return val!;
}

var formatter = NumberFormat('###,000');
