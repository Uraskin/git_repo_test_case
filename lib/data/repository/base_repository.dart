
abstract class BaseRepository {

  String baseUrl();

  String buildUrl(String part) {
    return "${baseUrl()}$part";
  }
}