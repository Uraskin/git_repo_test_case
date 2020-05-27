import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:flutter/foundation.dart';
import 'package:git_repo_test_case/data/models/error_models.dart';
import 'package:git_repo_test_case/data/models/repo_models.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  ApiError,
  GithubSearchResponse,
  GithubRepo,
  Owner
])
final Serializers serializers = _$serializers;

Serializers standardSerializers = (serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
).build();

parseJson(String text) {
  return compute(_parseAndDecode, text);
}

_parseAndDecode(String response) {
  return jsonDecode(response);
}