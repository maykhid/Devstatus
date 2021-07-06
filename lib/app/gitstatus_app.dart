import 'package:dev_stat/ui/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class GitStatusApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, _, __) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      );
    });
  }
}
