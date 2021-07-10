import 'package:dev_stat/app/base_view.dart';
import 'package:dev_stat/app/base_viewmodel/base_viewmodel.dart';
import 'package:dev_stat/app/consts/app_colors.dart';
import 'package:dev_stat/ui/screens/home/home_screen_viewmodel.dart';
import 'package:dev_stat/ui/widgets/buttons.dart';
import 'package:dev_stat/ui/widgets/underline_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // gitUserUseCase.getGitUser('xheghun');
    return Consumer<HomeScreenViewModel>(
        // stream: null,
        builder: (context, model, child) {
      return BaseView(
        backgroundColor: AppColors.deepBlue,
        showLoading: model.state == ViewState.Busy,
        body: Center(
          // dev status
          // child: DevStatus(),
          child: CheckStatus(model: model),
        ),
      );
    });
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
          Text(
            'Developer Status',
            style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white),
          ),

          SizedBox(
            height: 10.h,
          ),

          // check
          UnderlinedText(
            text: 'Check',
          ),

          SizedBox(
            height: 4.h,
          ),

          // enter username
          Container(
            width: double.infinity,
            height: 7.h,
            color: Colors.white,
          ),

          SizedBox(
            height: 3.h,
          ),

          // check status button
          Button.flatterButton(
              onTap: () async {
                model.gitDevData(context);
              },
              load: model.isBusy()),
        ],
      ),
    );
  }
}
