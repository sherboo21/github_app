part of 'git_repositories_cubit.dart';

@immutable
abstract class GitRepositoriesState extends Equatable{
  const GitRepositoriesState();
  @override
  List<Object?> get props => [];
}

class GitRepositoriesInitial extends GitRepositoriesState {}

/// get all repositories states ///

class GetAllRepositoriesSuccess extends GitRepositoriesState {
  final List<GitRepositoriesData> data;

  const GetAllRepositoriesSuccess(this.data);
  @override
  List<Object?> get props => [data];
}

class GetAllRepositoriesLoading extends GitRepositoriesState {}

class GetAllRepositoriesError extends GitRepositoriesState {
  final Failure messageError;

  const GetAllRepositoriesError({required this.messageError});

  @override
  List<Object?> get props => [messageError];
}