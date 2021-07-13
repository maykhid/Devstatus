import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'package:dev_stat/ui/screens/home/home_screen.dart';
import 'package:dev_stat/ui/screens/home/home_screen_viewmodel.dart';

class GitStatusApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // GitUserUseCaseImpl gitUserUseCaseImpl;
    return Sizer(builder: (context, _, __) {
      return ChangeNotifierProvider(
        create: (_) => HomeScreenViewModel(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
        ),
      );
    });
  }
}
