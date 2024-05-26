import 'package:dartz/dartz.dart';
import 'package:github_app/features/home/data/model/git_repositories.dart';

import '../../../../core/networking/app_exceptions.dart';

abstract class GitRepositoriesRepository {
  Future<Either<Failure, List<GitRepositoriesData>>> getAllRepositories();
}