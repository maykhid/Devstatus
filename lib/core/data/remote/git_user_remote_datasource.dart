import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class GitUserRemoteDataSource {
  //
  Future<http.Response> getGitUser(String usr);
}

class GitUserRemoteDataSourceImpl extends GitUserRemoteDataSource {
  @override
  Future<http.Response> getGitUser(String username) async {
    late final http.Response response;
    //  = await http.get(
    //     Uri.https("api.github.com", "/users/$username"),
    //     headers: <String, String>{
    //       'Accept': 'application/json',
    //       'user-agent':
    //           'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36 OPR/38.0.2220.41',
    //     },
    //   );
    try {
      response = await http.get(
        Uri.https("api.github.com", "/users/$username"),
        headers: <String, String>{
          'Accept': 'application/json',
          'user-agent':
              'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36 OPR/38.0.2220.41',
        },
      );
      // print(response.body);
      if (response.statusCode != 200) throw Exception('error message');

      return response;
    } catch (e) {
      String message = "An error occured";
      if (response.statusCode != 200)
        message = json.decode(response.body)['message'];
      throw Exception(message);
    }

    // return response;
  }
}
