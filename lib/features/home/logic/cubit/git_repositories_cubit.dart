import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_app/features/home/data/model/git_repositories.dart';
import 'package:github_app/features/home/data/repository/git_repositories.dart';

import '../../../../core/networking/app_exceptions.dart';

part 'git_repositories_state.dart';

class GitRepositoriesCubit extends Cubit<GitRepositoriesState> {
  final GitRepositoriesRepository _gitRepositoriesRepository;
  GitRepositoriesCubit(this._gitRepositoriesRepository) : super(GitRepositoriesInitial());
  List<GitRepositoriesData> ? searchData ;
  List<GitRepositoriesData> ? data ;
  /// FOR ALL repositories ///

  void getAllRepositories() async {
    emit(GetAllRepositoriesLoading());
    final result = await _gitRepositoriesRepository.getAllRepositories();
    result.fold(
          (error) => emit(GetAllRepositoriesError(messageError: error)),
          (data) => emit(GetAllRepositoriesSuccess(data)),
    );
  }
}
