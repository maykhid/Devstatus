import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'package:dev_stat/app/base_view.dart';
import 'package:dev_stat/app/base_viewmodel/base_viewmodel.dart';
import 'package:dev_stat/app/consts/app_colors.dart';
import 'package:dev_stat/ui/screens/home/home_screen_viewmodel.dart';
import 'package:dev_stat/ui/widgets/buttons.dart';
import 'package:dev_stat/ui/widgets/container_text_field.dart';
import 'package:dev_stat/ui/widgets/underline_text.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenViewModel>(
      builder: (context, model, _) {
        return BaseView(
          backgroundColor: AppColors.deepBlue,
          showLoading: model.state == ViewState.Busy,
          body: Center(
            child: CheckStatus(model: model),
          ),
        );
      },
    );
  }
}

class CheckStatus extends StatelessWidget {
  final HomeScreenViewModel model;

  CheckStatus({required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      width: 100.w,
      height: 50.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // dev status
          buildDevStatusText(),

          SizedBox(
            height: 10.h,
          ),

          // check text
          buildUnderlinedText(),

          SizedBox(
            height: 4.h,
          ),

          // enter username
          buildTextFormField(),

          SizedBox(
            height: 3.h,
          ),

          // check status button
          Button.flatterButton(
            onTap: () async {
              model.validateInput(context);
            },
            isLoading: model.isBusy(),
          ),
        ],
      ),
    );
  }

  ContainerTextFormField buildTextFormField() {
    return ContainerTextFormField(
      controller: model.usernameController,
      hintText: 'Enter GitHub Username',
    );
  }

  UnderlinedText buildUnderlinedText() {
    return UnderlinedText(
      text: 'Check',
    );
  }

  Text buildDevStatusText() {
    return Text(
      'Developer Status',
      style: TextStyle(
          fontSize: 25.sp, fontWeight: FontWeight.w700, color: Colors.white),
    );
  }
}
