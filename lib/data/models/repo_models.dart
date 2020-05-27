import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'repo_models.g.dart';

abstract class GithubSearchResponse
    implements Built<GithubSearchResponse, GithubSearchResponseBuilder> {
  @BuiltValueField(wireName: 'items')
  BuiltList<GithubRepo> get items;

  GithubSearchResponse._();

  factory GithubSearchResponse([updates(GithubSearchResponseBuilder b)]) =
      _$GithubSearchResponse;

  static Serializer<GithubSearchResponse> get serializer =>
      _$githubSearchResponseSerializer;
}

abstract class GithubRepo implements Built<GithubRepo, GithubRepoBuilder> {
  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'name')
  String get name;

  @BuiltValueField(wireName: 'description')
  @nullable
  String get description;

  @BuiltValueField(wireName: 'private')
  @nullable
  bool get private;

  @BuiltValueField(wireName: 'score')
  @nullable
  double get score;

  @BuiltValueField(wireName: 'watchers_count')
  @nullable
  int get watcherCount;

  @BuiltValueField(wireName: 'forks_count')
  @nullable
  int get forksCount;

  @BuiltValueField(wireName: 'owner')
  @nullable
  Owner get owner;

  @BuiltValueField(wireName: 'local')
  @nullable
  bool get local;

  GithubRepo._();

  factory GithubRepo([updates(GithubRepoBuilder b)]) = _$GithubRepo;

  static Serializer<GithubRepo> get serializer => _$githubRepoSerializer;
}

abstract class Owner implements Built<Owner, OwnerBuilder> {
  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'login')
  String get login;

  @BuiltValueField(wireName: 'avatar_url')
  String get avatarUrl;

  Owner._();

  factory Owner([updates(OwnerBuilder b)]) = _$Owner;

  static Serializer<Owner> get serializer => _$ownerSerializer;
}
