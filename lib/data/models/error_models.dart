import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:git_repo_test_case/data/base/serializers.dart';

part 'error_models.g.dart';

abstract class IBusinessError {

  @BuiltValueField(wireName: 'message')
  @nullable String get message;

}

abstract class ApiError
    implements IBusinessError, Built<ApiError, ApiErrorBuilder> {
  ApiError._();

  factory ApiError([updates(ApiErrorBuilder b)]) = _$ApiError;

  String toJson() {
    return json.encode(serializers.serializeWith(ApiError.serializer, this));
  }

  static ApiError fromJson(String jsonString) {
    return serializers.deserializeWith(
        ApiError.serializer, json.decode(jsonString));
  }

  static Serializer<ApiError> get serializer => _$apiErrorSerializer;
}