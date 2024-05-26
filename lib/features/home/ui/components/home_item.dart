import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:github_app/core/helpers/extentions.dart';
import 'package:github_app/features/home/data/model/git_repositories.dart';

import '../../../../../core/helpers/app_imgs.dart';
import '../../../../../core/helpers/app_size.dart';
import '../../../../../core/helpers/app_strings.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/app_text.dart';


class HomeItem extends StatelessWidget {
  final List<GitRepositoriesData> data;
  final int index;
  const HomeItem({super.key, required this.data, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: AppSize.h10, horizontal: AppSize.w12),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r)),
              child: data[index].owner!.avatar == null ?
              null : CircleAvatar(
                radius: 22.5.r,
                backgroundColor: Colors.grey.shade50,
                backgroundImage: NetworkImage(
                  data[index].owner!.avatar!,
                ),
              ),
            ),
            AppSize.w15.pw,
            Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: '${AppStrings.name} ${data[index].name ?? ''}',
                      textWeight: FontWeight.w600,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(child: AppText(text: '${AppStrings.owner} ${data[index].owner!.login ?? ''}')),
                        Chip(
                          backgroundColor: const Color(0x295570F1),
                          label: AppText(
                            text: '12/10/2023',
                            textSize: 12.sp,
                            textAlign: TextAlign.center,
                            textColor: AppColors.mainColor,
                          ),
                        )
                      ],
                    )
                  ],
                )),
          ],
        ),
        AppSize.h5.ph,
        Row(
          children: [
            Flexible(child: AppText(
              text: '${AppStrings.mainBranch} ${data[index].owner!.nodeId ?? ''}',
              textSize: 10.sp,
              textColor: AppColors.secondaryColor,
            ),),
            AppSize.w10.pw,
            SvgPicture.asset(
              AppIcons.fileIcon,
              fit: BoxFit.contain,
            )
          ],
        )
      ],
    );
  }
}
