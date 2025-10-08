bool isInDateRange(DateTime start, DateTime end) {
  DateTime now = DateTime.now().toLocal();
  return now.isAfter(start) && now.isBefore(end);
}