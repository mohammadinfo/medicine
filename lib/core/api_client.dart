import "package:dio/dio.dart";

Dio dio = Dio(
  BaseOptions(
    baseUrl: 'https://alinorouzi.ir/api/',
    headers: {'Access-Control-Allow-Origin': '*'},
  ),
);
