import 'package:git_repo_test_case/data/api/a_http_client.dart';
import 'package:git_repo_test_case/data/models/repo_models.dart';
import 'package:git_repo_test_case/data/repository/base_repository.dart';

class GithubRepository extends BaseRepository {
  Future<GithubSearchResponse> getSearchResult(String query) async {
    return httpClient.get(buildUrl(''), queryParameters: {'q': query});
  }

  @override
  String baseUrl() {
    return '/search/repositories';
  }
}