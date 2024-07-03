import 'package:flutter/material.dart';

abstract class Constants {
  static const primaryColor = Color(0xff100B20);
  static const transtionDuration = Duration(milliseconds: 250);
  static const gtSectraFineFont = 'GT Sectra Fine';

  static const String baseUrl = 'https://www.googleapis.com/books/v1/';
  static const String featuredBooksEndPiont =
      'volumes?Filtering=free-ebooks&q=subject:programming';
  static const String newestBooksEndPiont =
      'volumes?Filtering=free-ebooks&q=computer scince&Sorting=newest';

  static const String featuredBox = 'featuredBox';
  static const String newestBox = 'newestBox';
  static const String similarBox = 'similarBox';
}
