import 'package:get_it/get_it.dart';
import 'package:github_app/core/networking/git_repositories_services.dart';
import 'package:github_app/features/home/data/repository/git_repositories.dart';
import 'package:github_app/features/home/logic/cubit/git_repositories_cubit.dart';

import '../networking/dio.dart';


final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  /// FOR DIO HELPER ///
  await DioHelper.init();
  getIt.registerLazySingleton<DioHelper>(() => DioHelper());

  /// FOR repositories ///
  getIt.registerLazySingleton<GitRepositoriesRepository>(() => GitRepositoriesServices());
  getIt.registerFactory<GitRepositoriesCubit>(() => GitRepositoriesCubit(getIt()));

}
