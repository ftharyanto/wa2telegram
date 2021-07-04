import 'package:flutter/material.dart';
import 'package:wa2telegram/locator.dart';
import 'views/layout_template/layout_template.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Whatsapp Markdown to Telegram Markdown',
      home: LayoutTemplate(),
    );
  }
}
