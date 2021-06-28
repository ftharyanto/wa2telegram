import 'package:flutter/material.dart';
import 'package:wa2telegram/views/home/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Whatsapp Markdown to Telegram Markdown',
      home: HomeView(),
    );
  }
}
