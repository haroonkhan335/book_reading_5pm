import 'package:book_reading/app/book_reading.dart';
import 'package:book_reading/providers/book_provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => BookProvider(),
      child: const BookReading()));
}
