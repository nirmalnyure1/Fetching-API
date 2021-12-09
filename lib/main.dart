import 'package:all_about_api/Screen/homepage_screen.dart';
import 'package:all_about_api/State/homepage_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => HomePageState())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomePageScreen(),
      ),
    );
  }
}
