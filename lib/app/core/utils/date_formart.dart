import 'package:intl/intl.dart';

class DateFormart {
  final DateFormat _fmt = DateFormat('dd/MM/yyyy HH:mm');

  String formatDate({required String dateString}) {
    final date = DateTime.parse(dateString).toLocal();
    return _fmt.format(date);
  }
}
