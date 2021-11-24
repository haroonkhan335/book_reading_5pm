import 'package:book_reading/app/book_reading.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  runApp(const BookReading());

  await SharedPreferences.getInstance()
    ..clear();
}
