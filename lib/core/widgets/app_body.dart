import 'package:flutter/material.dart';

import '../helpers/app_imgs.dart';
import '../helpers/app_size.dart';

class AppBody extends StatelessWidget {
  final Widget child;
  const AppBody({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          padding: EdgeInsets.symmetric(
              horizontal: AppSize.w20, vertical: AppSize.h15),
          decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage(
                    AppImages.backGround,
                  ),
                  fit: BoxFit.fill)),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            physics: const BouncingScrollPhysics(),
            child: child
          )),
    );
  }
}
