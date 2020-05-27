import 'package:built_collection/built_collection.dart';
import 'package:built_value/standard_json_plugin.dart';

class CustomEnumJsonPlugin extends StandardJsonPlugin {
  final Set<Type> _customEnumTypes;

  CustomEnumJsonPlugin(this._customEnumTypes);

  @override
  Object beforeDeserialize(object, type) {
    if (type.root == BuiltMap && type.parameters.isNotEmpty) {
      if (_customEnumTypes.contains(type.parameters.first.root)) {
        object = _addEnumEncoding(object as Map<String, Object>);
      }
    }
    return super.beforeDeserialize(object, type);
  }

  Map<String, Object> _addEnumEncoding(Map<String, Object> json) {
    var newJson = json.map((key, value) {
      return MapEntry('"$key"', value);
    });
    newJson.removeWhere((key, value) => value == null);
    return newJson;
  }

  @override
  Object afterSerialize(object, type) {
    var json = super.afterSerialize(object, type);
    if (type.root == BuiltMap && type.parameters.isNotEmpty) {
      if (_customEnumTypes.contains(type.parameters.first.root)) {
        json = _removeEnumEncoding(json as Map<String, Object>);
      }
    }
    return json;
  }

  Map<String, Object> _removeEnumEncoding(Map<String, Object> json) {
    return json.map((key, value) {
      var valOut = value;
      if (key is String && key.startsWith('"')) {
        key = key.substring(1, key.length - 1);
      }
      if (value is Map && value.containsKey(discriminator)) {
        valOut = value[valueKey];
      }
      return MapEntry(key, valOut);
    });
  }
}
