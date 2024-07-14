import 'package:flutter/material.dart';
import 'package:mbank_app/app_view.dart';
import 'package:mbank_app/provider/provider.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider(
      create: (context) => MyDataProvider(), child: const MyApp()));
}

