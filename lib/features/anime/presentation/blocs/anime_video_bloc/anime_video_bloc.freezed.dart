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
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String endpoint) animeGetVideo,
    required TResult Function(bool control) showControl,
    required TResult Function(int position) seekPosition,
    required TResult Function(String mirror) changeResolution,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String endpoint)? animeGetVideo,
    TResult? Function(bool control)? showControl,
    TResult? Function(int position)? seekPosition,
    TResult? Function(String mirror)? changeResolution,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String endpoint)? animeGetVideo,
    TResult Function(bool control)? showControl,
    TResult Function(int position)? seekPosition,
    TResult Function(String mirror)? changeResolution,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AnimeGetVideo value) animeGetVideo,
    required TResult Function(_ShowControl value) showControl,
    required TResult Function(_SeekPosition value) seekPosition,
    required TResult Function(_ChangeResolution value) changeResolution,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AnimeGetVideo value)? animeGetVideo,
    TResult? Function(_ShowControl value)? showControl,
    TResult? Function(_SeekPosition value)? seekPosition,
    TResult? Function(_ChangeResolution value)? changeResolution,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AnimeGetVideo value)? animeGetVideo,
    TResult Function(_ShowControl value)? showControl,
    TResult Function(_SeekPosition value)? seekPosition,
    TResult Function(_ChangeResolution value)? changeResolution,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeVideoEventCopyWith<$Res> {
  factory $AnimeVideoEventCopyWith(
          AnimeVideoEvent value, $Res Function(AnimeVideoEvent) then) =
      _$AnimeVideoEventCopyWithImpl<$Res, AnimeVideoEvent>;
}

/// @nodoc
class _$AnimeVideoEventCopyWithImpl<$Res, $Val extends AnimeVideoEvent>
    implements $AnimeVideoEventCopyWith<$Res> {
  _$AnimeVideoEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AnimeGetVideoImplCopyWith<$Res> {
  factory _$$AnimeGetVideoImplCopyWith(
          _$AnimeGetVideoImpl value, $Res Function(_$AnimeGetVideoImpl) then) =
      __$$AnimeGetVideoImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String endpoint});
}

/// @nodoc
class __$$AnimeGetVideoImplCopyWithImpl<$Res>
    extends _$AnimeVideoEventCopyWithImpl<$Res, _$AnimeGetVideoImpl>
    implements _$$AnimeGetVideoImplCopyWith<$Res> {
  __$$AnimeGetVideoImplCopyWithImpl(
      _$AnimeGetVideoImpl _value, $Res Function(_$AnimeGetVideoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? endpoint = null,
  }) {
    return _then(_$AnimeGetVideoImpl(
      endpoint: null == endpoint
          ? _value.endpoint
          : endpoint // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AnimeGetVideoImpl implements _AnimeGetVideo {
  const _$AnimeGetVideoImpl({required this.endpoint});

  @override
  final String endpoint;

  @override
  String toString() {
    return 'AnimeVideoEvent.animeGetVideo(endpoint: $endpoint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimeGetVideoImpl &&
            (identical(other.endpoint, endpoint) ||
                other.endpoint == endpoint));
  }

  @override
  int get hashCode => Object.hash(runtimeType, endpoint);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimeGetVideoImplCopyWith<_$AnimeGetVideoImpl> get copyWith =>
      __$$AnimeGetVideoImplCopyWithImpl<_$AnimeGetVideoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String endpoint) animeGetVideo,
    required TResult Function(bool control) showControl,
    required TResult Function(int position) seekPosition,
    required TResult Function(String mirror) changeResolution,
  }) {
    return animeGetVideo(endpoint);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String endpoint)? animeGetVideo,
    TResult? Function(bool control)? showControl,
    TResult? Function(int position)? seekPosition,
    TResult? Function(String mirror)? changeResolution,
  }) {
    return animeGetVideo?.call(endpoint);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String endpoint)? animeGetVideo,
    TResult Function(bool control)? showControl,
    TResult Function(int position)? seekPosition,
    TResult Function(String mirror)? changeResolution,
    required TResult orElse(),
  }) {
    if (animeGetVideo != null) {
      return animeGetVideo(endpoint);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AnimeGetVideo value) animeGetVideo,
    required TResult Function(_ShowControl value) showControl,
    required TResult Function(_SeekPosition value) seekPosition,
    required TResult Function(_ChangeResolution value) changeResolution,
  }) {
    return animeGetVideo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AnimeGetVideo value)? animeGetVideo,
    TResult? Function(_ShowControl value)? showControl,
    TResult? Function(_SeekPosition value)? seekPosition,
    TResult? Function(_ChangeResolution value)? changeResolution,
  }) {
    return animeGetVideo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AnimeGetVideo value)? animeGetVideo,
    TResult Function(_ShowControl value)? showControl,
    TResult Function(_SeekPosition value)? seekPosition,
    TResult Function(_ChangeResolution value)? changeResolution,
    required TResult orElse(),
  }) {
    if (animeGetVideo != null) {
      return animeGetVideo(this);
    }
    return orElse();
  }
}

abstract class _AnimeGetVideo implements AnimeVideoEvent {
  const factory _AnimeGetVideo({required final String endpoint}) =
      _$AnimeGetVideoImpl;

  String get endpoint;
  @JsonKey(ignore: true)
  _$$AnimeGetVideoImplCopyWith<_$AnimeGetVideoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ShowControlImplCopyWith<$Res> {
  factory _$$ShowControlImplCopyWith(
          _$ShowControlImpl value, $Res Function(_$ShowControlImpl) then) =
      __$$ShowControlImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool control});
}

/// @nodoc
class __$$ShowControlImplCopyWithImpl<$Res>
    extends _$AnimeVideoEventCopyWithImpl<$Res, _$ShowControlImpl>
    implements _$$ShowControlImplCopyWith<$Res> {
  __$$ShowControlImplCopyWithImpl(
      _$ShowControlImpl _value, $Res Function(_$ShowControlImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? control = null,
  }) {
    return _then(_$ShowControlImpl(
      control: null == control
          ? _value.control
          : control // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ShowControlImpl implements _ShowControl {
  const _$ShowControlImpl({required this.control});

  @override
  final bool control;

  @override
  String toString() {
    return 'AnimeVideoEvent.showControl(control: $control)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShowControlImpl &&
            (identical(other.control, control) || other.control == control));
  }

  @override
  int get hashCode => Object.hash(runtimeType, control);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShowControlImplCopyWith<_$ShowControlImpl> get copyWith =>
      __$$ShowControlImplCopyWithImpl<_$ShowControlImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String endpoint) animeGetVideo,
    required TResult Function(bool control) showControl,
    required TResult Function(int position) seekPosition,
    required TResult Function(String mirror) changeResolution,
  }) {
    return showControl(control);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String endpoint)? animeGetVideo,
    TResult? Function(bool control)? showControl,
    TResult? Function(int position)? seekPosition,
    TResult? Function(String mirror)? changeResolution,
  }) {
    return showControl?.call(control);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String endpoint)? animeGetVideo,
    TResult Function(bool control)? showControl,
    TResult Function(int position)? seekPosition,
    TResult Function(String mirror)? changeResolution,
    required TResult orElse(),
  }) {
    if (showControl != null) {
      return showControl(control);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AnimeGetVideo value) animeGetVideo,
    required TResult Function(_ShowControl value) showControl,
    required TResult Function(_SeekPosition value) seekPosition,
    required TResult Function(_ChangeResolution value) changeResolution,
  }) {
    return showControl(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AnimeGetVideo value)? animeGetVideo,
    TResult? Function(_ShowControl value)? showControl,
    TResult? Function(_SeekPosition value)? seekPosition,
    TResult? Function(_ChangeResolution value)? changeResolution,
  }) {
    return showControl?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AnimeGetVideo value)? animeGetVideo,
    TResult Function(_ShowControl value)? showControl,
    TResult Function(_SeekPosition value)? seekPosition,
    TResult Function(_ChangeResolution value)? changeResolution,
    required TResult orElse(),
  }) {
    if (showControl != null) {
      return showControl(this);
    }
    return orElse();
  }
}

abstract class _ShowControl implements AnimeVideoEvent {
  const factory _ShowControl({required final bool control}) = _$ShowControlImpl;

  bool get control;
  @JsonKey(ignore: true)
  _$$ShowControlImplCopyWith<_$ShowControlImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SeekPositionImplCopyWith<$Res> {
  factory _$$SeekPositionImplCopyWith(
          _$SeekPositionImpl value, $Res Function(_$SeekPositionImpl) then) =
      __$$SeekPositionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int position});
}

/// @nodoc
class __$$SeekPositionImplCopyWithImpl<$Res>
    extends _$AnimeVideoEventCopyWithImpl<$Res, _$SeekPositionImpl>
    implements _$$SeekPositionImplCopyWith<$Res> {
  __$$SeekPositionImplCopyWithImpl(
      _$SeekPositionImpl _value, $Res Function(_$SeekPositionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
  }) {
    return _then(_$SeekPositionImpl(
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SeekPositionImpl implements _SeekPosition {
  const _$SeekPositionImpl({required this.position});

  @override
  final int position;

  @override
  String toString() {
    return 'AnimeVideoEvent.seekPosition(position: $position)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeekPositionImpl &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @override
  int get hashCode => Object.hash(runtimeType, position);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SeekPositionImplCopyWith<_$SeekPositionImpl> get copyWith =>
      __$$SeekPositionImplCopyWithImpl<_$SeekPositionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String endpoint) animeGetVideo,
    required TResult Function(bool control) showControl,
    required TResult Function(int position) seekPosition,
    required TResult Function(String mirror) changeResolution,
  }) {
    return seekPosition(position);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String endpoint)? animeGetVideo,
    TResult? Function(bool control)? showControl,
    TResult? Function(int position)? seekPosition,
    TResult? Function(String mirror)? changeResolution,
  }) {
    return seekPosition?.call(position);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String endpoint)? animeGetVideo,
    TResult Function(bool control)? showControl,
    TResult Function(int position)? seekPosition,
    TResult Function(String mirror)? changeResolution,
    required TResult orElse(),
  }) {
    if (seekPosition != null) {
      return seekPosition(position);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AnimeGetVideo value) animeGetVideo,
    required TResult Function(_ShowControl value) showControl,
    required TResult Function(_SeekPosition value) seekPosition,
    required TResult Function(_ChangeResolution value) changeResolution,
  }) {
    return seekPosition(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AnimeGetVideo value)? animeGetVideo,
    TResult? Function(_ShowControl value)? showControl,
    TResult? Function(_SeekPosition value)? seekPosition,
    TResult? Function(_ChangeResolution value)? changeResolution,
  }) {
    return seekPosition?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AnimeGetVideo value)? animeGetVideo,
    TResult Function(_ShowControl value)? showControl,
    TResult Function(_SeekPosition value)? seekPosition,
    TResult Function(_ChangeResolution value)? changeResolution,
    required TResult orElse(),
  }) {
    if (seekPosition != null) {
      return seekPosition(this);
    }
    return orElse();
  }
}

abstract class _SeekPosition implements AnimeVideoEvent {
  const factory _SeekPosition({required final int position}) =
      _$SeekPositionImpl;

  int get position;
  @JsonKey(ignore: true)
  _$$SeekPositionImplCopyWith<_$SeekPositionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeResolutionImplCopyWith<$Res> {
  factory _$$ChangeResolutionImplCopyWith(_$ChangeResolutionImpl value,
          $Res Function(_$ChangeResolutionImpl) then) =
      __$$ChangeResolutionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String mirror});
}

/// @nodoc
class __$$ChangeResolutionImplCopyWithImpl<$Res>
    extends _$AnimeVideoEventCopyWithImpl<$Res, _$ChangeResolutionImpl>
    implements _$$ChangeResolutionImplCopyWith<$Res> {
  __$$ChangeResolutionImplCopyWithImpl(_$ChangeResolutionImpl _value,
      $Res Function(_$ChangeResolutionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mirror = null,
  }) {
    return _then(_$ChangeResolutionImpl(
      mirror: null == mirror
          ? _value.mirror
          : mirror // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChangeResolutionImpl implements _ChangeResolution {
  const _$ChangeResolutionImpl({required this.mirror});

  @override
  final String mirror;

  @override
  String toString() {
    return 'AnimeVideoEvent.changeResolution(mirror: $mirror)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeResolutionImpl &&
            (identical(other.mirror, mirror) || other.mirror == mirror));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mirror);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeResolutionImplCopyWith<_$ChangeResolutionImpl> get copyWith =>
      __$$ChangeResolutionImplCopyWithImpl<_$ChangeResolutionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String endpoint) animeGetVideo,
    required TResult Function(bool control) showControl,
    required TResult Function(int position) seekPosition,
    required TResult Function(String mirror) changeResolution,
  }) {
    return changeResolution(mirror);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String endpoint)? animeGetVideo,
    TResult? Function(bool control)? showControl,
    TResult? Function(int position)? seekPosition,
    TResult? Function(String mirror)? changeResolution,
  }) {
    return changeResolution?.call(mirror);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String endpoint)? animeGetVideo,
    TResult Function(bool control)? showControl,
    TResult Function(int position)? seekPosition,
    TResult Function(String mirror)? changeResolution,
    required TResult orElse(),
  }) {
    if (changeResolution != null) {
      return changeResolution(mirror);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AnimeGetVideo value) animeGetVideo,
    required TResult Function(_ShowControl value) showControl,
    required TResult Function(_SeekPosition value) seekPosition,
    required TResult Function(_ChangeResolution value) changeResolution,
  }) {
    return changeResolution(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AnimeGetVideo value)? animeGetVideo,
    TResult? Function(_ShowControl value)? showControl,
    TResult? Function(_SeekPosition value)? seekPosition,
    TResult? Function(_ChangeResolution value)? changeResolution,
  }) {
    return changeResolution?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AnimeGetVideo value)? animeGetVideo,
    TResult Function(_ShowControl value)? showControl,
    TResult Function(_SeekPosition value)? seekPosition,
    TResult Function(_ChangeResolution value)? changeResolution,
    required TResult orElse(),
  }) {
    if (changeResolution != null) {
      return changeResolution(this);
    }
    return orElse();
  }
}

abstract class _ChangeResolution implements AnimeVideoEvent {
  const factory _ChangeResolution({required final String mirror}) =
      _$ChangeResolutionImpl;

  String get mirror;
  @JsonKey(ignore: true)
  _$$ChangeResolutionImplCopyWith<_$ChangeResolutionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AnimeVideoState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isBuffering => throw _privateConstructorUsedError;
  bool get isShowControll => throw _privateConstructorUsedError;
  bool get isPlaying => throw _privateConstructorUsedError;
  bool get isBackward => throw _privateConstructorUsedError;
  bool get isForward => throw _privateConstructorUsedError;
  int get videoDuration => throw _privateConstructorUsedError;
  int get videoPosition => throw _privateConstructorUsedError;
  int get sliderPosition => throw _privateConstructorUsedError;
  List<VideoModel> get videoList => throw _privateConstructorUsedError;
  List<EpisodeModel> get episodeList => throw _privateConstructorUsedError;

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
  $Res call(
      {bool isLoading,
      bool isBuffering,
      bool isShowControll,
      bool isPlaying,
      bool isBackward,
      bool isForward,
      int videoDuration,
      int videoPosition,
      int sliderPosition,
      List<VideoModel> videoList,
      List<EpisodeModel> episodeList});
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
    Object? isLoading = null,
    Object? isBuffering = null,
    Object? isShowControll = null,
    Object? isPlaying = null,
    Object? isBackward = null,
    Object? isForward = null,
    Object? videoDuration = null,
    Object? videoPosition = null,
    Object? sliderPosition = null,
    Object? videoList = null,
    Object? episodeList = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isBuffering: null == isBuffering
          ? _value.isBuffering
          : isBuffering // ignore: cast_nullable_to_non_nullable
              as bool,
      isShowControll: null == isShowControll
          ? _value.isShowControll
          : isShowControll // ignore: cast_nullable_to_non_nullable
              as bool,
      isPlaying: null == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
      isBackward: null == isBackward
          ? _value.isBackward
          : isBackward // ignore: cast_nullable_to_non_nullable
              as bool,
      isForward: null == isForward
          ? _value.isForward
          : isForward // ignore: cast_nullable_to_non_nullable
              as bool,
      videoDuration: null == videoDuration
          ? _value.videoDuration
          : videoDuration // ignore: cast_nullable_to_non_nullable
              as int,
      videoPosition: null == videoPosition
          ? _value.videoPosition
          : videoPosition // ignore: cast_nullable_to_non_nullable
              as int,
      sliderPosition: null == sliderPosition
          ? _value.sliderPosition
          : sliderPosition // ignore: cast_nullable_to_non_nullable
              as int,
      videoList: null == videoList
          ? _value.videoList
          : videoList // ignore: cast_nullable_to_non_nullable
              as List<VideoModel>,
      episodeList: null == episodeList
          ? _value.episodeList
          : episodeList // ignore: cast_nullable_to_non_nullable
              as List<EpisodeModel>,
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
  $Res call(
      {bool isLoading,
      bool isBuffering,
      bool isShowControll,
      bool isPlaying,
      bool isBackward,
      bool isForward,
      int videoDuration,
      int videoPosition,
      int sliderPosition,
      List<VideoModel> videoList,
      List<EpisodeModel> episodeList});
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
    Object? isLoading = null,
    Object? isBuffering = null,
    Object? isShowControll = null,
    Object? isPlaying = null,
    Object? isBackward = null,
    Object? isForward = null,
    Object? videoDuration = null,
    Object? videoPosition = null,
    Object? sliderPosition = null,
    Object? videoList = null,
    Object? episodeList = null,
  }) {
    return _then(_$AnimeVideoStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isBuffering: null == isBuffering
          ? _value.isBuffering
          : isBuffering // ignore: cast_nullable_to_non_nullable
              as bool,
      isShowControll: null == isShowControll
          ? _value.isShowControll
          : isShowControll // ignore: cast_nullable_to_non_nullable
              as bool,
      isPlaying: null == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
      isBackward: null == isBackward
          ? _value.isBackward
          : isBackward // ignore: cast_nullable_to_non_nullable
              as bool,
      isForward: null == isForward
          ? _value.isForward
          : isForward // ignore: cast_nullable_to_non_nullable
              as bool,
      videoDuration: null == videoDuration
          ? _value.videoDuration
          : videoDuration // ignore: cast_nullable_to_non_nullable
              as int,
      videoPosition: null == videoPosition
          ? _value.videoPosition
          : videoPosition // ignore: cast_nullable_to_non_nullable
              as int,
      sliderPosition: null == sliderPosition
          ? _value.sliderPosition
          : sliderPosition // ignore: cast_nullable_to_non_nullable
              as int,
      videoList: null == videoList
          ? _value._videoList
          : videoList // ignore: cast_nullable_to_non_nullable
              as List<VideoModel>,
      episodeList: null == episodeList
          ? _value._episodeList
          : episodeList // ignore: cast_nullable_to_non_nullable
              as List<EpisodeModel>,
    ));
  }
}

/// @nodoc

class _$AnimeVideoStateImpl extends _AnimeVideoState {
  const _$AnimeVideoStateImpl(
      {required this.isLoading,
      required this.isBuffering,
      required this.isShowControll,
      required this.isPlaying,
      required this.isBackward,
      required this.isForward,
      required this.videoDuration,
      required this.videoPosition,
      required this.sliderPosition,
      required final List<VideoModel> videoList,
      required final List<EpisodeModel> episodeList})
      : _videoList = videoList,
        _episodeList = episodeList,
        super._();

  @override
  final bool isLoading;
  @override
  final bool isBuffering;
  @override
  final bool isShowControll;
  @override
  final bool isPlaying;
  @override
  final bool isBackward;
  @override
  final bool isForward;
  @override
  final int videoDuration;
  @override
  final int videoPosition;
  @override
  final int sliderPosition;
  final List<VideoModel> _videoList;
  @override
  List<VideoModel> get videoList {
    if (_videoList is EqualUnmodifiableListView) return _videoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_videoList);
  }

  final List<EpisodeModel> _episodeList;
  @override
  List<EpisodeModel> get episodeList {
    if (_episodeList is EqualUnmodifiableListView) return _episodeList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_episodeList);
  }

  @override
  String toString() {
    return 'AnimeVideoState(isLoading: $isLoading, isBuffering: $isBuffering, isShowControll: $isShowControll, isPlaying: $isPlaying, isBackward: $isBackward, isForward: $isForward, videoDuration: $videoDuration, videoPosition: $videoPosition, sliderPosition: $sliderPosition, videoList: $videoList, episodeList: $episodeList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimeVideoStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isBuffering, isBuffering) ||
                other.isBuffering == isBuffering) &&
            (identical(other.isShowControll, isShowControll) ||
                other.isShowControll == isShowControll) &&
            (identical(other.isPlaying, isPlaying) ||
                other.isPlaying == isPlaying) &&
            (identical(other.isBackward, isBackward) ||
                other.isBackward == isBackward) &&
            (identical(other.isForward, isForward) ||
                other.isForward == isForward) &&
            (identical(other.videoDuration, videoDuration) ||
                other.videoDuration == videoDuration) &&
            (identical(other.videoPosition, videoPosition) ||
                other.videoPosition == videoPosition) &&
            (identical(other.sliderPosition, sliderPosition) ||
                other.sliderPosition == sliderPosition) &&
            const DeepCollectionEquality()
                .equals(other._videoList, _videoList) &&
            const DeepCollectionEquality()
                .equals(other._episodeList, _episodeList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isBuffering,
      isShowControll,
      isPlaying,
      isBackward,
      isForward,
      videoDuration,
      videoPosition,
      sliderPosition,
      const DeepCollectionEquality().hash(_videoList),
      const DeepCollectionEquality().hash(_episodeList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimeVideoStateImplCopyWith<_$AnimeVideoStateImpl> get copyWith =>
      __$$AnimeVideoStateImplCopyWithImpl<_$AnimeVideoStateImpl>(
          this, _$identity);
}

abstract class _AnimeVideoState extends AnimeVideoState {
  const factory _AnimeVideoState(
      {required final bool isLoading,
      required final bool isBuffering,
      required final bool isShowControll,
      required final bool isPlaying,
      required final bool isBackward,
      required final bool isForward,
      required final int videoDuration,
      required final int videoPosition,
      required final int sliderPosition,
      required final List<VideoModel> videoList,
      required final List<EpisodeModel> episodeList}) = _$AnimeVideoStateImpl;
  const _AnimeVideoState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isBuffering;
  @override
  bool get isShowControll;
  @override
  bool get isPlaying;
  @override
  bool get isBackward;
  @override
  bool get isForward;
  @override
  int get videoDuration;
  @override
  int get videoPosition;
  @override
  int get sliderPosition;
  @override
  List<VideoModel> get videoList;
  @override
  List<EpisodeModel> get episodeList;
  @override
  @JsonKey(ignore: true)
  _$$AnimeVideoStateImplCopyWith<_$AnimeVideoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
