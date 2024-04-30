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
    required TResult Function(String endpoint) getVideo,
    required TResult Function(bool showControl) showControl,
    required TResult Function(double position) seekPosition,
    required TResult Function(String mirror) changeResolution,
    required TResult Function(String endpoint) changeEpisode,
    required TResult Function(bool buffering) setBuffering,
    required TResult Function(bool isPlay) playVideo,
    required TResult Function(VideoModel video) addHistory,
    required TResult Function(int position, int duration) setPosition,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String endpoint)? getVideo,
    TResult? Function(bool showControl)? showControl,
    TResult? Function(double position)? seekPosition,
    TResult? Function(String mirror)? changeResolution,
    TResult? Function(String endpoint)? changeEpisode,
    TResult? Function(bool buffering)? setBuffering,
    TResult? Function(bool isPlay)? playVideo,
    TResult? Function(VideoModel video)? addHistory,
    TResult? Function(int position, int duration)? setPosition,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String endpoint)? getVideo,
    TResult Function(bool showControl)? showControl,
    TResult Function(double position)? seekPosition,
    TResult Function(String mirror)? changeResolution,
    TResult Function(String endpoint)? changeEpisode,
    TResult Function(bool buffering)? setBuffering,
    TResult Function(bool isPlay)? playVideo,
    TResult Function(VideoModel video)? addHistory,
    TResult Function(int position, int duration)? setPosition,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetVideo value) getVideo,
    required TResult Function(_ShowControl value) showControl,
    required TResult Function(_SeekPosition value) seekPosition,
    required TResult Function(_ChangeResolution value) changeResolution,
    required TResult Function(_ChangeEpisode value) changeEpisode,
    required TResult Function(_SetBuffering value) setBuffering,
    required TResult Function(_PlayVideo value) playVideo,
    required TResult Function(_AddHistory value) addHistory,
    required TResult Function(_SetPosition value) setPosition,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetVideo value)? getVideo,
    TResult? Function(_ShowControl value)? showControl,
    TResult? Function(_SeekPosition value)? seekPosition,
    TResult? Function(_ChangeResolution value)? changeResolution,
    TResult? Function(_ChangeEpisode value)? changeEpisode,
    TResult? Function(_SetBuffering value)? setBuffering,
    TResult? Function(_PlayVideo value)? playVideo,
    TResult? Function(_AddHistory value)? addHistory,
    TResult? Function(_SetPosition value)? setPosition,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetVideo value)? getVideo,
    TResult Function(_ShowControl value)? showControl,
    TResult Function(_SeekPosition value)? seekPosition,
    TResult Function(_ChangeResolution value)? changeResolution,
    TResult Function(_ChangeEpisode value)? changeEpisode,
    TResult Function(_SetBuffering value)? setBuffering,
    TResult Function(_PlayVideo value)? playVideo,
    TResult Function(_AddHistory value)? addHistory,
    TResult Function(_SetPosition value)? setPosition,
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
abstract class _$$GetVideoImplCopyWith<$Res> {
  factory _$$GetVideoImplCopyWith(
          _$GetVideoImpl value, $Res Function(_$GetVideoImpl) then) =
      __$$GetVideoImplCopyWithImpl<$Res>;
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
    required TResult Function(bool showControl) showControl,
    required TResult Function(double position) seekPosition,
    required TResult Function(String mirror) changeResolution,
    required TResult Function(String endpoint) changeEpisode,
    required TResult Function(bool buffering) setBuffering,
    required TResult Function(bool isPlay) playVideo,
    required TResult Function(VideoModel video) addHistory,
    required TResult Function(int position, int duration) setPosition,
  }) {
    return getVideo(endpoint);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String endpoint)? getVideo,
    TResult? Function(bool showControl)? showControl,
    TResult? Function(double position)? seekPosition,
    TResult? Function(String mirror)? changeResolution,
    TResult? Function(String endpoint)? changeEpisode,
    TResult? Function(bool buffering)? setBuffering,
    TResult? Function(bool isPlay)? playVideo,
    TResult? Function(VideoModel video)? addHistory,
    TResult? Function(int position, int duration)? setPosition,
  }) {
    return getVideo?.call(endpoint);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String endpoint)? getVideo,
    TResult Function(bool showControl)? showControl,
    TResult Function(double position)? seekPosition,
    TResult Function(String mirror)? changeResolution,
    TResult Function(String endpoint)? changeEpisode,
    TResult Function(bool buffering)? setBuffering,
    TResult Function(bool isPlay)? playVideo,
    TResult Function(VideoModel video)? addHistory,
    TResult Function(int position, int duration)? setPosition,
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
    required TResult Function(_ShowControl value) showControl,
    required TResult Function(_SeekPosition value) seekPosition,
    required TResult Function(_ChangeResolution value) changeResolution,
    required TResult Function(_ChangeEpisode value) changeEpisode,
    required TResult Function(_SetBuffering value) setBuffering,
    required TResult Function(_PlayVideo value) playVideo,
    required TResult Function(_AddHistory value) addHistory,
    required TResult Function(_SetPosition value) setPosition,
  }) {
    return getVideo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetVideo value)? getVideo,
    TResult? Function(_ShowControl value)? showControl,
    TResult? Function(_SeekPosition value)? seekPosition,
    TResult? Function(_ChangeResolution value)? changeResolution,
    TResult? Function(_ChangeEpisode value)? changeEpisode,
    TResult? Function(_SetBuffering value)? setBuffering,
    TResult? Function(_PlayVideo value)? playVideo,
    TResult? Function(_AddHistory value)? addHistory,
    TResult? Function(_SetPosition value)? setPosition,
  }) {
    return getVideo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetVideo value)? getVideo,
    TResult Function(_ShowControl value)? showControl,
    TResult Function(_SeekPosition value)? seekPosition,
    TResult Function(_ChangeResolution value)? changeResolution,
    TResult Function(_ChangeEpisode value)? changeEpisode,
    TResult Function(_SetBuffering value)? setBuffering,
    TResult Function(_PlayVideo value)? playVideo,
    TResult Function(_AddHistory value)? addHistory,
    TResult Function(_SetPosition value)? setPosition,
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

  String get endpoint;
  @JsonKey(ignore: true)
  _$$GetVideoImplCopyWith<_$GetVideoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ShowControlImplCopyWith<$Res> {
  factory _$$ShowControlImplCopyWith(
          _$ShowControlImpl value, $Res Function(_$ShowControlImpl) then) =
      __$$ShowControlImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool showControl});
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
    Object? showControl = null,
  }) {
    return _then(_$ShowControlImpl(
      showControl: null == showControl
          ? _value.showControl
          : showControl // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ShowControlImpl implements _ShowControl {
  const _$ShowControlImpl({required this.showControl});

  @override
  final bool showControl;

  @override
  String toString() {
    return 'AnimeVideoEvent.showControl(showControl: $showControl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShowControlImpl &&
            (identical(other.showControl, showControl) ||
                other.showControl == showControl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, showControl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShowControlImplCopyWith<_$ShowControlImpl> get copyWith =>
      __$$ShowControlImplCopyWithImpl<_$ShowControlImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String endpoint) getVideo,
    required TResult Function(bool showControl) showControl,
    required TResult Function(double position) seekPosition,
    required TResult Function(String mirror) changeResolution,
    required TResult Function(String endpoint) changeEpisode,
    required TResult Function(bool buffering) setBuffering,
    required TResult Function(bool isPlay) playVideo,
    required TResult Function(VideoModel video) addHistory,
    required TResult Function(int position, int duration) setPosition,
  }) {
    return showControl(this.showControl);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String endpoint)? getVideo,
    TResult? Function(bool showControl)? showControl,
    TResult? Function(double position)? seekPosition,
    TResult? Function(String mirror)? changeResolution,
    TResult? Function(String endpoint)? changeEpisode,
    TResult? Function(bool buffering)? setBuffering,
    TResult? Function(bool isPlay)? playVideo,
    TResult? Function(VideoModel video)? addHistory,
    TResult? Function(int position, int duration)? setPosition,
  }) {
    return showControl?.call(this.showControl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String endpoint)? getVideo,
    TResult Function(bool showControl)? showControl,
    TResult Function(double position)? seekPosition,
    TResult Function(String mirror)? changeResolution,
    TResult Function(String endpoint)? changeEpisode,
    TResult Function(bool buffering)? setBuffering,
    TResult Function(bool isPlay)? playVideo,
    TResult Function(VideoModel video)? addHistory,
    TResult Function(int position, int duration)? setPosition,
    required TResult orElse(),
  }) {
    if (showControl != null) {
      return showControl(this.showControl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetVideo value) getVideo,
    required TResult Function(_ShowControl value) showControl,
    required TResult Function(_SeekPosition value) seekPosition,
    required TResult Function(_ChangeResolution value) changeResolution,
    required TResult Function(_ChangeEpisode value) changeEpisode,
    required TResult Function(_SetBuffering value) setBuffering,
    required TResult Function(_PlayVideo value) playVideo,
    required TResult Function(_AddHistory value) addHistory,
    required TResult Function(_SetPosition value) setPosition,
  }) {
    return showControl(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetVideo value)? getVideo,
    TResult? Function(_ShowControl value)? showControl,
    TResult? Function(_SeekPosition value)? seekPosition,
    TResult? Function(_ChangeResolution value)? changeResolution,
    TResult? Function(_ChangeEpisode value)? changeEpisode,
    TResult? Function(_SetBuffering value)? setBuffering,
    TResult? Function(_PlayVideo value)? playVideo,
    TResult? Function(_AddHistory value)? addHistory,
    TResult? Function(_SetPosition value)? setPosition,
  }) {
    return showControl?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetVideo value)? getVideo,
    TResult Function(_ShowControl value)? showControl,
    TResult Function(_SeekPosition value)? seekPosition,
    TResult Function(_ChangeResolution value)? changeResolution,
    TResult Function(_ChangeEpisode value)? changeEpisode,
    TResult Function(_SetBuffering value)? setBuffering,
    TResult Function(_PlayVideo value)? playVideo,
    TResult Function(_AddHistory value)? addHistory,
    TResult Function(_SetPosition value)? setPosition,
    required TResult orElse(),
  }) {
    if (showControl != null) {
      return showControl(this);
    }
    return orElse();
  }
}

abstract class _ShowControl implements AnimeVideoEvent {
  const factory _ShowControl({required final bool showControl}) =
      _$ShowControlImpl;

  bool get showControl;
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
  $Res call({double position});
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
              as double,
    ));
  }
}

/// @nodoc

class _$SeekPositionImpl implements _SeekPosition {
  const _$SeekPositionImpl({required this.position});

  @override
  final double position;

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
    required TResult Function(String endpoint) getVideo,
    required TResult Function(bool showControl) showControl,
    required TResult Function(double position) seekPosition,
    required TResult Function(String mirror) changeResolution,
    required TResult Function(String endpoint) changeEpisode,
    required TResult Function(bool buffering) setBuffering,
    required TResult Function(bool isPlay) playVideo,
    required TResult Function(VideoModel video) addHistory,
    required TResult Function(int position, int duration) setPosition,
  }) {
    return seekPosition(position);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String endpoint)? getVideo,
    TResult? Function(bool showControl)? showControl,
    TResult? Function(double position)? seekPosition,
    TResult? Function(String mirror)? changeResolution,
    TResult? Function(String endpoint)? changeEpisode,
    TResult? Function(bool buffering)? setBuffering,
    TResult? Function(bool isPlay)? playVideo,
    TResult? Function(VideoModel video)? addHistory,
    TResult? Function(int position, int duration)? setPosition,
  }) {
    return seekPosition?.call(position);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String endpoint)? getVideo,
    TResult Function(bool showControl)? showControl,
    TResult Function(double position)? seekPosition,
    TResult Function(String mirror)? changeResolution,
    TResult Function(String endpoint)? changeEpisode,
    TResult Function(bool buffering)? setBuffering,
    TResult Function(bool isPlay)? playVideo,
    TResult Function(VideoModel video)? addHistory,
    TResult Function(int position, int duration)? setPosition,
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
    required TResult Function(_GetVideo value) getVideo,
    required TResult Function(_ShowControl value) showControl,
    required TResult Function(_SeekPosition value) seekPosition,
    required TResult Function(_ChangeResolution value) changeResolution,
    required TResult Function(_ChangeEpisode value) changeEpisode,
    required TResult Function(_SetBuffering value) setBuffering,
    required TResult Function(_PlayVideo value) playVideo,
    required TResult Function(_AddHistory value) addHistory,
    required TResult Function(_SetPosition value) setPosition,
  }) {
    return seekPosition(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetVideo value)? getVideo,
    TResult? Function(_ShowControl value)? showControl,
    TResult? Function(_SeekPosition value)? seekPosition,
    TResult? Function(_ChangeResolution value)? changeResolution,
    TResult? Function(_ChangeEpisode value)? changeEpisode,
    TResult? Function(_SetBuffering value)? setBuffering,
    TResult? Function(_PlayVideo value)? playVideo,
    TResult? Function(_AddHistory value)? addHistory,
    TResult? Function(_SetPosition value)? setPosition,
  }) {
    return seekPosition?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetVideo value)? getVideo,
    TResult Function(_ShowControl value)? showControl,
    TResult Function(_SeekPosition value)? seekPosition,
    TResult Function(_ChangeResolution value)? changeResolution,
    TResult Function(_ChangeEpisode value)? changeEpisode,
    TResult Function(_SetBuffering value)? setBuffering,
    TResult Function(_PlayVideo value)? playVideo,
    TResult Function(_AddHistory value)? addHistory,
    TResult Function(_SetPosition value)? setPosition,
    required TResult orElse(),
  }) {
    if (seekPosition != null) {
      return seekPosition(this);
    }
    return orElse();
  }
}

abstract class _SeekPosition implements AnimeVideoEvent {
  const factory _SeekPosition({required final double position}) =
      _$SeekPositionImpl;

  double get position;
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
    required TResult Function(String endpoint) getVideo,
    required TResult Function(bool showControl) showControl,
    required TResult Function(double position) seekPosition,
    required TResult Function(String mirror) changeResolution,
    required TResult Function(String endpoint) changeEpisode,
    required TResult Function(bool buffering) setBuffering,
    required TResult Function(bool isPlay) playVideo,
    required TResult Function(VideoModel video) addHistory,
    required TResult Function(int position, int duration) setPosition,
  }) {
    return changeResolution(mirror);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String endpoint)? getVideo,
    TResult? Function(bool showControl)? showControl,
    TResult? Function(double position)? seekPosition,
    TResult? Function(String mirror)? changeResolution,
    TResult? Function(String endpoint)? changeEpisode,
    TResult? Function(bool buffering)? setBuffering,
    TResult? Function(bool isPlay)? playVideo,
    TResult? Function(VideoModel video)? addHistory,
    TResult? Function(int position, int duration)? setPosition,
  }) {
    return changeResolution?.call(mirror);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String endpoint)? getVideo,
    TResult Function(bool showControl)? showControl,
    TResult Function(double position)? seekPosition,
    TResult Function(String mirror)? changeResolution,
    TResult Function(String endpoint)? changeEpisode,
    TResult Function(bool buffering)? setBuffering,
    TResult Function(bool isPlay)? playVideo,
    TResult Function(VideoModel video)? addHistory,
    TResult Function(int position, int duration)? setPosition,
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
    required TResult Function(_GetVideo value) getVideo,
    required TResult Function(_ShowControl value) showControl,
    required TResult Function(_SeekPosition value) seekPosition,
    required TResult Function(_ChangeResolution value) changeResolution,
    required TResult Function(_ChangeEpisode value) changeEpisode,
    required TResult Function(_SetBuffering value) setBuffering,
    required TResult Function(_PlayVideo value) playVideo,
    required TResult Function(_AddHistory value) addHistory,
    required TResult Function(_SetPosition value) setPosition,
  }) {
    return changeResolution(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetVideo value)? getVideo,
    TResult? Function(_ShowControl value)? showControl,
    TResult? Function(_SeekPosition value)? seekPosition,
    TResult? Function(_ChangeResolution value)? changeResolution,
    TResult? Function(_ChangeEpisode value)? changeEpisode,
    TResult? Function(_SetBuffering value)? setBuffering,
    TResult? Function(_PlayVideo value)? playVideo,
    TResult? Function(_AddHistory value)? addHistory,
    TResult? Function(_SetPosition value)? setPosition,
  }) {
    return changeResolution?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetVideo value)? getVideo,
    TResult Function(_ShowControl value)? showControl,
    TResult Function(_SeekPosition value)? seekPosition,
    TResult Function(_ChangeResolution value)? changeResolution,
    TResult Function(_ChangeEpisode value)? changeEpisode,
    TResult Function(_SetBuffering value)? setBuffering,
    TResult Function(_PlayVideo value)? playVideo,
    TResult Function(_AddHistory value)? addHistory,
    TResult Function(_SetPosition value)? setPosition,
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
abstract class _$$ChangeEpisodeImplCopyWith<$Res> {
  factory _$$ChangeEpisodeImplCopyWith(
          _$ChangeEpisodeImpl value, $Res Function(_$ChangeEpisodeImpl) then) =
      __$$ChangeEpisodeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String endpoint});
}

/// @nodoc
class __$$ChangeEpisodeImplCopyWithImpl<$Res>
    extends _$AnimeVideoEventCopyWithImpl<$Res, _$ChangeEpisodeImpl>
    implements _$$ChangeEpisodeImplCopyWith<$Res> {
  __$$ChangeEpisodeImplCopyWithImpl(
      _$ChangeEpisodeImpl _value, $Res Function(_$ChangeEpisodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? endpoint = null,
  }) {
    return _then(_$ChangeEpisodeImpl(
      endpoint: null == endpoint
          ? _value.endpoint
          : endpoint // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChangeEpisodeImpl implements _ChangeEpisode {
  const _$ChangeEpisodeImpl({required this.endpoint});

  @override
  final String endpoint;

  @override
  String toString() {
    return 'AnimeVideoEvent.changeEpisode(endpoint: $endpoint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeEpisodeImpl &&
            (identical(other.endpoint, endpoint) ||
                other.endpoint == endpoint));
  }

  @override
  int get hashCode => Object.hash(runtimeType, endpoint);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeEpisodeImplCopyWith<_$ChangeEpisodeImpl> get copyWith =>
      __$$ChangeEpisodeImplCopyWithImpl<_$ChangeEpisodeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String endpoint) getVideo,
    required TResult Function(bool showControl) showControl,
    required TResult Function(double position) seekPosition,
    required TResult Function(String mirror) changeResolution,
    required TResult Function(String endpoint) changeEpisode,
    required TResult Function(bool buffering) setBuffering,
    required TResult Function(bool isPlay) playVideo,
    required TResult Function(VideoModel video) addHistory,
    required TResult Function(int position, int duration) setPosition,
  }) {
    return changeEpisode(endpoint);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String endpoint)? getVideo,
    TResult? Function(bool showControl)? showControl,
    TResult? Function(double position)? seekPosition,
    TResult? Function(String mirror)? changeResolution,
    TResult? Function(String endpoint)? changeEpisode,
    TResult? Function(bool buffering)? setBuffering,
    TResult? Function(bool isPlay)? playVideo,
    TResult? Function(VideoModel video)? addHistory,
    TResult? Function(int position, int duration)? setPosition,
  }) {
    return changeEpisode?.call(endpoint);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String endpoint)? getVideo,
    TResult Function(bool showControl)? showControl,
    TResult Function(double position)? seekPosition,
    TResult Function(String mirror)? changeResolution,
    TResult Function(String endpoint)? changeEpisode,
    TResult Function(bool buffering)? setBuffering,
    TResult Function(bool isPlay)? playVideo,
    TResult Function(VideoModel video)? addHistory,
    TResult Function(int position, int duration)? setPosition,
    required TResult orElse(),
  }) {
    if (changeEpisode != null) {
      return changeEpisode(endpoint);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetVideo value) getVideo,
    required TResult Function(_ShowControl value) showControl,
    required TResult Function(_SeekPosition value) seekPosition,
    required TResult Function(_ChangeResolution value) changeResolution,
    required TResult Function(_ChangeEpisode value) changeEpisode,
    required TResult Function(_SetBuffering value) setBuffering,
    required TResult Function(_PlayVideo value) playVideo,
    required TResult Function(_AddHistory value) addHistory,
    required TResult Function(_SetPosition value) setPosition,
  }) {
    return changeEpisode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetVideo value)? getVideo,
    TResult? Function(_ShowControl value)? showControl,
    TResult? Function(_SeekPosition value)? seekPosition,
    TResult? Function(_ChangeResolution value)? changeResolution,
    TResult? Function(_ChangeEpisode value)? changeEpisode,
    TResult? Function(_SetBuffering value)? setBuffering,
    TResult? Function(_PlayVideo value)? playVideo,
    TResult? Function(_AddHistory value)? addHistory,
    TResult? Function(_SetPosition value)? setPosition,
  }) {
    return changeEpisode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetVideo value)? getVideo,
    TResult Function(_ShowControl value)? showControl,
    TResult Function(_SeekPosition value)? seekPosition,
    TResult Function(_ChangeResolution value)? changeResolution,
    TResult Function(_ChangeEpisode value)? changeEpisode,
    TResult Function(_SetBuffering value)? setBuffering,
    TResult Function(_PlayVideo value)? playVideo,
    TResult Function(_AddHistory value)? addHistory,
    TResult Function(_SetPosition value)? setPosition,
    required TResult orElse(),
  }) {
    if (changeEpisode != null) {
      return changeEpisode(this);
    }
    return orElse();
  }
}

abstract class _ChangeEpisode implements AnimeVideoEvent {
  const factory _ChangeEpisode({required final String endpoint}) =
      _$ChangeEpisodeImpl;

  String get endpoint;
  @JsonKey(ignore: true)
  _$$ChangeEpisodeImplCopyWith<_$ChangeEpisodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetBufferingImplCopyWith<$Res> {
  factory _$$SetBufferingImplCopyWith(
          _$SetBufferingImpl value, $Res Function(_$SetBufferingImpl) then) =
      __$$SetBufferingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool buffering});
}

/// @nodoc
class __$$SetBufferingImplCopyWithImpl<$Res>
    extends _$AnimeVideoEventCopyWithImpl<$Res, _$SetBufferingImpl>
    implements _$$SetBufferingImplCopyWith<$Res> {
  __$$SetBufferingImplCopyWithImpl(
      _$SetBufferingImpl _value, $Res Function(_$SetBufferingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? buffering = null,
  }) {
    return _then(_$SetBufferingImpl(
      buffering: null == buffering
          ? _value.buffering
          : buffering // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SetBufferingImpl implements _SetBuffering {
  const _$SetBufferingImpl({required this.buffering});

  @override
  final bool buffering;

  @override
  String toString() {
    return 'AnimeVideoEvent.setBuffering(buffering: $buffering)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetBufferingImpl &&
            (identical(other.buffering, buffering) ||
                other.buffering == buffering));
  }

  @override
  int get hashCode => Object.hash(runtimeType, buffering);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetBufferingImplCopyWith<_$SetBufferingImpl> get copyWith =>
      __$$SetBufferingImplCopyWithImpl<_$SetBufferingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String endpoint) getVideo,
    required TResult Function(bool showControl) showControl,
    required TResult Function(double position) seekPosition,
    required TResult Function(String mirror) changeResolution,
    required TResult Function(String endpoint) changeEpisode,
    required TResult Function(bool buffering) setBuffering,
    required TResult Function(bool isPlay) playVideo,
    required TResult Function(VideoModel video) addHistory,
    required TResult Function(int position, int duration) setPosition,
  }) {
    return setBuffering(buffering);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String endpoint)? getVideo,
    TResult? Function(bool showControl)? showControl,
    TResult? Function(double position)? seekPosition,
    TResult? Function(String mirror)? changeResolution,
    TResult? Function(String endpoint)? changeEpisode,
    TResult? Function(bool buffering)? setBuffering,
    TResult? Function(bool isPlay)? playVideo,
    TResult? Function(VideoModel video)? addHistory,
    TResult? Function(int position, int duration)? setPosition,
  }) {
    return setBuffering?.call(buffering);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String endpoint)? getVideo,
    TResult Function(bool showControl)? showControl,
    TResult Function(double position)? seekPosition,
    TResult Function(String mirror)? changeResolution,
    TResult Function(String endpoint)? changeEpisode,
    TResult Function(bool buffering)? setBuffering,
    TResult Function(bool isPlay)? playVideo,
    TResult Function(VideoModel video)? addHistory,
    TResult Function(int position, int duration)? setPosition,
    required TResult orElse(),
  }) {
    if (setBuffering != null) {
      return setBuffering(buffering);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetVideo value) getVideo,
    required TResult Function(_ShowControl value) showControl,
    required TResult Function(_SeekPosition value) seekPosition,
    required TResult Function(_ChangeResolution value) changeResolution,
    required TResult Function(_ChangeEpisode value) changeEpisode,
    required TResult Function(_SetBuffering value) setBuffering,
    required TResult Function(_PlayVideo value) playVideo,
    required TResult Function(_AddHistory value) addHistory,
    required TResult Function(_SetPosition value) setPosition,
  }) {
    return setBuffering(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetVideo value)? getVideo,
    TResult? Function(_ShowControl value)? showControl,
    TResult? Function(_SeekPosition value)? seekPosition,
    TResult? Function(_ChangeResolution value)? changeResolution,
    TResult? Function(_ChangeEpisode value)? changeEpisode,
    TResult? Function(_SetBuffering value)? setBuffering,
    TResult? Function(_PlayVideo value)? playVideo,
    TResult? Function(_AddHistory value)? addHistory,
    TResult? Function(_SetPosition value)? setPosition,
  }) {
    return setBuffering?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetVideo value)? getVideo,
    TResult Function(_ShowControl value)? showControl,
    TResult Function(_SeekPosition value)? seekPosition,
    TResult Function(_ChangeResolution value)? changeResolution,
    TResult Function(_ChangeEpisode value)? changeEpisode,
    TResult Function(_SetBuffering value)? setBuffering,
    TResult Function(_PlayVideo value)? playVideo,
    TResult Function(_AddHistory value)? addHistory,
    TResult Function(_SetPosition value)? setPosition,
    required TResult orElse(),
  }) {
    if (setBuffering != null) {
      return setBuffering(this);
    }
    return orElse();
  }
}

abstract class _SetBuffering implements AnimeVideoEvent {
  const factory _SetBuffering({required final bool buffering}) =
      _$SetBufferingImpl;

  bool get buffering;
  @JsonKey(ignore: true)
  _$$SetBufferingImplCopyWith<_$SetBufferingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PlayVideoImplCopyWith<$Res> {
  factory _$$PlayVideoImplCopyWith(
          _$PlayVideoImpl value, $Res Function(_$PlayVideoImpl) then) =
      __$$PlayVideoImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isPlay});
}

/// @nodoc
class __$$PlayVideoImplCopyWithImpl<$Res>
    extends _$AnimeVideoEventCopyWithImpl<$Res, _$PlayVideoImpl>
    implements _$$PlayVideoImplCopyWith<$Res> {
  __$$PlayVideoImplCopyWithImpl(
      _$PlayVideoImpl _value, $Res Function(_$PlayVideoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPlay = null,
  }) {
    return _then(_$PlayVideoImpl(
      isPlay: null == isPlay
          ? _value.isPlay
          : isPlay // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PlayVideoImpl implements _PlayVideo {
  const _$PlayVideoImpl({required this.isPlay});

  @override
  final bool isPlay;

  @override
  String toString() {
    return 'AnimeVideoEvent.playVideo(isPlay: $isPlay)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayVideoImpl &&
            (identical(other.isPlay, isPlay) || other.isPlay == isPlay));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isPlay);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayVideoImplCopyWith<_$PlayVideoImpl> get copyWith =>
      __$$PlayVideoImplCopyWithImpl<_$PlayVideoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String endpoint) getVideo,
    required TResult Function(bool showControl) showControl,
    required TResult Function(double position) seekPosition,
    required TResult Function(String mirror) changeResolution,
    required TResult Function(String endpoint) changeEpisode,
    required TResult Function(bool buffering) setBuffering,
    required TResult Function(bool isPlay) playVideo,
    required TResult Function(VideoModel video) addHistory,
    required TResult Function(int position, int duration) setPosition,
  }) {
    return playVideo(isPlay);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String endpoint)? getVideo,
    TResult? Function(bool showControl)? showControl,
    TResult? Function(double position)? seekPosition,
    TResult? Function(String mirror)? changeResolution,
    TResult? Function(String endpoint)? changeEpisode,
    TResult? Function(bool buffering)? setBuffering,
    TResult? Function(bool isPlay)? playVideo,
    TResult? Function(VideoModel video)? addHistory,
    TResult? Function(int position, int duration)? setPosition,
  }) {
    return playVideo?.call(isPlay);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String endpoint)? getVideo,
    TResult Function(bool showControl)? showControl,
    TResult Function(double position)? seekPosition,
    TResult Function(String mirror)? changeResolution,
    TResult Function(String endpoint)? changeEpisode,
    TResult Function(bool buffering)? setBuffering,
    TResult Function(bool isPlay)? playVideo,
    TResult Function(VideoModel video)? addHistory,
    TResult Function(int position, int duration)? setPosition,
    required TResult orElse(),
  }) {
    if (playVideo != null) {
      return playVideo(isPlay);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetVideo value) getVideo,
    required TResult Function(_ShowControl value) showControl,
    required TResult Function(_SeekPosition value) seekPosition,
    required TResult Function(_ChangeResolution value) changeResolution,
    required TResult Function(_ChangeEpisode value) changeEpisode,
    required TResult Function(_SetBuffering value) setBuffering,
    required TResult Function(_PlayVideo value) playVideo,
    required TResult Function(_AddHistory value) addHistory,
    required TResult Function(_SetPosition value) setPosition,
  }) {
    return playVideo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetVideo value)? getVideo,
    TResult? Function(_ShowControl value)? showControl,
    TResult? Function(_SeekPosition value)? seekPosition,
    TResult? Function(_ChangeResolution value)? changeResolution,
    TResult? Function(_ChangeEpisode value)? changeEpisode,
    TResult? Function(_SetBuffering value)? setBuffering,
    TResult? Function(_PlayVideo value)? playVideo,
    TResult? Function(_AddHistory value)? addHistory,
    TResult? Function(_SetPosition value)? setPosition,
  }) {
    return playVideo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetVideo value)? getVideo,
    TResult Function(_ShowControl value)? showControl,
    TResult Function(_SeekPosition value)? seekPosition,
    TResult Function(_ChangeResolution value)? changeResolution,
    TResult Function(_ChangeEpisode value)? changeEpisode,
    TResult Function(_SetBuffering value)? setBuffering,
    TResult Function(_PlayVideo value)? playVideo,
    TResult Function(_AddHistory value)? addHistory,
    TResult Function(_SetPosition value)? setPosition,
    required TResult orElse(),
  }) {
    if (playVideo != null) {
      return playVideo(this);
    }
    return orElse();
  }
}

abstract class _PlayVideo implements AnimeVideoEvent {
  const factory _PlayVideo({required final bool isPlay}) = _$PlayVideoImpl;

  bool get isPlay;
  @JsonKey(ignore: true)
  _$$PlayVideoImplCopyWith<_$PlayVideoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddHistoryImplCopyWith<$Res> {
  factory _$$AddHistoryImplCopyWith(
          _$AddHistoryImpl value, $Res Function(_$AddHistoryImpl) then) =
      __$$AddHistoryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({VideoModel video});

  $VideoModelCopyWith<$Res> get video;
}

/// @nodoc
class __$$AddHistoryImplCopyWithImpl<$Res>
    extends _$AnimeVideoEventCopyWithImpl<$Res, _$AddHistoryImpl>
    implements _$$AddHistoryImplCopyWith<$Res> {
  __$$AddHistoryImplCopyWithImpl(
      _$AddHistoryImpl _value, $Res Function(_$AddHistoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? video = null,
  }) {
    return _then(_$AddHistoryImpl(
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

class _$AddHistoryImpl implements _AddHistory {
  const _$AddHistoryImpl({required this.video});

  @override
  final VideoModel video;

  @override
  String toString() {
    return 'AnimeVideoEvent.addHistory(video: $video)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddHistoryImpl &&
            (identical(other.video, video) || other.video == video));
  }

  @override
  int get hashCode => Object.hash(runtimeType, video);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddHistoryImplCopyWith<_$AddHistoryImpl> get copyWith =>
      __$$AddHistoryImplCopyWithImpl<_$AddHistoryImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String endpoint) getVideo,
    required TResult Function(bool showControl) showControl,
    required TResult Function(double position) seekPosition,
    required TResult Function(String mirror) changeResolution,
    required TResult Function(String endpoint) changeEpisode,
    required TResult Function(bool buffering) setBuffering,
    required TResult Function(bool isPlay) playVideo,
    required TResult Function(VideoModel video) addHistory,
    required TResult Function(int position, int duration) setPosition,
  }) {
    return addHistory(video);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String endpoint)? getVideo,
    TResult? Function(bool showControl)? showControl,
    TResult? Function(double position)? seekPosition,
    TResult? Function(String mirror)? changeResolution,
    TResult? Function(String endpoint)? changeEpisode,
    TResult? Function(bool buffering)? setBuffering,
    TResult? Function(bool isPlay)? playVideo,
    TResult? Function(VideoModel video)? addHistory,
    TResult? Function(int position, int duration)? setPosition,
  }) {
    return addHistory?.call(video);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String endpoint)? getVideo,
    TResult Function(bool showControl)? showControl,
    TResult Function(double position)? seekPosition,
    TResult Function(String mirror)? changeResolution,
    TResult Function(String endpoint)? changeEpisode,
    TResult Function(bool buffering)? setBuffering,
    TResult Function(bool isPlay)? playVideo,
    TResult Function(VideoModel video)? addHistory,
    TResult Function(int position, int duration)? setPosition,
    required TResult orElse(),
  }) {
    if (addHistory != null) {
      return addHistory(video);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetVideo value) getVideo,
    required TResult Function(_ShowControl value) showControl,
    required TResult Function(_SeekPosition value) seekPosition,
    required TResult Function(_ChangeResolution value) changeResolution,
    required TResult Function(_ChangeEpisode value) changeEpisode,
    required TResult Function(_SetBuffering value) setBuffering,
    required TResult Function(_PlayVideo value) playVideo,
    required TResult Function(_AddHistory value) addHistory,
    required TResult Function(_SetPosition value) setPosition,
  }) {
    return addHistory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetVideo value)? getVideo,
    TResult? Function(_ShowControl value)? showControl,
    TResult? Function(_SeekPosition value)? seekPosition,
    TResult? Function(_ChangeResolution value)? changeResolution,
    TResult? Function(_ChangeEpisode value)? changeEpisode,
    TResult? Function(_SetBuffering value)? setBuffering,
    TResult? Function(_PlayVideo value)? playVideo,
    TResult? Function(_AddHistory value)? addHistory,
    TResult? Function(_SetPosition value)? setPosition,
  }) {
    return addHistory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetVideo value)? getVideo,
    TResult Function(_ShowControl value)? showControl,
    TResult Function(_SeekPosition value)? seekPosition,
    TResult Function(_ChangeResolution value)? changeResolution,
    TResult Function(_ChangeEpisode value)? changeEpisode,
    TResult Function(_SetBuffering value)? setBuffering,
    TResult Function(_PlayVideo value)? playVideo,
    TResult Function(_AddHistory value)? addHistory,
    TResult Function(_SetPosition value)? setPosition,
    required TResult orElse(),
  }) {
    if (addHistory != null) {
      return addHistory(this);
    }
    return orElse();
  }
}

abstract class _AddHistory implements AnimeVideoEvent {
  const factory _AddHistory({required final VideoModel video}) =
      _$AddHistoryImpl;

  VideoModel get video;
  @JsonKey(ignore: true)
  _$$AddHistoryImplCopyWith<_$AddHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetPositionImplCopyWith<$Res> {
  factory _$$SetPositionImplCopyWith(
          _$SetPositionImpl value, $Res Function(_$SetPositionImpl) then) =
      __$$SetPositionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int position, int duration});
}

/// @nodoc
class __$$SetPositionImplCopyWithImpl<$Res>
    extends _$AnimeVideoEventCopyWithImpl<$Res, _$SetPositionImpl>
    implements _$$SetPositionImplCopyWith<$Res> {
  __$$SetPositionImplCopyWithImpl(
      _$SetPositionImpl _value, $Res Function(_$SetPositionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
    Object? duration = null,
  }) {
    return _then(_$SetPositionImpl(
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SetPositionImpl implements _SetPosition {
  const _$SetPositionImpl({required this.position, required this.duration});

  @override
  final int position;
  @override
  final int duration;

  @override
  String toString() {
    return 'AnimeVideoEvent.setPosition(position: $position, duration: $duration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetPositionImpl &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @override
  int get hashCode => Object.hash(runtimeType, position, duration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetPositionImplCopyWith<_$SetPositionImpl> get copyWith =>
      __$$SetPositionImplCopyWithImpl<_$SetPositionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String endpoint) getVideo,
    required TResult Function(bool showControl) showControl,
    required TResult Function(double position) seekPosition,
    required TResult Function(String mirror) changeResolution,
    required TResult Function(String endpoint) changeEpisode,
    required TResult Function(bool buffering) setBuffering,
    required TResult Function(bool isPlay) playVideo,
    required TResult Function(VideoModel video) addHistory,
    required TResult Function(int position, int duration) setPosition,
  }) {
    return setPosition(position, duration);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String endpoint)? getVideo,
    TResult? Function(bool showControl)? showControl,
    TResult? Function(double position)? seekPosition,
    TResult? Function(String mirror)? changeResolution,
    TResult? Function(String endpoint)? changeEpisode,
    TResult? Function(bool buffering)? setBuffering,
    TResult? Function(bool isPlay)? playVideo,
    TResult? Function(VideoModel video)? addHistory,
    TResult? Function(int position, int duration)? setPosition,
  }) {
    return setPosition?.call(position, duration);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String endpoint)? getVideo,
    TResult Function(bool showControl)? showControl,
    TResult Function(double position)? seekPosition,
    TResult Function(String mirror)? changeResolution,
    TResult Function(String endpoint)? changeEpisode,
    TResult Function(bool buffering)? setBuffering,
    TResult Function(bool isPlay)? playVideo,
    TResult Function(VideoModel video)? addHistory,
    TResult Function(int position, int duration)? setPosition,
    required TResult orElse(),
  }) {
    if (setPosition != null) {
      return setPosition(position, duration);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetVideo value) getVideo,
    required TResult Function(_ShowControl value) showControl,
    required TResult Function(_SeekPosition value) seekPosition,
    required TResult Function(_ChangeResolution value) changeResolution,
    required TResult Function(_ChangeEpisode value) changeEpisode,
    required TResult Function(_SetBuffering value) setBuffering,
    required TResult Function(_PlayVideo value) playVideo,
    required TResult Function(_AddHistory value) addHistory,
    required TResult Function(_SetPosition value) setPosition,
  }) {
    return setPosition(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetVideo value)? getVideo,
    TResult? Function(_ShowControl value)? showControl,
    TResult? Function(_SeekPosition value)? seekPosition,
    TResult? Function(_ChangeResolution value)? changeResolution,
    TResult? Function(_ChangeEpisode value)? changeEpisode,
    TResult? Function(_SetBuffering value)? setBuffering,
    TResult? Function(_PlayVideo value)? playVideo,
    TResult? Function(_AddHistory value)? addHistory,
    TResult? Function(_SetPosition value)? setPosition,
  }) {
    return setPosition?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetVideo value)? getVideo,
    TResult Function(_ShowControl value)? showControl,
    TResult Function(_SeekPosition value)? seekPosition,
    TResult Function(_ChangeResolution value)? changeResolution,
    TResult Function(_ChangeEpisode value)? changeEpisode,
    TResult Function(_SetBuffering value)? setBuffering,
    TResult Function(_PlayVideo value)? playVideo,
    TResult Function(_AddHistory value)? addHistory,
    TResult Function(_SetPosition value)? setPosition,
    required TResult orElse(),
  }) {
    if (setPosition != null) {
      return setPosition(this);
    }
    return orElse();
  }
}

abstract class _SetPosition implements AnimeVideoEvent {
  const factory _SetPosition(
      {required final int position,
      required final int duration}) = _$SetPositionImpl;

  int get position;
  int get duration;
  @JsonKey(ignore: true)
  _$$SetPositionImplCopyWith<_$SetPositionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AnimeVideoState {
  bool get initialize => throw _privateConstructorUsedError;
  bool get error => throw _privateConstructorUsedError;
  String get mirror => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  bool get buffering => throw _privateConstructorUsedError;
  bool get showControll => throw _privateConstructorUsedError;
  bool get playing => throw _privateConstructorUsedError;
  bool get backward => throw _privateConstructorUsedError;
  bool get forward => throw _privateConstructorUsedError;
  int get videoDuration => throw _privateConstructorUsedError;
  int get videoPosition => throw _privateConstructorUsedError;
  double get sliderPosition => throw _privateConstructorUsedError;
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
      {bool initialize,
      bool error,
      String mirror,
      bool loading,
      bool buffering,
      bool showControll,
      bool playing,
      bool backward,
      bool forward,
      int videoDuration,
      int videoPosition,
      double sliderPosition,
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
    Object? initialize = null,
    Object? error = null,
    Object? mirror = null,
    Object? loading = null,
    Object? buffering = null,
    Object? showControll = null,
    Object? playing = null,
    Object? backward = null,
    Object? forward = null,
    Object? videoDuration = null,
    Object? videoPosition = null,
    Object? sliderPosition = null,
    Object? videoList = null,
    Object? episodeList = null,
  }) {
    return _then(_value.copyWith(
      initialize: null == initialize
          ? _value.initialize
          : initialize // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      mirror: null == mirror
          ? _value.mirror
          : mirror // ignore: cast_nullable_to_non_nullable
              as String,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      buffering: null == buffering
          ? _value.buffering
          : buffering // ignore: cast_nullable_to_non_nullable
              as bool,
      showControll: null == showControll
          ? _value.showControll
          : showControll // ignore: cast_nullable_to_non_nullable
              as bool,
      playing: null == playing
          ? _value.playing
          : playing // ignore: cast_nullable_to_non_nullable
              as bool,
      backward: null == backward
          ? _value.backward
          : backward // ignore: cast_nullable_to_non_nullable
              as bool,
      forward: null == forward
          ? _value.forward
          : forward // ignore: cast_nullable_to_non_nullable
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
              as double,
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
      {bool initialize,
      bool error,
      String mirror,
      bool loading,
      bool buffering,
      bool showControll,
      bool playing,
      bool backward,
      bool forward,
      int videoDuration,
      int videoPosition,
      double sliderPosition,
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
    Object? initialize = null,
    Object? error = null,
    Object? mirror = null,
    Object? loading = null,
    Object? buffering = null,
    Object? showControll = null,
    Object? playing = null,
    Object? backward = null,
    Object? forward = null,
    Object? videoDuration = null,
    Object? videoPosition = null,
    Object? sliderPosition = null,
    Object? videoList = null,
    Object? episodeList = null,
  }) {
    return _then(_$AnimeVideoStateImpl(
      initialize: null == initialize
          ? _value.initialize
          : initialize // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      mirror: null == mirror
          ? _value.mirror
          : mirror // ignore: cast_nullable_to_non_nullable
              as String,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      buffering: null == buffering
          ? _value.buffering
          : buffering // ignore: cast_nullable_to_non_nullable
              as bool,
      showControll: null == showControll
          ? _value.showControll
          : showControll // ignore: cast_nullable_to_non_nullable
              as bool,
      playing: null == playing
          ? _value.playing
          : playing // ignore: cast_nullable_to_non_nullable
              as bool,
      backward: null == backward
          ? _value.backward
          : backward // ignore: cast_nullable_to_non_nullable
              as bool,
      forward: null == forward
          ? _value.forward
          : forward // ignore: cast_nullable_to_non_nullable
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
              as double,
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
      {required this.initialize,
      required this.error,
      required this.mirror,
      required this.loading,
      required this.buffering,
      required this.showControll,
      required this.playing,
      required this.backward,
      required this.forward,
      required this.videoDuration,
      required this.videoPosition,
      required this.sliderPosition,
      required final List<VideoModel> videoList,
      required final List<EpisodeModel> episodeList})
      : _videoList = videoList,
        _episodeList = episodeList,
        super._();

  @override
  final bool initialize;
  @override
  final bool error;
  @override
  final String mirror;
  @override
  final bool loading;
  @override
  final bool buffering;
  @override
  final bool showControll;
  @override
  final bool playing;
  @override
  final bool backward;
  @override
  final bool forward;
  @override
  final int videoDuration;
  @override
  final int videoPosition;
  @override
  final double sliderPosition;
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
    return 'AnimeVideoState(initialize: $initialize, error: $error, mirror: $mirror, loading: $loading, buffering: $buffering, showControll: $showControll, playing: $playing, backward: $backward, forward: $forward, videoDuration: $videoDuration, videoPosition: $videoPosition, sliderPosition: $sliderPosition, videoList: $videoList, episodeList: $episodeList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimeVideoStateImpl &&
            (identical(other.initialize, initialize) ||
                other.initialize == initialize) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.mirror, mirror) || other.mirror == mirror) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.buffering, buffering) ||
                other.buffering == buffering) &&
            (identical(other.showControll, showControll) ||
                other.showControll == showControll) &&
            (identical(other.playing, playing) || other.playing == playing) &&
            (identical(other.backward, backward) ||
                other.backward == backward) &&
            (identical(other.forward, forward) || other.forward == forward) &&
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
      initialize,
      error,
      mirror,
      loading,
      buffering,
      showControll,
      playing,
      backward,
      forward,
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
      {required final bool initialize,
      required final bool error,
      required final String mirror,
      required final bool loading,
      required final bool buffering,
      required final bool showControll,
      required final bool playing,
      required final bool backward,
      required final bool forward,
      required final int videoDuration,
      required final int videoPosition,
      required final double sliderPosition,
      required final List<VideoModel> videoList,
      required final List<EpisodeModel> episodeList}) = _$AnimeVideoStateImpl;
  const _AnimeVideoState._() : super._();

  @override
  bool get initialize;
  @override
  bool get error;
  @override
  String get mirror;
  @override
  bool get loading;
  @override
  bool get buffering;
  @override
  bool get showControll;
  @override
  bool get playing;
  @override
  bool get backward;
  @override
  bool get forward;
  @override
  int get videoDuration;
  @override
  int get videoPosition;
  @override
  double get sliderPosition;
  @override
  List<VideoModel> get videoList;
  @override
  List<EpisodeModel> get episodeList;
  @override
  @JsonKey(ignore: true)
  _$$AnimeVideoStateImplCopyWith<_$AnimeVideoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
