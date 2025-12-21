class DateFormart {
  String formatDate({required String dateString}) {
    final date = DateTime.parse(dateString);
    return "${date.day}/${date.month}/${date.year}";
  }
}
