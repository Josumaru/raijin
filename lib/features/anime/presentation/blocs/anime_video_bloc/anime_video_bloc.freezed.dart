// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anime_video_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AnimeVideoEvent {
  String get endpoint => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String endpoint) getVideo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String endpoint)? getVideo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String endpoint)? getVideo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetVideo value) getVideo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetVideo value)? getVideo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetVideo value)? getVideo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnimeVideoEventCopyWith<AnimeVideoEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeVideoEventCopyWith<$Res> {
  factory $AnimeVideoEventCopyWith(
          AnimeVideoEvent value, $Res Function(AnimeVideoEvent) then) =
      _$AnimeVideoEventCopyWithImpl<$Res, AnimeVideoEvent>;
  @useResult
  $Res call({String endpoint});
}

/// @nodoc
class _$AnimeVideoEventCopyWithImpl<$Res, $Val extends AnimeVideoEvent>
    implements $AnimeVideoEventCopyWith<$Res> {
  _$AnimeVideoEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? endpoint = null,
  }) {
    return _then(_value.copyWith(
      endpoint: null == endpoint
          ? _value.endpoint
          : endpoint // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetVideoImplCopyWith<$Res>
    implements $AnimeVideoEventCopyWith<$Res> {
  factory _$$GetVideoImplCopyWith(
          _$GetVideoImpl value, $Res Function(_$GetVideoImpl) then) =
      __$$GetVideoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String endpoint});
}

/// @nodoc
class __$$GetVideoImplCopyWithImpl<$Res>
    extends _$AnimeVideoEventCopyWithImpl<$Res, _$GetVideoImpl>
    implements _$$GetVideoImplCopyWith<$Res> {
  __$$GetVideoImplCopyWithImpl(
      _$GetVideoImpl _value, $Res Function(_$GetVideoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? endpoint = null,
  }) {
    return _then(_$GetVideoImpl(
      endpoint: null == endpoint
          ? _value.endpoint
          : endpoint // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetVideoImpl implements _GetVideo {
  const _$GetVideoImpl({required this.endpoint});

  @override
  final String endpoint;

  @override
  String toString() {
    return 'AnimeVideoEvent.getVideo(endpoint: $endpoint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetVideoImpl &&
            (identical(other.endpoint, endpoint) ||
                other.endpoint == endpoint));
  }

  @override
  int get hashCode => Object.hash(runtimeType, endpoint);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetVideoImplCopyWith<_$GetVideoImpl> get copyWith =>
      __$$GetVideoImplCopyWithImpl<_$GetVideoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String endpoint) getVideo,
  }) {
    return getVideo(endpoint);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String endpoint)? getVideo,
  }) {
    return getVideo?.call(endpoint);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String endpoint)? getVideo,
    required TResult orElse(),
  }) {
    if (getVideo != null) {
      return getVideo(endpoint);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetVideo value) getVideo,
  }) {
    return getVideo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetVideo value)? getVideo,
  }) {
    return getVideo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetVideo value)? getVideo,
    required TResult orElse(),
  }) {
    if (getVideo != null) {
      return getVideo(this);
    }
    return orElse();
  }
}

abstract class _GetVideo implements AnimeVideoEvent {
  const factory _GetVideo({required final String endpoint}) = _$GetVideoImpl;

  @override
  String get endpoint;
  @override
  @JsonKey(ignore: true)
  _$$GetVideoImplCopyWith<_$GetVideoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AnimeVideoState {
  bool get error => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  List<VideoModel> get videoList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnimeVideoStateCopyWith<AnimeVideoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeVideoStateCopyWith<$Res> {
  factory $AnimeVideoStateCopyWith(
          AnimeVideoState value, $Res Function(AnimeVideoState) then) =
      _$AnimeVideoStateCopyWithImpl<$Res, AnimeVideoState>;
  @useResult
  $Res call({bool error, bool loading, List<VideoModel> videoList});
}

/// @nodoc
class _$AnimeVideoStateCopyWithImpl<$Res, $Val extends AnimeVideoState>
    implements $AnimeVideoStateCopyWith<$Res> {
  _$AnimeVideoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? loading = null,
    Object? videoList = null,
  }) {
    return _then(_value.copyWith(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      videoList: null == videoList
          ? _value.videoList
          : videoList // ignore: cast_nullable_to_non_nullable
              as List<VideoModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnimeVideoStateImplCopyWith<$Res>
    implements $AnimeVideoStateCopyWith<$Res> {
  factory _$$AnimeVideoStateImplCopyWith(_$AnimeVideoStateImpl value,
          $Res Function(_$AnimeVideoStateImpl) then) =
      __$$AnimeVideoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool error, bool loading, List<VideoModel> videoList});
}

/// @nodoc
class __$$AnimeVideoStateImplCopyWithImpl<$Res>
    extends _$AnimeVideoStateCopyWithImpl<$Res, _$AnimeVideoStateImpl>
    implements _$$AnimeVideoStateImplCopyWith<$Res> {
  __$$AnimeVideoStateImplCopyWithImpl(
      _$AnimeVideoStateImpl _value, $Res Function(_$AnimeVideoStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? loading = null,
    Object? videoList = null,
  }) {
    return _then(_$AnimeVideoStateImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      videoList: null == videoList
          ? _value._videoList
          : videoList // ignore: cast_nullable_to_non_nullable
              as List<VideoModel>,
    ));
  }
}

/// @nodoc

class _$AnimeVideoStateImpl extends _AnimeVideoState {
  const _$AnimeVideoStateImpl(
      {required this.error,
      required this.loading,
      required final List<VideoModel> videoList})
      : _videoList = videoList,
        super._();

  @override
  final bool error;
  @override
  final bool loading;
  final List<VideoModel> _videoList;
  @override
  List<VideoModel> get videoList {
    if (_videoList is EqualUnmodifiableListView) return _videoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_videoList);
  }

  @override
  String toString() {
    return 'AnimeVideoState(error: $error, loading: $loading, videoList: $videoList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimeVideoStateImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality()
                .equals(other._videoList, _videoList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, loading,
      const DeepCollectionEquality().hash(_videoList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimeVideoStateImplCopyWith<_$AnimeVideoStateImpl> get copyWith =>
      __$$AnimeVideoStateImplCopyWithImpl<_$AnimeVideoStateImpl>(
          this, _$identity);
}

abstract class _AnimeVideoState extends AnimeVideoState {
  const factory _AnimeVideoState(
      {required final bool error,
      required final bool loading,
      required final List<VideoModel> videoList}) = _$AnimeVideoStateImpl;
  const _AnimeVideoState._() : super._();

  @override
  bool get error;
  @override
  bool get loading;
  @override
  List<VideoModel> get videoList;
  @override
  @JsonKey(ignore: true)
  _$$AnimeVideoStateImplCopyWith<_$AnimeVideoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
