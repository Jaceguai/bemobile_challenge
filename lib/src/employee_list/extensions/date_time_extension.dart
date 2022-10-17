import 'package:intl/intl.dart';

extension DateTimeExtension on String {
  String get getFormattedDat {
    final date = DateTime.parse(this);
    final formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(date);
  }
}
