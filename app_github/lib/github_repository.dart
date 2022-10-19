import 'package:app_github/models/github_model.dart';
import 'package:dio/dio.dart';

class GithubRepository {
  final dio = Dio();

  Future<GithubModel> fecthGithub() async {
    try {
      final response =
          await dio.get('https://api.github.com/users/jailtonmendes');
      final json = response.data as Map<String, dynamic>;
      return GithubModel.fromMap(json);
    } catch (e) {
      throw Exception(e);
    }
  }
}
