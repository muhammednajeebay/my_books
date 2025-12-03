import 'package:flutter/material.dart';

/// Centralized navigation routes for the app
class AppRoutes {
  static Future<dynamic> navigateTo(BuildContext context, Widget widget) async {
    return Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => widget));
  }
}

