import 'package:flutter/material.dart';

import 'package:dev_stat/app/base_viewmodel/base_viewmodel.dart';
import 'package:dev_stat/core/use_case/gituser_usecase.dart';
import 'package:dev_stat/ui/screens/dev_info/dev_info_screen.dart';

class HomeScreenViewModel extends BaseViewModel {
  GitUserUseCaseImpl gitUserUseCaseImpl = GitUserUseCaseImpl();

  TextEditingController usernameController = TextEditingController();

  bool _showUser = false;

  bool get displayUser => _showUser;

  void validateInput(BuildContext context) {
    if (usernameController.text.trim().isEmpty) {
      print('Empty text field');
    } else
      gitDevData(context);
  }

  void gitDevData(BuildContext context) async {
    changeState(ViewState.Busy);

    var result = await gitUserUseCaseImpl.gitUser(
      usernameController.text.trim(),
    );

    changeState(ViewState.Idle);
    result.fold((error) {
      // on error display error on screen
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
