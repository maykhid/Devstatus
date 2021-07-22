import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dev_stat/core/services/connectivity/network_connectivity.dart';
import 'package:flutter/material.dart';

import 'package:dev_stat/app/base_viewmodel/base_viewmodel.dart';
import 'package:dev_stat/core/use_case/gituser_usecase.dart';
import 'package:dev_stat/ui/screens/dev_info/dev_info_screen.dart';

class HomeScreenViewModel extends BaseViewModel {
  GitUserUseCaseImpl gitUserUseCaseImpl = GitUserUseCaseImpl();

  TextEditingController usernameController = TextEditingController();

  bool _displayMessanger = false;

  bool get displayMessanger => _displayMessanger;

  String _message = '';

  String get message => _message;

  _changeMessanger(bool displayMessager, String message) {
    _displayMessanger = displayMessager;
    _message = message;
    notifyListeners();
    print('New message $_message $_displayMessanger');
  }

  void validateInput(BuildContext context, NetworkConnectivity model) {
    if (usernameController.text.trim().isEmpty) {
      _changeMessanger(true, 'Please input a GitHub handle!');
    } else if (model.status == ConnectivityResult.none) {
      _changeMessanger(true, 'Please connect to the internet and try again!');
    } else {
      if (_displayMessanger) {
        _displayMessanger = false;
        notifyListeners();
      }
      gitDevData(context);
    }
  }

  void gitDevData(BuildContext context) async {
    changeState(ViewState.Busy);

    var result = await gitUserUseCaseImpl.gitUser(
      usernameController.text.trim(),
    );

    changeState(ViewState.Idle);
    result.fold((error) {
      // on error display error on screen
      _changeMessanger(true, 'User not found!');
    }, (data) {
      // on receiving data transition to next screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => DevInfo(data: data),
        ),
      );
    });
  }
}
