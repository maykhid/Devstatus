import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dev_stat/core/services/connectivity/network_connectivity.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'package:dev_stat/ui/screens/home/home_screen.dart';
import 'package:dev_stat/ui/screens/home/home_screen_viewmodel.dart';

class DevStatusApp extends StatelessWidget {
  final Connectivity _connectivity = Connectivity();
  @override
  Widget build(BuildContext context) {
    // GitUserUseCaseImpl gitUserUseCaseImpl;
    return Sizer(builder: (context, _, __) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => HomeScreenViewModel(),
            // child:
          ),
          ChangeNotifierProvider.value(
            value: NetworkConnectivity.instance(_connectivity),
          ),
        ],
        builder: (context, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomeScreen(),
          );
        },
      );
    });
  }
}
