
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/resources/font_size.dart';
import 'package:pronight_vendor/presentations/modules/auth/login/login_view_model.dart';
import 'package:provider/provider.dart';
import '../../../../../../../core/app_theme/app_colors.dart';
import '../../../../../../../core/dimens/dimens.dart';
import '../../../../../../../core/resources/app_translate.dart';
import '../../../../../../../injection.dart';
import '../../../../../../components/custom_text/custom_text.dart';


class ResendConfirmCode extends StatefulWidget {
  @override
  _ResendConfirmCodeState createState() => _ResendConfirmCodeState();

  const ResendConfirmCode({super.key, this.fontSize, required this.fromRegister});

  final bool fromRegister;
  final double? fontSize;
}

class _ResendConfirmCodeState extends State<ResendConfirmCode> {
  LoginViewModel provider =getIt();

  @override
  void initState() {
    provider.startTimer();
    super.initState();
  }

  @override
  void dispose() {
    provider.timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginViewModel>(
      builder: (context,data,_) {
        print('data>===${data.start}');
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimens.padding_16h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              if (data.start == 0)
                SizedBox(
                  child:InkWell(
                    onTap: () {
                      // Provider.of<ForgotPasswordViewModel>(context,listen: false).sendCode(true);
                    },
                    child: CustomText(
                     title:  AppTranslate.resendCode.tr(),
                      textAlign: TextAlign.center,
                      fontSize: AppFonts.font_12,
                      fontColor: AppColors.primaryColor,
                    ),
                  )
                ),
              SizedBox(
                width: Dimens.padding_8h
              ),
              if (data.start != 0)
                CustomText(
                  title:'00:${data.start.toString()}',
                  fontColor: (data.start>5)?AppColors.blackColor:AppColors.errorColor,
),

            ],
          ),
        );
      }
    );
  }
}
