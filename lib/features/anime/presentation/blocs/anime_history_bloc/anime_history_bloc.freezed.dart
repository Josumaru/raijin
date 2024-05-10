// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anime_history_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AnimeHistoryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(VideoModel video) addAnimeHistory,
    required TResult Function(String endpoint) deleteAnimeHistory,
    required TResult Function() getAnimeHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(VideoModel video)? addAnimeHistory,
    TResult? Function(String endpoint)? deleteAnimeHistory,
    TResult? Function()? getAnimeHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(VideoModel video)? addAnimeHistory,
    TResult Function(String endpoint)? deleteAnimeHistory,
    TResult Function()? getAnimeHistory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddAnimeHistory value) addAnimeHistory,
    required TResult Function(_DeleteAnimeHistory value) deleteAnimeHistory,
    required TResult Function(_GetAnimeHistory value) getAnimeHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddAnimeHistory value)? addAnimeHistory,
    TResult? Function(_DeleteAnimeHistory value)? deleteAnimeHistory,
    TResult? Function(_GetAnimeHistory value)? getAnimeHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddAnimeHistory value)? addAnimeHistory,
    TResult Function(_DeleteAnimeHistory value)? deleteAnimeHistory,
    TResult Function(_GetAnimeHistory value)? getAnimeHistory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeHistoryEventCopyWith<$Res> {
  factory $AnimeHistoryEventCopyWith(
          AnimeHistoryEvent value, $Res Function(AnimeHistoryEvent) then) =
      _$AnimeHistoryEventCopyWithImpl<$Res, AnimeHistoryEvent>;
}

/// @nodoc
class _$AnimeHistoryEventCopyWithImpl<$Res, $Val extends AnimeHistoryEvent>
    implements $AnimeHistoryEventCopyWith<$Res> {
  _$AnimeHistoryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AddAnimeHistoryImplCopyWith<$Res> {
  factory _$$AddAnimeHistoryImplCopyWith(_$AddAnimeHistoryImpl value,
          $Res Function(_$AddAnimeHistoryImpl) then) =
      __$$AddAnimeHistoryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({VideoModel video});

  $VideoModelCopyWith<$Res> get video;
}

/// @nodoc
class __$$AddAnimeHistoryImplCopyWithImpl<$Res>
    extends _$AnimeHistoryEventCopyWithImpl<$Res, _$AddAnimeHistoryImpl>
    implements _$$AddAnimeHistoryImplCopyWith<$Res> {
  __$$AddAnimeHistoryImplCopyWithImpl(
      _$AddAnimeHistoryImpl _value, $Res Function(_$AddAnimeHistoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? video = null,
  }) {
    return _then(_$AddAnimeHistoryImpl(
      video: null == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as VideoModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $VideoModelCopyWith<$Res> get video {
    return $VideoModelCopyWith<$Res>(_value.video, (value) {
      return _then(_value.copyWith(video: value));
    });
  }
}

/// @nodoc

class _$AddAnimeHistoryImpl implements _AddAnimeHistory {
  const _$AddAnimeHistoryImpl({required this.video});

  @override
  final VideoModel video;

  @override
  String toString() {
    return 'AnimeHistoryEvent.addAnimeHistory(video: $video)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddAnimeHistoryImpl &&
            (identical(other.video, video) || other.video == video));
  }

  @override
  int get hashCode => Object.hash(runtimeType, video);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddAnimeHistoryImplCopyWith<_$AddAnimeHistoryImpl> get copyWith =>
      __$$AddAnimeHistoryImplCopyWithImpl<_$AddAnimeHistoryImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(VideoModel video) addAnimeHistory,
    required TResult Function(String endpoint) deleteAnimeHistory,
    required TResult Function() getAnimeHistory,
  }) {
    return addAnimeHistory(video);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(VideoModel video)? addAnimeHistory,
    TResult? Function(String endpoint)? deleteAnimeHistory,
    TResult? Function()? getAnimeHistory,
  }) {
    return addAnimeHistory?.call(video);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(VideoModel video)? addAnimeHistory,
    TResult Function(String endpoint)? deleteAnimeHistory,
    TResult Function()? getAnimeHistory,
    required TResult orElse(),
  }) {
    if (addAnimeHistory != null) {
      return addAnimeHistory(video);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddAnimeHistory value) addAnimeHistory,
    required TResult Function(_DeleteAnimeHistory value) deleteAnimeHistory,
    required TResult Function(_GetAnimeHistory value) getAnimeHistory,
  }) {
    return addAnimeHistory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddAnimeHistory value)? addAnimeHistory,
    TResult? Function(_DeleteAnimeHistory value)? deleteAnimeHistory,
    TResult? Function(_GetAnimeHistory value)? getAnimeHistory,
  }) {
    return addAnimeHistory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddAnimeHistory value)? addAnimeHistory,
    TResult Function(_DeleteAnimeHistory value)? deleteAnimeHistory,
    TResult Function(_GetAnimeHistory value)? getAnimeHistory,
    required TResult orElse(),
  }) {
    if (addAnimeHistory != null) {
      return addAnimeHistory(this);
    }
    return orElse();
  }
}

abstract class _AddAnimeHistory implements AnimeHistoryEvent {
  const factory _AddAnimeHistory({required final VideoModel video}) =
      _$AddAnimeHistoryImpl;

  VideoModel get video;
  @JsonKey(ignore: true)
  _$$AddAnimeHistoryImplCopyWith<_$AddAnimeHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteAnimeHistoryImplCopyWith<$Res> {
  factory _$$DeleteAnimeHistoryImplCopyWith(_$DeleteAnimeHistoryImpl value,
          $Res Function(_$DeleteAnimeHistoryImpl) then) =
      __$$DeleteAnimeHistoryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String endpoint});
}

/// @nodoc
class __$$DeleteAnimeHistoryImplCopyWithImpl<$Res>
    extends _$AnimeHistoryEventCopyWithImpl<$Res, _$DeleteAnimeHistoryImpl>
    implements _$$DeleteAnimeHistoryImplCopyWith<$Res> {
  __$$DeleteAnimeHistoryImplCopyWithImpl(_$DeleteAnimeHistoryImpl _value,
      $Res Function(_$DeleteAnimeHistoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? endpoint = null,
  }) {
    return _then(_$DeleteAnimeHistoryImpl(
      endpoint: null == endpoint
          ? _value.endpoint
          : endpoint // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteAnimeHistoryImpl implements _DeleteAnimeHistory {
  const _$DeleteAnimeHistoryImpl({required this.endpoint});

  @override
  final String endpoint;

  @override
  String toString() {
    return 'AnimeHistoryEvent.deleteAnimeHistory(endpoint: $endpoint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteAnimeHistoryImpl &&
            (identical(other.endpoint, endpoint) ||
                other.endpoint == endpoint));
  }

  @override
  int get hashCode => Object.hash(runtimeType, endpoint);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteAnimeHistoryImplCopyWith<_$DeleteAnimeHistoryImpl> get copyWith =>
      __$$DeleteAnimeHistoryImplCopyWithImpl<_$DeleteAnimeHistoryImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(VideoModel video) addAnimeHistory,
    required TResult Function(String endpoint) deleteAnimeHistory,
    required TResult Function() getAnimeHistory,
  }) {
    return deleteAnimeHistory(endpoint);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(VideoModel video)? addAnimeHistory,
    TResult? Function(String endpoint)? deleteAnimeHistory,
    TResult? Function()? getAnimeHistory,
  }) {
    return deleteAnimeHistory?.call(endpoint);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(VideoModel video)? addAnimeHistory,
    TResult Function(String endpoint)? deleteAnimeHistory,
    TResult Function()? getAnimeHistory,
    required TResult orElse(),
  }) {
    if (deleteAnimeHistory != null) {
      return deleteAnimeHistory(endpoint);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddAnimeHistory value) addAnimeHistory,
    required TResult Function(_DeleteAnimeHistory value) deleteAnimeHistory,
    required TResult Function(_GetAnimeHistory value) getAnimeHistory,
  }) {
    return deleteAnimeHistory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddAnimeHistory value)? addAnimeHistory,
    TResult? Function(_DeleteAnimeHistory value)? deleteAnimeHistory,
    TResult? Function(_GetAnimeHistory value)? getAnimeHistory,
  }) {
    return deleteAnimeHistory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddAnimeHistory value)? addAnimeHistory,
    TResult Function(_DeleteAnimeHistory value)? deleteAnimeHistory,
    TResult Function(_GetAnimeHistory value)? getAnimeHistory,
    required TResult orElse(),
  }) {
    if (deleteAnimeHistory != null) {
      return deleteAnimeHistory(this);
    }
    return orElse();
  }
}

abstract class _DeleteAnimeHistory implements AnimeHistoryEvent {
  const factory _DeleteAnimeHistory({required final String endpoint}) =
      _$DeleteAnimeHistoryImpl;

  String get endpoint;
  @JsonKey(ignore: true)
  _$$DeleteAnimeHistoryImplCopyWith<_$DeleteAnimeHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetAnimeHistoryImplCopyWith<$Res> {
  factory _$$GetAnimeHistoryImplCopyWith(_$GetAnimeHistoryImpl value,
          $Res Function(_$GetAnimeHistoryImpl) then) =
      __$$GetAnimeHistoryImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetAnimeHistoryImplCopyWithImpl<$Res>
    extends _$AnimeHistoryEventCopyWithImpl<$Res, _$GetAnimeHistoryImpl>
    implements _$$GetAnimeHistoryImplCopyWith<$Res> {
  __$$GetAnimeHistoryImplCopyWithImpl(
      _$GetAnimeHistoryImpl _value, $Res Function(_$GetAnimeHistoryImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetAnimeHistoryImpl implements _GetAnimeHistory {
  const _$GetAnimeHistoryImpl();

  @override
  String toString() {
    return 'AnimeHistoryEvent.getAnimeHistory()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetAnimeHistoryImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(VideoModel video) addAnimeHistory,
    required TResult Function(String endpoint) deleteAnimeHistory,
    required TResult Function() getAnimeHistory,
  }) {
    return getAnimeHistory();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(VideoModel video)? addAnimeHistory,
    TResult? Function(String endpoint)? deleteAnimeHistory,
    TResult? Function()? getAnimeHistory,
  }) {
    return getAnimeHistory?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(VideoModel video)? addAnimeHistory,
    TResult Function(String endpoint)? deleteAnimeHistory,
    TResult Function()? getAnimeHistory,
    required TResult orElse(),
  }) {
    if (getAnimeHistory != null) {
      return getAnimeHistory();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddAnimeHistory value) addAnimeHistory,
    required TResult Function(_DeleteAnimeHistory value) deleteAnimeHistory,
    required TResult Function(_GetAnimeHistory value) getAnimeHistory,
  }) {
    return getAnimeHistory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddAnimeHistory value)? addAnimeHistory,
    TResult? Function(_DeleteAnimeHistory value)? deleteAnimeHistory,
    TResult? Function(_GetAnimeHistory value)? getAnimeHistory,
  }) {
    return getAnimeHistory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddAnimeHistory value)? addAnimeHistory,
    TResult Function(_DeleteAnimeHistory value)? deleteAnimeHistory,
    TResult Function(_GetAnimeHistory value)? getAnimeHistory,
    required TResult orElse(),
  }) {
    if (getAnimeHistory != null) {
      return getAnimeHistory(this);
    }
    return orElse();
  }
}

abstract class _GetAnimeHistory implements AnimeHistoryEvent {
  const factory _GetAnimeHistory() = _$GetAnimeHistoryImpl;
}

/// @nodoc
mixin _$AnimeHistoryState {
  bool get error => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  List<VideoModel> get videoList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnimeHistoryStateCopyWith<AnimeHistoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeHistoryStateCopyWith<$Res> {
  factory $AnimeHistoryStateCopyWith(
          AnimeHistoryState value, $Res Function(AnimeHistoryState) then) =
      _$AnimeHistoryStateCopyWithImpl<$Res, AnimeHistoryState>;
  @useResult
  $Res call({bool error, bool loading, List<VideoModel> videoList});
}

/// @nodoc
class _$AnimeHistoryStateCopyWithImpl<$Res, $Val extends AnimeHistoryState>
    implements $AnimeHistoryStateCopyWith<$Res> {
  _$AnimeHistoryStateCopyWithImpl(this._value, this._then);

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
abstract class _$$AnimeHistoryStateImplCopyWith<$Res>
    implements $AnimeHistoryStateCopyWith<$Res> {
  factory _$$AnimeHistoryStateImplCopyWith(_$AnimeHistoryStateImpl value,
          $Res Function(_$AnimeHistoryStateImpl) then) =
      __$$AnimeHistoryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool error, bool loading, List<VideoModel> videoList});
}

/// @nodoc
class __$$AnimeHistoryStateImplCopyWithImpl<$Res>
    extends _$AnimeHistoryStateCopyWithImpl<$Res, _$AnimeHistoryStateImpl>
    implements _$$AnimeHistoryStateImplCopyWith<$Res> {
  __$$AnimeHistoryStateImplCopyWithImpl(_$AnimeHistoryStateImpl _value,
      $Res Function(_$AnimeHistoryStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? loading = null,
    Object? videoList = null,
  }) {
    return _then(_$AnimeHistoryStateImpl(
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

class _$AnimeHistoryStateImpl extends _AnimeHistoryState {
  const _$AnimeHistoryStateImpl(
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
    return 'AnimeHistoryState(error: $error, loading: $loading, videoList: $videoList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimeHistoryStateImpl &&
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
  _$$AnimeHistoryStateImplCopyWith<_$AnimeHistoryStateImpl> get copyWith =>
      __$$AnimeHistoryStateImplCopyWithImpl<_$AnimeHistoryStateImpl>(
          this, _$identity);
}

abstract class _AnimeHistoryState extends AnimeHistoryState {
  const factory _AnimeHistoryState(
      {required final bool error,
      required final bool loading,
      required final List<VideoModel> videoList}) = _$AnimeHistoryStateImpl;
  const _AnimeHistoryState._() : super._();

  @override
  bool get error;
  @override
  bool get loading;
  @override
  List<VideoModel> get videoList;
  @override
  @JsonKey(ignore: true)
  _$$AnimeHistoryStateImplCopyWith<_$AnimeHistoryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
