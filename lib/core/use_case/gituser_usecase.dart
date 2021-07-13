import 'package:dartz/dartz.dart';
import 'package:dev_stat/core/data/remote/git_user_remote_datasource.dart';
import 'package:dev_stat/core/models/git_profile_model.dart';

abstract class GitUserUseCase {
  Future<Either<String, GitProfileModel>> gitUser(String usr);
}

class GitUserUseCaseImpl extends GitUserUseCase {
  final GitUserRemoteDataSourceImpl gitUserRemoteDataSourceImpl =
      GitUserRemoteDataSourceImpl();

  @override
  Future<Either<String, GitProfileModel>> gitUser(String usr) async {
    try {
      var data = await gitUserRemoteDataSourceImpl.getGitUser(usr);
      return Right(GitProfileModel.fromJson(data.body));
    } on Exception catch (e) {
      return Left(e.toString());
    }
  }
}
