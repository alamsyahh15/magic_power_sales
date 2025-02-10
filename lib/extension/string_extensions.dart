import 'package:intl/intl.dart';
import 'package:magic_power_sales/config/config.dart';

extension StringExtensions on String {
  String capitalize() {
    try {
      return '${this[0].toUpperCase()}${substring(1)}';
    } catch (e) {
      return this;
    }
  }

  String firstName() {
    return split(" ")[0];
  }

  String formatDate({bool plainDate = false, bool withTime = false}) {
    if (isEmpty(this)) return "";
    try {
      final DateTime date = DateTime.parse(this).toLocal();
      final DateTime currentDate = DateTime.now();
      String result = "";
      if ((currentDate.difference(date).inDays < 30) && !plainDate) {
        final int daysDifference = currentDate.difference(date).inDays;
        result = daysDifference == 0
            ? 'Hari ini'
            : daysDifference == 1
                ? 'Kemarin'
                : '$daysDifference hari yang lalu';
      } else {
        final DateFormat defaultFormatter = DateFormat('dd MMM yyyy');
        result = defaultFormatter.format(date);
      }
      if (withTime) {
        String time = DateFormat("hh:mm").format(date);
        result = "$result, $time";
      }
      return result;
    } catch (e) {
      return this; // return the original string if parsing fails
    }
  }

  String formatMoney() {
    final int value = int.parse(replaceAll(',', '').replaceAll('.', ''));
    final formatted = NumberFormat('#,###').format(value).replaceAll(',', '.');
    return 'Rp $formatted';
  }

  String formatDateDueDate() {
    if (this == "null") {
      return "Telah melewati jatuh tempo";
    } else {
      DateTime date = DateTime.parse(this);
      DateTime currentDate = DateTime.now();
      currentDate =
          DateTime(currentDate.year, currentDate.month, currentDate.day);
      final diffInDays = date.difference(currentDate).inDays;
      return diffInDays < 0
          ? "Telah melewati jatuh tempo"
          : diffInDays == 0
              ? "Hari ini jatuh tempo"
              : "$diffInDays hari hingga jatuh tempo";
    }
  }

  String numberFormat() {
    if (this != "null" && isNotEmpty) {
      int number = int.parse(this);
      return NumberFormat.currency(
        locale: 'id_ID',
        decimalDigits: 0,
        symbol: 'Rp ',
      ).format(number);
    }

    return "Rp 0";
  }

  String thousandFormater() {
    if (this != "null" && isNotEmpty) {
      int number = int.parse(this);
      return NumberFormat.currency(
        locale: 'id_ID',
        decimalDigits: 0,
        symbol: '',
      ).format(number);
    }

    return "0";
  }
}
