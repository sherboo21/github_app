import 'package:dartz/dartz.dart';
import 'package:github_app/features/home/data/model/git_repositories.dart';
import 'package:github_app/features/home/data/repository/git_repositories.dart';

import '../helpers/main_functions.dart';
import 'app_exceptions.dart';
import 'app_services.dart';

class GitRepositoriesServices extends GitRepositoriesRepository {
  @override
  Future<Either<Failure, List<GitRepositoriesData>>> getAllRepositories() async {
    return await makeApiCall<List<GitRepositoriesData>>(
      method: 'GET',
      url: AppServices.allRepositories,
      fromJson: (json) {
        List<dynamic> jsonArray = json;
        return jsonArray.map((jsonItem) => GitRepositoriesData.fromJson(jsonItem)).toList();
      },
    );
  }
}