// import 'package:dartz/dartz.dart';
import 'package:dartz/dartz.dart';
import 'package:dev_stat/core/data/remote/git_user_remote_datasource.dart';
import 'package:dev_stat/core/models/git_profile_model.dart';
// import 'package:http/http.dart' as http;

abstract class GitUserUseCase {
  Future<Either<String, GitProfileModel>> gitUser(String usr);
}

class GitUserUseCaseImpl extends GitUserUseCase {
  final GitUserRemoteDataSourceImpl gitUserRemoteDataSourceImpl =
      GitUserRemoteDataSourceImpl();

  // GitUserUseCaseImpl({required this.gitUserRemoteDataSourceImpl});

  @override
  Future<Either<String, GitProfileModel>> gitUser(String usr) async {
    try {
      var data = await gitUserRemoteDataSourceImpl.getGitUser(usr);
      // print(data.body);
      // if (data.statusCode == 200)
      return Right(GitProfileModel.fromJson(data.body));
      // else
      // throw Exception('Status is 400');
    } on Exception catch (e) {
      return Left(e.toString());
      // print(e);
      // return Right(e.toString());
    }
  }
}
