// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo_models.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GithubSearchResponse> _$githubSearchResponseSerializer =
    new _$GithubSearchResponseSerializer();
Serializer<GithubRepo> _$githubRepoSerializer = new _$GithubRepoSerializer();
Serializer<Owner> _$ownerSerializer = new _$OwnerSerializer();

class _$GithubSearchResponseSerializer
    implements StructuredSerializer<GithubSearchResponse> {
  @override
  final Iterable<Type> types = const [
    GithubSearchResponse,
    _$GithubSearchResponse
  ];
  @override
  final String wireName = 'GithubSearchResponse';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GithubSearchResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'items',
      serializers.serialize(object.items,
          specifiedType:
              const FullType(BuiltList, const [const FullType(GithubRepo)])),
    ];

    return result;
  }

  @override
  GithubSearchResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GithubSearchResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'items':
          result.items.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GithubRepo)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$GithubRepoSerializer implements StructuredSerializer<GithubRepo> {
  @override
  final Iterable<Type> types = const [GithubRepo, _$GithubRepo];
  @override
  final String wireName = 'GithubRepo';

  @override
  Iterable<Object> serialize(Serializers serializers, GithubRepo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }
    if (object.private != null) {
      result
        ..add('private')
        ..add(serializers.serialize(object.private,
            specifiedType: const FullType(bool)));
    }
    if (object.score != null) {
      result
        ..add('score')
        ..add(serializers.serialize(object.score,
            specifiedType: const FullType(double)));
    }
    if (object.watcherCount != null) {
      result
        ..add('watchers_count')
        ..add(serializers.serialize(object.watcherCount,
            specifiedType: const FullType(int)));
    }
    if (object.forksCount != null) {
      result
        ..add('forks_count')
        ..add(serializers.serialize(object.forksCount,
            specifiedType: const FullType(int)));
    }
    if (object.owner != null) {
      result
        ..add('owner')
        ..add(serializers.serialize(object.owner,
            specifiedType: const FullType(Owner)));
    }
    if (object.local != null) {
      result
        ..add('local')
        ..add(serializers.serialize(object.local,
            specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  GithubRepo deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GithubRepoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'private':
          result.private = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'score':
          result.score = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'watchers_count':
          result.watcherCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'forks_count':
          result.forksCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'owner':
          result.owner.replace(serializers.deserialize(value,
              specifiedType: const FullType(Owner)) as Owner);
          break;
        case 'local':
          result.local = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$OwnerSerializer implements StructuredSerializer<Owner> {
  @override
  final Iterable<Type> types = const [Owner, _$Owner];
  @override
  final String wireName = 'Owner';

  @override
  Iterable<Object> serialize(Serializers serializers, Owner object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'login',
      serializers.serialize(object.login,
          specifiedType: const FullType(String)),
      'avatar_url',
      serializers.serialize(object.avatarUrl,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Owner deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OwnerBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'login':
          result.login = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'avatar_url':
          result.avatarUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GithubSearchResponse extends GithubSearchResponse {
  @override
  final BuiltList<GithubRepo> items;

  factory _$GithubSearchResponse(
          [void Function(GithubSearchResponseBuilder) updates]) =>
      (new GithubSearchResponseBuilder()..update(updates)).build();

  _$GithubSearchResponse._({this.items}) : super._() {
    if (items == null) {
      throw new BuiltValueNullFieldError('GithubSearchResponse', 'items');
    }
  }

  @override
  GithubSearchResponse rebuild(
          void Function(GithubSearchResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GithubSearchResponseBuilder toBuilder() =>
      new GithubSearchResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GithubSearchResponse && items == other.items;
  }

  @override
  int get hashCode {
    return $jf($jc(0, items.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GithubSearchResponse')
          ..add('items', items))
        .toString();
  }
}

class GithubSearchResponseBuilder
    implements Builder<GithubSearchResponse, GithubSearchResponseBuilder> {
  _$GithubSearchResponse _$v;

  ListBuilder<GithubRepo> _items;
  ListBuilder<GithubRepo> get items =>
      _$this._items ??= new ListBuilder<GithubRepo>();
  set items(ListBuilder<GithubRepo> items) => _$this._items = items;

  GithubSearchResponseBuilder();

  GithubSearchResponseBuilder get _$this {
    if (_$v != null) {
      _items = _$v.items?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GithubSearchResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GithubSearchResponse;
  }

  @override
  void update(void Function(GithubSearchResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GithubSearchResponse build() {
    _$GithubSearchResponse _$result;
    try {
      _$result = _$v ?? new _$GithubSearchResponse._(items: items.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GithubSearchResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GithubRepo extends GithubRepo {
  @override
  final int id;
  @override
  final String name;
  @override
  final String description;
  @override
  final bool private;
  @override
  final double score;
  @override
  final int watcherCount;
  @override
  final int forksCount;
  @override
  final Owner owner;
  @override
  final bool local;

  factory _$GithubRepo([void Function(GithubRepoBuilder) updates]) =>
      (new GithubRepoBuilder()..update(updates)).build();

  _$GithubRepo._(
      {this.id,
      this.name,
      this.description,
      this.private,
      this.score,
      this.watcherCount,
      this.forksCount,
      this.owner,
      this.local})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('GithubRepo', 'id');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('GithubRepo', 'name');
    }
  }

  @override
  GithubRepo rebuild(void Function(GithubRepoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GithubRepoBuilder toBuilder() => new GithubRepoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GithubRepo &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        private == other.private &&
        score == other.score &&
        watcherCount == other.watcherCount &&
        forksCount == other.forksCount &&
        owner == other.owner &&
        local == other.local;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, id.hashCode), name.hashCode),
                                description.hashCode),
                            private.hashCode),
                        score.hashCode),
                    watcherCount.hashCode),
                forksCount.hashCode),
            owner.hashCode),
        local.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GithubRepo')
          ..add('id', id)
          ..add('name', name)
          ..add('description', description)
          ..add('private', private)
          ..add('score', score)
          ..add('watcherCount', watcherCount)
          ..add('forksCount', forksCount)
          ..add('owner', owner)
          ..add('local', local))
        .toString();
  }
}

class GithubRepoBuilder implements Builder<GithubRepo, GithubRepoBuilder> {
  _$GithubRepo _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  bool _private;
  bool get private => _$this._private;
  set private(bool private) => _$this._private = private;

  double _score;
  double get score => _$this._score;
  set score(double score) => _$this._score = score;

  int _watcherCount;
  int get watcherCount => _$this._watcherCount;
  set watcherCount(int watcherCount) => _$this._watcherCount = watcherCount;

  int _forksCount;
  int get forksCount => _$this._forksCount;
  set forksCount(int forksCount) => _$this._forksCount = forksCount;

  OwnerBuilder _owner;
  OwnerBuilder get owner => _$this._owner ??= new OwnerBuilder();
  set owner(OwnerBuilder owner) => _$this._owner = owner;

  bool _local;
  bool get local => _$this._local;
  set local(bool local) => _$this._local = local;

  GithubRepoBuilder();

  GithubRepoBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _description = _$v.description;
      _private = _$v.private;
      _score = _$v.score;
      _watcherCount = _$v.watcherCount;
      _forksCount = _$v.forksCount;
      _owner = _$v.owner?.toBuilder();
      _local = _$v.local;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GithubRepo other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GithubRepo;
  }

  @override
  void update(void Function(GithubRepoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GithubRepo build() {
    _$GithubRepo _$result;
    try {
      _$result = _$v ??
          new _$GithubRepo._(
              id: id,
              name: name,
              description: description,
              private: private,
              score: score,
              watcherCount: watcherCount,
              forksCount: forksCount,
              owner: _owner?.build(),
              local: local);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'owner';
        _owner?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GithubRepo', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Owner extends Owner {
  @override
  final int id;
  @override
  final String login;
  @override
  final String avatarUrl;

  factory _$Owner([void Function(OwnerBuilder) updates]) =>
      (new OwnerBuilder()..update(updates)).build();

  _$Owner._({this.id, this.login, this.avatarUrl}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Owner', 'id');
    }
    if (login == null) {
      throw new BuiltValueNullFieldError('Owner', 'login');
    }
    if (avatarUrl == null) {
      throw new BuiltValueNullFieldError('Owner', 'avatarUrl');
    }
  }

  @override
  Owner rebuild(void Function(OwnerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OwnerBuilder toBuilder() => new OwnerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Owner &&
        id == other.id &&
        login == other.login &&
        avatarUrl == other.avatarUrl;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, id.hashCode), login.hashCode), avatarUrl.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Owner')
          ..add('id', id)
          ..add('login', login)
          ..add('avatarUrl', avatarUrl))
        .toString();
  }
}

class OwnerBuilder implements Builder<Owner, OwnerBuilder> {
  _$Owner _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _login;
  String get login => _$this._login;
  set login(String login) => _$this._login = login;

  String _avatarUrl;
  String get avatarUrl => _$this._avatarUrl;
  set avatarUrl(String avatarUrl) => _$this._avatarUrl = avatarUrl;

  OwnerBuilder();

  OwnerBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _login = _$v.login;
      _avatarUrl = _$v.avatarUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Owner other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Owner;
  }

  @override
  void update(void Function(OwnerBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Owner build() {
    final _$result =
        _$v ?? new _$Owner._(id: id, login: login, avatarUrl: avatarUrl);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
