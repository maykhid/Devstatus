import 'package:dartz/dartz.dart';
import 'package:dev_stat/app/base_viewmodel/base_viewmodel.dart';
import 'package:dev_stat/core/models/git_profile_model.dart';
import 'package:dev_stat/core/use_case/gituser_usecase.dart';
import 'package:dev_stat/ui/screens/dev_info/dev_info_screen.dart';
import 'package:flutter/material.dart';

class HomeScreenViewModel extends BaseViewModel {
  GitUserUseCaseImpl gitUserUseCaseImpl = GitUserUseCaseImpl();

  // HomeScreenViewModel({required this.gitUserUseCaseImpl});
  bool _showUser = false;

  bool get displayUser => _showUser;

  // void changeDisplayUserStatus(bool display) {
  //   _showUser = display;
  //   notifyListeners();
  // return displayUser = false;
  // }

  void gitDevData(BuildContext context) async {
    changeState(ViewState.Busy);

    var result = await gitUserUseCaseImpl.gitUser('Maykhid');
    changeState(ViewState.Idle);
    result.fold((error) {
      // on error display error on screen
    }, (data) {
      // on receiving data transition to next screen
      Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => DevInfo(data: data),
        ),
      );
    });
  }

  // shouldPrint() async {
  //   try {
  //     GitProfileModel getNewData = await _gitDevData();
  //     print(getNewData.name);
  //     // changeDisplayUserStatus(true);
  //     return getNewData;
  //   } catch (e) {
  //     print('the main $e');
  //   }
  // }
}
