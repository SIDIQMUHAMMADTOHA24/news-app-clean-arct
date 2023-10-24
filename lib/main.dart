import 'package:flutter/material.dart';
import 'package:news_app/common/http_ssl_pinning.dart';
import 'app.dart';
import 'package:news_app/injection.dart' as sl;

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await HttpSSLPinning.init();
  sl.init();
  runApp(const MyApp());
}
