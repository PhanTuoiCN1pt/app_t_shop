import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class THelperFunctions {
  static Color? getColor(String value) {
    switch (value) {
      case 'Xanh lá':
        return Colors.green;
      case 'Xanh dương':
      case 'Xanh':
        return Colors.blue;
      case 'Xanh biển':
        return Colors.cyan;
      case 'Xanh ngọc':
        return Colors.teal;
      case 'Xanh rêu':
        return Color(0xFF3B5323);
      case 'Xanh đậm':
        return Colors.indigo;
      case 'Xanh nhạt':
      case 'Xanh sáng':
        return Colors.lightGreen;
      case 'Xanh da trời':
        return Colors.lightBlue;
      case 'Xanh nước biển':
        return Colors.blueAccent;

      case 'Đỏ':
        return Colors.red;
      case 'Hồng':
      case 'Hổng':
        return Colors.pink;
      case 'Tím':
        return Colors.purple;
      case 'Đen':
        return Colors.black;
      case 'Trắng':
        return Colors.white;
      case 'Xám':
        return Colors.grey;
      case 'Bạc':
        return Color(0xFFC0C0C0);
      case 'Be':
        return Color(0xFFF5F5DC);
      case 'Kem':
        return Color(0xFFFFFDD0);

      case 'Vàng':
        return Colors.yellow;
      case 'Vàng đồng':
        return Color(0xFFDAA520);
      case 'Cam':
        return Colors.deepOrange;
      case 'Cam đất':
        return Color(0xFFCC6600);
      case 'Nâu':
        return Colors.brown;
      case 'Nâu đất':
        return Color(0xFF8B4513); // SaddleBrown

      default:
        return null;
    }
  }

  static String formatNumber(double value) {
    final formatter = NumberFormat('#,###'); // dùng dấu chấm
    return formatter.format(value);
  }




  static void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  static void showAlert(String title, String message) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }



  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  static String getFormattedDate(DateTime date, {String format = 'dd/MM/yyyy'}) {
    return DateFormat(format).format(date);
  }

  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(i, i + rowSize > widgets.length ? widgets.length : i + rowSize);
      wrappedList.add(Row(children: rowChildren));
    }
    return wrappedList;
  }
}
