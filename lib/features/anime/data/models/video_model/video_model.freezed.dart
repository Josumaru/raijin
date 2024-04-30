// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VideoModel {
  String get quality => throw _privateConstructorUsedError;
  String get mirror => throw _privateConstructorUsedError;
  String get endpoint => throw _privateConstructorUsedError;
  String get poster => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<EpisodeModel> get anotherEpisode => throw _privateConstructorUsedError;
  AnimeModel? get anime => throw _privateConstructorUsedError;
  String? get prevEpisode => throw _privateConstructorUsedError;
  String? get nextEpisode => throw _privateConstructorUsedError;
  int? get position => throw _privateConstructorUsedError;
  int? get duration => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VideoModelCopyWith<VideoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoModelCopyWith<$Res> {
  factory $VideoModelCopyWith(
          VideoModel value, $Res Function(VideoModel) then) =
      _$VideoModelCopyWithImpl<$Res, VideoModel>;
  @useResult
  $Res call(
      {String quality,
      String mirror,
      String endpoint,
      String poster,
      String title,
      List<EpisodeModel> anotherEpisode,
      AnimeModel? anime,
      String? prevEpisode,
      String? nextEpisode,
      int? position,
      int? duration,
      DateTime? date});

  $AnimeModelCopyWith<$Res>? get anime;
}

/// @nodoc
class _$VideoModelCopyWithImpl<$Res, $Val extends VideoModel>
    implements $VideoModelCopyWith<$Res> {
  _$VideoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quality = null,
    Object? mirror = null,
    Object? endpoint = null,
    Object? poster = null,
    Object? title = null,
    Object? anotherEpisode = null,
    Object? anime = freezed,
    Object? prevEpisode = freezed,
    Object? nextEpisode = freezed,
    Object? position = freezed,
    Object? duration = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      quality: null == quality
          ? _value.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as String,
      mirror: null == mirror
          ? _value.mirror
          : mirror // ignore: cast_nullable_to_non_nullable
              as String,
      endpoint: null == endpoint
          ? _value.endpoint
          : endpoint // ignore: cast_nullable_to_non_nullable
              as String,
      poster: null == poster
          ? _value.poster
          : poster // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      anotherEpisode: null == anotherEpisode
          ? _value.anotherEpisode
          : anotherEpisode // ignore: cast_nullable_to_non_nullable
              as List<EpisodeModel>,
      anime: freezed == anime
          ? _value.anime
          : anime // ignore: cast_nullable_to_non_nullable
              as AnimeModel?,
      prevEpisode: freezed == prevEpisode
          ? _value.prevEpisode
          : prevEpisode // ignore: cast_nullable_to_non_nullable
              as String?,
      nextEpisode: freezed == nextEpisode
          ? _value.nextEpisode
          : nextEpisode // ignore: cast_nullable_to_non_nullable
              as String?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AnimeModelCopyWith<$Res>? get anime {
    if (_value.anime == null) {
      return null;
    }

    return $AnimeModelCopyWith<$Res>(_value.anime!, (value) {
      return _then(_value.copyWith(anime: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VideoModelImplCopyWith<$Res>
    implements $VideoModelCopyWith<$Res> {
  factory _$$VideoModelImplCopyWith(
          _$VideoModelImpl value, $Res Function(_$VideoModelImpl) then) =
      __$$VideoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String quality,
      String mirror,
      String endpoint,
      String poster,
      String title,
      List<EpisodeModel> anotherEpisode,
      AnimeModel? anime,
      String? prevEpisode,
      String? nextEpisode,
      int? position,
      int? duration,
      DateTime? date});

  @override
  $AnimeModelCopyWith<$Res>? get anime;
}

/// @nodoc
class __$$VideoModelImplCopyWithImpl<$Res>
    extends _$VideoModelCopyWithImpl<$Res, _$VideoModelImpl>
    implements _$$VideoModelImplCopyWith<$Res> {
  __$$VideoModelImplCopyWithImpl(
      _$VideoModelImpl _value, $Res Function(_$VideoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quality = null,
    Object? mirror = null,
    Object? endpoint = null,
    Object? poster = null,
    Object? title = null,
    Object? anotherEpisode = null,
    Object? anime = freezed,
    Object? prevEpisode = freezed,
    Object? nextEpisode = freezed,
    Object? position = freezed,
    Object? duration = freezed,
    Object? date = freezed,
  }) {
    return _then(_$VideoModelImpl(
      quality: null == quality
          ? _value.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as String,
      mirror: null == mirror
          ? _value.mirror
          : mirror // ignore: cast_nullable_to_non_nullable
              as String,
      endpoint: null == endpoint
          ? _value.endpoint
          : endpoint // ignore: cast_nullable_to_non_nullable
              as String,
      poster: null == poster
          ? _value.poster
          : poster // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      anotherEpisode: null == anotherEpisode
          ? _value._anotherEpisode
          : anotherEpisode // ignore: cast_nullable_to_non_nullable
              as List<EpisodeModel>,
      anime: freezed == anime
          ? _value.anime
          : anime // ignore: cast_nullable_to_non_nullable
              as AnimeModel?,
      prevEpisode: freezed == prevEpisode
          ? _value.prevEpisode
          : prevEpisode // ignore: cast_nullable_to_non_nullable
              as String?,
      nextEpisode: freezed == nextEpisode
          ? _value.nextEpisode
          : nextEpisode // ignore: cast_nullable_to_non_nullable
              as String?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$VideoModelImpl implements _VideoModel {
  _$VideoModelImpl(
      {required this.quality,
      required this.mirror,
      required this.endpoint,
      required this.poster,
      required this.title,
      required final List<EpisodeModel> anotherEpisode,
      this.anime,
      this.prevEpisode,
      this.nextEpisode,
      this.position,
      this.duration,
      this.date})
      : _anotherEpisode = anotherEpisode;

  @override
  final String quality;
  @override
  final String mirror;
  @override
  final String endpoint;
  @override
  final String poster;
  @override
  final String title;
  final List<EpisodeModel> _anotherEpisode;
  @override
  List<EpisodeModel> get anotherEpisode {
    if (_anotherEpisode is EqualUnmodifiableListView) return _anotherEpisode;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_anotherEpisode);
  }

  @override
  final AnimeModel? anime;
  @override
  final String? prevEpisode;
  @override
  final String? nextEpisode;
  @override
  final int? position;
  @override
  final int? duration;
  @override
  final DateTime? date;

  @override
  String toString() {
    return 'VideoModel(quality: $quality, mirror: $mirror, endpoint: $endpoint, poster: $poster, title: $title, anotherEpisode: $anotherEpisode, anime: $anime, prevEpisode: $prevEpisode, nextEpisode: $nextEpisode, position: $position, duration: $duration, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoModelImpl &&
            (identical(other.quality, quality) || other.quality == quality) &&
            (identical(other.mirror, mirror) || other.mirror == mirror) &&
            (identical(other.endpoint, endpoint) ||
                other.endpoint == endpoint) &&
            (identical(other.poster, poster) || other.poster == poster) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality()
                .equals(other._anotherEpisode, _anotherEpisode) &&
            (identical(other.anime, anime) || other.anime == anime) &&
            (identical(other.prevEpisode, prevEpisode) ||
                other.prevEpisode == prevEpisode) &&
            (identical(other.nextEpisode, nextEpisode) ||
                other.nextEpisode == nextEpisode) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      quality,
      mirror,
      endpoint,
      poster,
      title,
      const DeepCollectionEquality().hash(_anotherEpisode),
      anime,
      prevEpisode,
      nextEpisode,
      position,
      duration,
      date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoModelImplCopyWith<_$VideoModelImpl> get copyWith =>
      __$$VideoModelImplCopyWithImpl<_$VideoModelImpl>(this, _$identity);
}

abstract class _VideoModel implements VideoModel {
  factory _VideoModel(
      {required final String quality,
      required final String mirror,
      required final String endpoint,
      required final String poster,
      required final String title,
      required final List<EpisodeModel> anotherEpisode,
      final AnimeModel? anime,
      final String? prevEpisode,
      final String? nextEpisode,
      final int? position,
      final int? duration,
      final DateTime? date}) = _$VideoModelImpl;

  @override
  String get quality;
  @override
  String get mirror;
  @override
  String get endpoint;
  @override
  String get poster;
  @override
  String get title;
  @override
  List<EpisodeModel> get anotherEpisode;
  @override
  AnimeModel? get anime;
  @override
  String? get prevEpisode;
  @override
  String? get nextEpisode;
  @override
  int? get position;
  @override
  int? get duration;
  @override
  DateTime? get date;
  @override
  @JsonKey(ignore: true)
  _$$VideoModelImplCopyWith<_$VideoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
