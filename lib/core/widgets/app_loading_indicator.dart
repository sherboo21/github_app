import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../theme/app_colors.dart';

class AppLoadingIndicator extends StatelessWidget {
  final Color? color;

  const AppLoadingIndicator({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (Platform.isAndroid)
          Center(
            child: SpinKitThreeBounce(
              color: color ?? AppColors.mainColor,
              size: 25.r,
            ),
          ),
        if (Platform.isIOS)
          Center(
            child: CupertinoActivityIndicator(
              radius: 12.5.r,
              color: color ?? AppColors.mainColor,
            ),
          )
      ],
    );
  }
}
