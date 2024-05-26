import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:github_app/core/helpers/app_size.dart';
import 'package:github_app/core/helpers/app_strings.dart';
import 'package:github_app/core/helpers/cubit/app_cubit.dart';
import 'package:github_app/core/helpers/cubit/app_state.dart';
import 'package:github_app/core/helpers/extentions.dart';
import 'package:github_app/core/theme/app_colors.dart';
import 'package:github_app/core/widgets/app_body.dart';
import 'package:github_app/core/widgets/app_loading_indicator.dart';
import 'package:github_app/core/widgets/app_text.dart';
import 'package:github_app/features/home/logic/cubit/git_repositories_cubit.dart';

import '../../../core/helpers/app_imgs.dart';
import 'components/home_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GitRepositoriesCubit>().stream.listen((state) {
      if (mounted) {
        if (state is GetAllRepositoriesSuccess) {
          context.read<GitRepositoriesCubit>().searchData = state.data;
          context.read<GitRepositoriesCubit>().data = state.data;
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => AppCubit(),
  child: BlocSelector<AppCubit, AppState, bool>(
    selector: (state) =>state.searchSelected,
  builder: (context, state) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Visibility(
          visible: state == true,
          replacement:  AppText(
            text: AppStrings.gitHubRepo,
            textSize: 20.sp,
            textWeight: FontWeight.w500,
            textAlign: TextAlign.center,
          ),
          child: TextField(
            cursorColor: AppColors.mainColor,
            decoration: InputDecoration(
                hintText: AppStrings.search
            ),
            onChanged: (val){
              setState(() {
                context.read<GitRepositoriesCubit>().searchData = context.read<GitRepositoriesCubit>().data!
                    .where((element) =>
                    element.name!.contains(val.toLowerCase()))
                    .toList();
              });
            },
          ),
        ),
        leading: SvgPicture.asset(
          AppIcons.filterIcon,
          fit: BoxFit.contain,
        ).addSymmetricPadding(hVal: AppSize.w17),
        actions: [
          InkWell(
            onTap: () =>context.read<AppCubit>().changeSelectedSearch(),
            child: SvgPicture.asset(
              AppIcons.searchIcon,
              fit: BoxFit.contain,
            ).addSymmetricPadding(hVal: AppSize.w12),
          )
        ],
      ),
      body: BlocBuilder<GitRepositoriesCubit, GitRepositoriesState>(
        builder: (context, state) {
          var data = context.read<GitRepositoriesCubit>().searchData;
          if(state is! GetAllRepositoriesLoading && data != null){
            return AppBody(
              child: Container(
                padding: EdgeInsets.only(left: AppSize.w20,top: AppSize.h20,bottom: AppSize.h20,right: AppSize.w2),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12.r)),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) => HomeItem(data: data, index: index),
                  separatorBuilder: (context, index) =>
                      const Divider(thickness: 2).addSymmetricPadding(vVal: AppSize.h10),
                ),
              ),
            );
          }
          return const AppLoadingIndicator();
        },
      ),
    );
  },
),
);
  }
}