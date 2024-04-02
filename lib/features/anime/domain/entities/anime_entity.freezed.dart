// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anime_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AnimeEntity {
  String get title => throw _privateConstructorUsedError;
  String get endpoint => throw _privateConstructorUsedError;
  String get poster => throw _privateConstructorUsedError;
  List<String>? get genre => throw _privateConstructorUsedError;
  String? get episode => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  double? get score => throw _privateConstructorUsedError;
  String? get released => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnimeEntityCopyWith<AnimeEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeEntityCopyWith<$Res> {
  factory $AnimeEntityCopyWith(
          AnimeEntity value, $Res Function(AnimeEntity) then) =
      _$AnimeEntityCopyWithImpl<$Res, AnimeEntity>;
  @useResult
  $Res call(
      {String title,
      String endpoint,
      String poster,
      List<String>? genre,
      String? episode,
      String? type,
      String? description,
      double? score,
      String? released,
      String? status});
}

/// @nodoc
class _$AnimeEntityCopyWithImpl<$Res, $Val extends AnimeEntity>
    implements $AnimeEntityCopyWith<$Res> {
  _$AnimeEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? endpoint = null,
    Object? poster = null,
    Object? genre = freezed,
    Object? episode = freezed,
    Object? type = freezed,
    Object? description = freezed,
    Object? score = freezed,
    Object? released = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      endpoint: null == endpoint
          ? _value.endpoint
          : endpoint // ignore: cast_nullable_to_non_nullable
              as String,
      poster: null == poster
          ? _value.poster
          : poster // ignore: cast_nullable_to_non_nullable
              as String,
      genre: freezed == genre
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      episode: freezed == episode
          ? _value.episode
          : episode // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      released: freezed == released
          ? _value.released
          : released // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnimeEntityImplCopyWith<$Res>
    implements $AnimeEntityCopyWith<$Res> {
  factory _$$AnimeEntityImplCopyWith(
          _$AnimeEntityImpl value, $Res Function(_$AnimeEntityImpl) then) =
      __$$AnimeEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String endpoint,
      String poster,
      List<String>? genre,
      String? episode,
      String? type,
      String? description,
      double? score,
      String? released,
      String? status});
}

/// @nodoc
class __$$AnimeEntityImplCopyWithImpl<$Res>
    extends _$AnimeEntityCopyWithImpl<$Res, _$AnimeEntityImpl>
    implements _$$AnimeEntityImplCopyWith<$Res> {
  __$$AnimeEntityImplCopyWithImpl(
      _$AnimeEntityImpl _value, $Res Function(_$AnimeEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? endpoint = null,
    Object? poster = null,
    Object? genre = freezed,
    Object? episode = freezed,
    Object? type = freezed,
    Object? description = freezed,
    Object? score = freezed,
    Object? released = freezed,
    Object? status = freezed,
  }) {
    return _then(_$AnimeEntityImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      endpoint: null == endpoint
          ? _value.endpoint
          : endpoint // ignore: cast_nullable_to_non_nullable
              as String,
      poster: null == poster
          ? _value.poster
          : poster // ignore: cast_nullable_to_non_nullable
              as String,
      genre: freezed == genre
          ? _value._genre
          : genre // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      episode: freezed == episode
          ? _value.episode
          : episode // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      released: freezed == released
          ? _value.released
          : released // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AnimeEntityImpl implements _AnimeEntity {
  const _$AnimeEntityImpl(
      {required this.title,
      required this.endpoint,
      required this.poster,
      final List<String>? genre,
      this.episode,
      this.type,
      this.description,
      this.score,
      this.released,
      this.status})
      : _genre = genre;

  @override
  final String title;
  @override
  final String endpoint;
  @override
  final String poster;
  final List<String>? _genre;
  @override
  List<String>? get genre {
    final value = _genre;
    if (value == null) return null;
    if (_genre is EqualUnmodifiableListView) return _genre;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? episode;
  @override
  final String? type;
  @override
  final String? description;
  @override
  final double? score;
  @override
  final String? released;
  @override
  final String? status;

  @override
  String toString() {
    return 'AnimeEntity(title: $title, endpoint: $endpoint, poster: $poster, genre: $genre, episode: $episode, type: $type, description: $description, score: $score, released: $released, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimeEntityImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.endpoint, endpoint) ||
                other.endpoint == endpoint) &&
            (identical(other.poster, poster) || other.poster == poster) &&
            const DeepCollectionEquality().equals(other._genre, _genre) &&
            (identical(other.episode, episode) || other.episode == episode) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.released, released) ||
                other.released == released) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      endpoint,
      poster,
      const DeepCollectionEquality().hash(_genre),
      episode,
      type,
      description,
      score,
      released,
      status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimeEntityImplCopyWith<_$AnimeEntityImpl> get copyWith =>
      __$$AnimeEntityImplCopyWithImpl<_$AnimeEntityImpl>(this, _$identity);
}

abstract class _AnimeEntity implements AnimeEntity {
  const factory _AnimeEntity(
      {required final String title,
      required final String endpoint,
      required final String poster,
      final List<String>? genre,
      final String? episode,
      final String? type,
      final String? description,
      final double? score,
      final String? released,
      final String? status}) = _$AnimeEntityImpl;

  @override
  String get title;
  @override
  String get endpoint;
  @override
  String get poster;
  @override
  List<String>? get genre;
  @override
  String? get episode;
  @override
  String? get type;
  @override
  String? get description;
  @override
  double? get score;
  @override
  String? get released;
  @override
  String? get status;
  @override
  @JsonKey(ignore: true)
  _$$AnimeEntityImplCopyWith<_$AnimeEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
