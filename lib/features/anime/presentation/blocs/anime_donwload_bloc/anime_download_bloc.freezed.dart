// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anime_download_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AnimeDownloadEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DownloadParams params) download,
    required TResult Function() getDownload,
    required TResult Function(String taskId) removeDownload,
    required TResult Function(String taskId) cancelDownload,
    required TResult Function(String taskId) cancelAllDownload,
    required TResult Function(String taskId) pauseDownload,
    required TResult Function(String taskId) resumeDownload,
    required TResult Function(String taskId) retryDownload,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DownloadParams params)? download,
    TResult? Function()? getDownload,
    TResult? Function(String taskId)? removeDownload,
    TResult? Function(String taskId)? cancelDownload,
    TResult? Function(String taskId)? cancelAllDownload,
    TResult? Function(String taskId)? pauseDownload,
    TResult? Function(String taskId)? resumeDownload,
    TResult? Function(String taskId)? retryDownload,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DownloadParams params)? download,
    TResult Function()? getDownload,
    TResult Function(String taskId)? removeDownload,
    TResult Function(String taskId)? cancelDownload,
    TResult Function(String taskId)? cancelAllDownload,
    TResult Function(String taskId)? pauseDownload,
    TResult Function(String taskId)? resumeDownload,
    TResult Function(String taskId)? retryDownload,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Download value) download,
    required TResult Function(_GetDownload value) getDownload,
    required TResult Function(_RemoveDownload value) removeDownload,
    required TResult Function(_CancelDownload value) cancelDownload,
    required TResult Function(_CancelAllDownload value) cancelAllDownload,
    required TResult Function(_PauseDownload value) pauseDownload,
    required TResult Function(_ResumeDownload value) resumeDownload,
    required TResult Function(_RetryDownload value) retryDownload,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Download value)? download,
    TResult? Function(_GetDownload value)? getDownload,
    TResult? Function(_RemoveDownload value)? removeDownload,
    TResult? Function(_CancelDownload value)? cancelDownload,
    TResult? Function(_CancelAllDownload value)? cancelAllDownload,
    TResult? Function(_PauseDownload value)? pauseDownload,
    TResult? Function(_ResumeDownload value)? resumeDownload,
    TResult? Function(_RetryDownload value)? retryDownload,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Download value)? download,
    TResult Function(_GetDownload value)? getDownload,
    TResult Function(_RemoveDownload value)? removeDownload,
    TResult Function(_CancelDownload value)? cancelDownload,
    TResult Function(_CancelAllDownload value)? cancelAllDownload,
    TResult Function(_PauseDownload value)? pauseDownload,
    TResult Function(_ResumeDownload value)? resumeDownload,
    TResult Function(_RetryDownload value)? retryDownload,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeDownloadEventCopyWith<$Res> {
  factory $AnimeDownloadEventCopyWith(
          AnimeDownloadEvent value, $Res Function(AnimeDownloadEvent) then) =
      _$AnimeDownloadEventCopyWithImpl<$Res, AnimeDownloadEvent>;
}

/// @nodoc
class _$AnimeDownloadEventCopyWithImpl<$Res, $Val extends AnimeDownloadEvent>
    implements $AnimeDownloadEventCopyWith<$Res> {
  _$AnimeDownloadEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DownloadImplCopyWith<$Res> {
  factory _$$DownloadImplCopyWith(
          _$DownloadImpl value, $Res Function(_$DownloadImpl) then) =
      __$$DownloadImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DownloadParams params});
}

/// @nodoc
class __$$DownloadImplCopyWithImpl<$Res>
    extends _$AnimeDownloadEventCopyWithImpl<$Res, _$DownloadImpl>
    implements _$$DownloadImplCopyWith<$Res> {
  __$$DownloadImplCopyWithImpl(
      _$DownloadImpl _value, $Res Function(_$DownloadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? params = null,
  }) {
    return _then(_$DownloadImpl(
      params: null == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as DownloadParams,
    ));
  }
}

/// @nodoc

class _$DownloadImpl implements _Download {
  const _$DownloadImpl({required this.params});

  @override
  final DownloadParams params;

  @override
  String toString() {
    return 'AnimeDownloadEvent.download(params: $params)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownloadImpl &&
            (identical(other.params, params) || other.params == params));
  }

  @override
  int get hashCode => Object.hash(runtimeType, params);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DownloadImplCopyWith<_$DownloadImpl> get copyWith =>
      __$$DownloadImplCopyWithImpl<_$DownloadImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DownloadParams params) download,
    required TResult Function() getDownload,
    required TResult Function(String taskId) removeDownload,
    required TResult Function(String taskId) cancelDownload,
    required TResult Function(String taskId) cancelAllDownload,
    required TResult Function(String taskId) pauseDownload,
    required TResult Function(String taskId) resumeDownload,
    required TResult Function(String taskId) retryDownload,
  }) {
    return download(params);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DownloadParams params)? download,
    TResult? Function()? getDownload,
    TResult? Function(String taskId)? removeDownload,
    TResult? Function(String taskId)? cancelDownload,
    TResult? Function(String taskId)? cancelAllDownload,
    TResult? Function(String taskId)? pauseDownload,
    TResult? Function(String taskId)? resumeDownload,
    TResult? Function(String taskId)? retryDownload,
  }) {
    return download?.call(params);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DownloadParams params)? download,
    TResult Function()? getDownload,
    TResult Function(String taskId)? removeDownload,
    TResult Function(String taskId)? cancelDownload,
    TResult Function(String taskId)? cancelAllDownload,
    TResult Function(String taskId)? pauseDownload,
    TResult Function(String taskId)? resumeDownload,
    TResult Function(String taskId)? retryDownload,
    required TResult orElse(),
  }) {
    if (download != null) {
      return download(params);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Download value) download,
    required TResult Function(_GetDownload value) getDownload,
    required TResult Function(_RemoveDownload value) removeDownload,
    required TResult Function(_CancelDownload value) cancelDownload,
    required TResult Function(_CancelAllDownload value) cancelAllDownload,
    required TResult Function(_PauseDownload value) pauseDownload,
    required TResult Function(_ResumeDownload value) resumeDownload,
    required TResult Function(_RetryDownload value) retryDownload,
  }) {
    return download(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Download value)? download,
    TResult? Function(_GetDownload value)? getDownload,
    TResult? Function(_RemoveDownload value)? removeDownload,
    TResult? Function(_CancelDownload value)? cancelDownload,
    TResult? Function(_CancelAllDownload value)? cancelAllDownload,
    TResult? Function(_PauseDownload value)? pauseDownload,
    TResult? Function(_ResumeDownload value)? resumeDownload,
    TResult? Function(_RetryDownload value)? retryDownload,
  }) {
    return download?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Download value)? download,
    TResult Function(_GetDownload value)? getDownload,
    TResult Function(_RemoveDownload value)? removeDownload,
    TResult Function(_CancelDownload value)? cancelDownload,
    TResult Function(_CancelAllDownload value)? cancelAllDownload,
    TResult Function(_PauseDownload value)? pauseDownload,
    TResult Function(_ResumeDownload value)? resumeDownload,
    TResult Function(_RetryDownload value)? retryDownload,
    required TResult orElse(),
  }) {
    if (download != null) {
      return download(this);
    }
    return orElse();
  }
}

abstract class _Download implements AnimeDownloadEvent {
  const factory _Download({required final DownloadParams params}) =
      _$DownloadImpl;

  DownloadParams get params;
  @JsonKey(ignore: true)
  _$$DownloadImplCopyWith<_$DownloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetDownloadImplCopyWith<$Res> {
  factory _$$GetDownloadImplCopyWith(
          _$GetDownloadImpl value, $Res Function(_$GetDownloadImpl) then) =
      __$$GetDownloadImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetDownloadImplCopyWithImpl<$Res>
    extends _$AnimeDownloadEventCopyWithImpl<$Res, _$GetDownloadImpl>
    implements _$$GetDownloadImplCopyWith<$Res> {
  __$$GetDownloadImplCopyWithImpl(
      _$GetDownloadImpl _value, $Res Function(_$GetDownloadImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetDownloadImpl implements _GetDownload {
  const _$GetDownloadImpl();

  @override
  String toString() {
    return 'AnimeDownloadEvent.getDownload()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetDownloadImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DownloadParams params) download,
    required TResult Function() getDownload,
    required TResult Function(String taskId) removeDownload,
    required TResult Function(String taskId) cancelDownload,
    required TResult Function(String taskId) cancelAllDownload,
    required TResult Function(String taskId) pauseDownload,
    required TResult Function(String taskId) resumeDownload,
    required TResult Function(String taskId) retryDownload,
  }) {
    return getDownload();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DownloadParams params)? download,
    TResult? Function()? getDownload,
    TResult? Function(String taskId)? removeDownload,
    TResult? Function(String taskId)? cancelDownload,
    TResult? Function(String taskId)? cancelAllDownload,
    TResult? Function(String taskId)? pauseDownload,
    TResult? Function(String taskId)? resumeDownload,
    TResult? Function(String taskId)? retryDownload,
  }) {
    return getDownload?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DownloadParams params)? download,
    TResult Function()? getDownload,
    TResult Function(String taskId)? removeDownload,
    TResult Function(String taskId)? cancelDownload,
    TResult Function(String taskId)? cancelAllDownload,
    TResult Function(String taskId)? pauseDownload,
    TResult Function(String taskId)? resumeDownload,
    TResult Function(String taskId)? retryDownload,
    required TResult orElse(),
  }) {
    if (getDownload != null) {
      return getDownload();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Download value) download,
    required TResult Function(_GetDownload value) getDownload,
    required TResult Function(_RemoveDownload value) removeDownload,
    required TResult Function(_CancelDownload value) cancelDownload,
    required TResult Function(_CancelAllDownload value) cancelAllDownload,
    required TResult Function(_PauseDownload value) pauseDownload,
    required TResult Function(_ResumeDownload value) resumeDownload,
    required TResult Function(_RetryDownload value) retryDownload,
  }) {
    return getDownload(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Download value)? download,
    TResult? Function(_GetDownload value)? getDownload,
    TResult? Function(_RemoveDownload value)? removeDownload,
    TResult? Function(_CancelDownload value)? cancelDownload,
    TResult? Function(_CancelAllDownload value)? cancelAllDownload,
    TResult? Function(_PauseDownload value)? pauseDownload,
    TResult? Function(_ResumeDownload value)? resumeDownload,
    TResult? Function(_RetryDownload value)? retryDownload,
  }) {
    return getDownload?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Download value)? download,
    TResult Function(_GetDownload value)? getDownload,
    TResult Function(_RemoveDownload value)? removeDownload,
    TResult Function(_CancelDownload value)? cancelDownload,
    TResult Function(_CancelAllDownload value)? cancelAllDownload,
    TResult Function(_PauseDownload value)? pauseDownload,
    TResult Function(_ResumeDownload value)? resumeDownload,
    TResult Function(_RetryDownload value)? retryDownload,
    required TResult orElse(),
  }) {
    if (getDownload != null) {
      return getDownload(this);
    }
    return orElse();
  }
}

abstract class _GetDownload implements AnimeDownloadEvent {
  const factory _GetDownload() = _$GetDownloadImpl;
}

/// @nodoc
abstract class _$$RemoveDownloadImplCopyWith<$Res> {
  factory _$$RemoveDownloadImplCopyWith(_$RemoveDownloadImpl value,
          $Res Function(_$RemoveDownloadImpl) then) =
      __$$RemoveDownloadImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String taskId});
}

/// @nodoc
class __$$RemoveDownloadImplCopyWithImpl<$Res>
    extends _$AnimeDownloadEventCopyWithImpl<$Res, _$RemoveDownloadImpl>
    implements _$$RemoveDownloadImplCopyWith<$Res> {
  __$$RemoveDownloadImplCopyWithImpl(
      _$RemoveDownloadImpl _value, $Res Function(_$RemoveDownloadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
  }) {
    return _then(_$RemoveDownloadImpl(
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RemoveDownloadImpl implements _RemoveDownload {
  const _$RemoveDownloadImpl({required this.taskId});

  @override
  final String taskId;

  @override
  String toString() {
    return 'AnimeDownloadEvent.removeDownload(taskId: $taskId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveDownloadImpl &&
            (identical(other.taskId, taskId) || other.taskId == taskId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, taskId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveDownloadImplCopyWith<_$RemoveDownloadImpl> get copyWith =>
      __$$RemoveDownloadImplCopyWithImpl<_$RemoveDownloadImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DownloadParams params) download,
    required TResult Function() getDownload,
    required TResult Function(String taskId) removeDownload,
    required TResult Function(String taskId) cancelDownload,
    required TResult Function(String taskId) cancelAllDownload,
    required TResult Function(String taskId) pauseDownload,
    required TResult Function(String taskId) resumeDownload,
    required TResult Function(String taskId) retryDownload,
  }) {
    return removeDownload(taskId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DownloadParams params)? download,
    TResult? Function()? getDownload,
    TResult? Function(String taskId)? removeDownload,
    TResult? Function(String taskId)? cancelDownload,
    TResult? Function(String taskId)? cancelAllDownload,
    TResult? Function(String taskId)? pauseDownload,
    TResult? Function(String taskId)? resumeDownload,
    TResult? Function(String taskId)? retryDownload,
  }) {
    return removeDownload?.call(taskId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DownloadParams params)? download,
    TResult Function()? getDownload,
    TResult Function(String taskId)? removeDownload,
    TResult Function(String taskId)? cancelDownload,
    TResult Function(String taskId)? cancelAllDownload,
    TResult Function(String taskId)? pauseDownload,
    TResult Function(String taskId)? resumeDownload,
    TResult Function(String taskId)? retryDownload,
    required TResult orElse(),
  }) {
    if (removeDownload != null) {
      return removeDownload(taskId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Download value) download,
    required TResult Function(_GetDownload value) getDownload,
    required TResult Function(_RemoveDownload value) removeDownload,
    required TResult Function(_CancelDownload value) cancelDownload,
    required TResult Function(_CancelAllDownload value) cancelAllDownload,
    required TResult Function(_PauseDownload value) pauseDownload,
    required TResult Function(_ResumeDownload value) resumeDownload,
    required TResult Function(_RetryDownload value) retryDownload,
  }) {
    return removeDownload(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Download value)? download,
    TResult? Function(_GetDownload value)? getDownload,
    TResult? Function(_RemoveDownload value)? removeDownload,
    TResult? Function(_CancelDownload value)? cancelDownload,
    TResult? Function(_CancelAllDownload value)? cancelAllDownload,
    TResult? Function(_PauseDownload value)? pauseDownload,
    TResult? Function(_ResumeDownload value)? resumeDownload,
    TResult? Function(_RetryDownload value)? retryDownload,
  }) {
    return removeDownload?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Download value)? download,
    TResult Function(_GetDownload value)? getDownload,
    TResult Function(_RemoveDownload value)? removeDownload,
    TResult Function(_CancelDownload value)? cancelDownload,
    TResult Function(_CancelAllDownload value)? cancelAllDownload,
    TResult Function(_PauseDownload value)? pauseDownload,
    TResult Function(_ResumeDownload value)? resumeDownload,
    TResult Function(_RetryDownload value)? retryDownload,
    required TResult orElse(),
  }) {
    if (removeDownload != null) {
      return removeDownload(this);
    }
    return orElse();
  }
}

abstract class _RemoveDownload implements AnimeDownloadEvent {
  const factory _RemoveDownload({required final String taskId}) =
      _$RemoveDownloadImpl;

  String get taskId;
  @JsonKey(ignore: true)
  _$$RemoveDownloadImplCopyWith<_$RemoveDownloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CancelDownloadImplCopyWith<$Res> {
  factory _$$CancelDownloadImplCopyWith(_$CancelDownloadImpl value,
          $Res Function(_$CancelDownloadImpl) then) =
      __$$CancelDownloadImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String taskId});
}

/// @nodoc
class __$$CancelDownloadImplCopyWithImpl<$Res>
    extends _$AnimeDownloadEventCopyWithImpl<$Res, _$CancelDownloadImpl>
    implements _$$CancelDownloadImplCopyWith<$Res> {
  __$$CancelDownloadImplCopyWithImpl(
      _$CancelDownloadImpl _value, $Res Function(_$CancelDownloadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
  }) {
    return _then(_$CancelDownloadImpl(
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CancelDownloadImpl implements _CancelDownload {
  const _$CancelDownloadImpl({required this.taskId});

  @override
  final String taskId;

  @override
  String toString() {
    return 'AnimeDownloadEvent.cancelDownload(taskId: $taskId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelDownloadImpl &&
            (identical(other.taskId, taskId) || other.taskId == taskId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, taskId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CancelDownloadImplCopyWith<_$CancelDownloadImpl> get copyWith =>
      __$$CancelDownloadImplCopyWithImpl<_$CancelDownloadImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DownloadParams params) download,
    required TResult Function() getDownload,
    required TResult Function(String taskId) removeDownload,
    required TResult Function(String taskId) cancelDownload,
    required TResult Function(String taskId) cancelAllDownload,
    required TResult Function(String taskId) pauseDownload,
    required TResult Function(String taskId) resumeDownload,
    required TResult Function(String taskId) retryDownload,
  }) {
    return cancelDownload(taskId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DownloadParams params)? download,
    TResult? Function()? getDownload,
    TResult? Function(String taskId)? removeDownload,
    TResult? Function(String taskId)? cancelDownload,
    TResult? Function(String taskId)? cancelAllDownload,
    TResult? Function(String taskId)? pauseDownload,
    TResult? Function(String taskId)? resumeDownload,
    TResult? Function(String taskId)? retryDownload,
  }) {
    return cancelDownload?.call(taskId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DownloadParams params)? download,
    TResult Function()? getDownload,
    TResult Function(String taskId)? removeDownload,
    TResult Function(String taskId)? cancelDownload,
    TResult Function(String taskId)? cancelAllDownload,
    TResult Function(String taskId)? pauseDownload,
    TResult Function(String taskId)? resumeDownload,
    TResult Function(String taskId)? retryDownload,
    required TResult orElse(),
  }) {
    if (cancelDownload != null) {
      return cancelDownload(taskId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Download value) download,
    required TResult Function(_GetDownload value) getDownload,
    required TResult Function(_RemoveDownload value) removeDownload,
    required TResult Function(_CancelDownload value) cancelDownload,
    required TResult Function(_CancelAllDownload value) cancelAllDownload,
    required TResult Function(_PauseDownload value) pauseDownload,
    required TResult Function(_ResumeDownload value) resumeDownload,
    required TResult Function(_RetryDownload value) retryDownload,
  }) {
    return cancelDownload(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Download value)? download,
    TResult? Function(_GetDownload value)? getDownload,
    TResult? Function(_RemoveDownload value)? removeDownload,
    TResult? Function(_CancelDownload value)? cancelDownload,
    TResult? Function(_CancelAllDownload value)? cancelAllDownload,
    TResult? Function(_PauseDownload value)? pauseDownload,
    TResult? Function(_ResumeDownload value)? resumeDownload,
    TResult? Function(_RetryDownload value)? retryDownload,
  }) {
    return cancelDownload?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Download value)? download,
    TResult Function(_GetDownload value)? getDownload,
    TResult Function(_RemoveDownload value)? removeDownload,
    TResult Function(_CancelDownload value)? cancelDownload,
    TResult Function(_CancelAllDownload value)? cancelAllDownload,
    TResult Function(_PauseDownload value)? pauseDownload,
    TResult Function(_ResumeDownload value)? resumeDownload,
    TResult Function(_RetryDownload value)? retryDownload,
    required TResult orElse(),
  }) {
    if (cancelDownload != null) {
      return cancelDownload(this);
    }
    return orElse();
  }
}

abstract class _CancelDownload implements AnimeDownloadEvent {
  const factory _CancelDownload({required final String taskId}) =
      _$CancelDownloadImpl;

  String get taskId;
  @JsonKey(ignore: true)
  _$$CancelDownloadImplCopyWith<_$CancelDownloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CancelAllDownloadImplCopyWith<$Res> {
  factory _$$CancelAllDownloadImplCopyWith(_$CancelAllDownloadImpl value,
          $Res Function(_$CancelAllDownloadImpl) then) =
      __$$CancelAllDownloadImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String taskId});
}

/// @nodoc
class __$$CancelAllDownloadImplCopyWithImpl<$Res>
    extends _$AnimeDownloadEventCopyWithImpl<$Res, _$CancelAllDownloadImpl>
    implements _$$CancelAllDownloadImplCopyWith<$Res> {
  __$$CancelAllDownloadImplCopyWithImpl(_$CancelAllDownloadImpl _value,
      $Res Function(_$CancelAllDownloadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
  }) {
    return _then(_$CancelAllDownloadImpl(
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CancelAllDownloadImpl implements _CancelAllDownload {
  const _$CancelAllDownloadImpl({required this.taskId});

  @override
  final String taskId;

  @override
  String toString() {
    return 'AnimeDownloadEvent.cancelAllDownload(taskId: $taskId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelAllDownloadImpl &&
            (identical(other.taskId, taskId) || other.taskId == taskId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, taskId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CancelAllDownloadImplCopyWith<_$CancelAllDownloadImpl> get copyWith =>
      __$$CancelAllDownloadImplCopyWithImpl<_$CancelAllDownloadImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DownloadParams params) download,
    required TResult Function() getDownload,
    required TResult Function(String taskId) removeDownload,
    required TResult Function(String taskId) cancelDownload,
    required TResult Function(String taskId) cancelAllDownload,
    required TResult Function(String taskId) pauseDownload,
    required TResult Function(String taskId) resumeDownload,
    required TResult Function(String taskId) retryDownload,
  }) {
    return cancelAllDownload(taskId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DownloadParams params)? download,
    TResult? Function()? getDownload,
    TResult? Function(String taskId)? removeDownload,
    TResult? Function(String taskId)? cancelDownload,
    TResult? Function(String taskId)? cancelAllDownload,
    TResult? Function(String taskId)? pauseDownload,
    TResult? Function(String taskId)? resumeDownload,
    TResult? Function(String taskId)? retryDownload,
  }) {
    return cancelAllDownload?.call(taskId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DownloadParams params)? download,
    TResult Function()? getDownload,
    TResult Function(String taskId)? removeDownload,
    TResult Function(String taskId)? cancelDownload,
    TResult Function(String taskId)? cancelAllDownload,
    TResult Function(String taskId)? pauseDownload,
    TResult Function(String taskId)? resumeDownload,
    TResult Function(String taskId)? retryDownload,
    required TResult orElse(),
  }) {
    if (cancelAllDownload != null) {
      return cancelAllDownload(taskId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Download value) download,
    required TResult Function(_GetDownload value) getDownload,
    required TResult Function(_RemoveDownload value) removeDownload,
    required TResult Function(_CancelDownload value) cancelDownload,
    required TResult Function(_CancelAllDownload value) cancelAllDownload,
    required TResult Function(_PauseDownload value) pauseDownload,
    required TResult Function(_ResumeDownload value) resumeDownload,
    required TResult Function(_RetryDownload value) retryDownload,
  }) {
    return cancelAllDownload(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Download value)? download,
    TResult? Function(_GetDownload value)? getDownload,
    TResult? Function(_RemoveDownload value)? removeDownload,
    TResult? Function(_CancelDownload value)? cancelDownload,
    TResult? Function(_CancelAllDownload value)? cancelAllDownload,
    TResult? Function(_PauseDownload value)? pauseDownload,
    TResult? Function(_ResumeDownload value)? resumeDownload,
    TResult? Function(_RetryDownload value)? retryDownload,
  }) {
    return cancelAllDownload?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Download value)? download,
    TResult Function(_GetDownload value)? getDownload,
    TResult Function(_RemoveDownload value)? removeDownload,
    TResult Function(_CancelDownload value)? cancelDownload,
    TResult Function(_CancelAllDownload value)? cancelAllDownload,
    TResult Function(_PauseDownload value)? pauseDownload,
    TResult Function(_ResumeDownload value)? resumeDownload,
    TResult Function(_RetryDownload value)? retryDownload,
    required TResult orElse(),
  }) {
    if (cancelAllDownload != null) {
      return cancelAllDownload(this);
    }
    return orElse();
  }
}

abstract class _CancelAllDownload implements AnimeDownloadEvent {
  const factory _CancelAllDownload({required final String taskId}) =
      _$CancelAllDownloadImpl;

  String get taskId;
  @JsonKey(ignore: true)
  _$$CancelAllDownloadImplCopyWith<_$CancelAllDownloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PauseDownloadImplCopyWith<$Res> {
  factory _$$PauseDownloadImplCopyWith(
          _$PauseDownloadImpl value, $Res Function(_$PauseDownloadImpl) then) =
      __$$PauseDownloadImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String taskId});
}

/// @nodoc
class __$$PauseDownloadImplCopyWithImpl<$Res>
    extends _$AnimeDownloadEventCopyWithImpl<$Res, _$PauseDownloadImpl>
    implements _$$PauseDownloadImplCopyWith<$Res> {
  __$$PauseDownloadImplCopyWithImpl(
      _$PauseDownloadImpl _value, $Res Function(_$PauseDownloadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
  }) {
    return _then(_$PauseDownloadImpl(
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PauseDownloadImpl implements _PauseDownload {
  const _$PauseDownloadImpl({required this.taskId});

  @override
  final String taskId;

  @override
  String toString() {
    return 'AnimeDownloadEvent.pauseDownload(taskId: $taskId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PauseDownloadImpl &&
            (identical(other.taskId, taskId) || other.taskId == taskId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, taskId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PauseDownloadImplCopyWith<_$PauseDownloadImpl> get copyWith =>
      __$$PauseDownloadImplCopyWithImpl<_$PauseDownloadImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DownloadParams params) download,
    required TResult Function() getDownload,
    required TResult Function(String taskId) removeDownload,
    required TResult Function(String taskId) cancelDownload,
    required TResult Function(String taskId) cancelAllDownload,
    required TResult Function(String taskId) pauseDownload,
    required TResult Function(String taskId) resumeDownload,
    required TResult Function(String taskId) retryDownload,
  }) {
    return pauseDownload(taskId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DownloadParams params)? download,
    TResult? Function()? getDownload,
    TResult? Function(String taskId)? removeDownload,
    TResult? Function(String taskId)? cancelDownload,
    TResult? Function(String taskId)? cancelAllDownload,
    TResult? Function(String taskId)? pauseDownload,
    TResult? Function(String taskId)? resumeDownload,
    TResult? Function(String taskId)? retryDownload,
  }) {
    return pauseDownload?.call(taskId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DownloadParams params)? download,
    TResult Function()? getDownload,
    TResult Function(String taskId)? removeDownload,
    TResult Function(String taskId)? cancelDownload,
    TResult Function(String taskId)? cancelAllDownload,
    TResult Function(String taskId)? pauseDownload,
    TResult Function(String taskId)? resumeDownload,
    TResult Function(String taskId)? retryDownload,
    required TResult orElse(),
  }) {
    if (pauseDownload != null) {
      return pauseDownload(taskId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Download value) download,
    required TResult Function(_GetDownload value) getDownload,
    required TResult Function(_RemoveDownload value) removeDownload,
    required TResult Function(_CancelDownload value) cancelDownload,
    required TResult Function(_CancelAllDownload value) cancelAllDownload,
    required TResult Function(_PauseDownload value) pauseDownload,
    required TResult Function(_ResumeDownload value) resumeDownload,
    required TResult Function(_RetryDownload value) retryDownload,
  }) {
    return pauseDownload(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Download value)? download,
    TResult? Function(_GetDownload value)? getDownload,
    TResult? Function(_RemoveDownload value)? removeDownload,
    TResult? Function(_CancelDownload value)? cancelDownload,
    TResult? Function(_CancelAllDownload value)? cancelAllDownload,
    TResult? Function(_PauseDownload value)? pauseDownload,
    TResult? Function(_ResumeDownload value)? resumeDownload,
    TResult? Function(_RetryDownload value)? retryDownload,
  }) {
    return pauseDownload?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Download value)? download,
    TResult Function(_GetDownload value)? getDownload,
    TResult Function(_RemoveDownload value)? removeDownload,
    TResult Function(_CancelDownload value)? cancelDownload,
    TResult Function(_CancelAllDownload value)? cancelAllDownload,
    TResult Function(_PauseDownload value)? pauseDownload,
    TResult Function(_ResumeDownload value)? resumeDownload,
    TResult Function(_RetryDownload value)? retryDownload,
    required TResult orElse(),
  }) {
    if (pauseDownload != null) {
      return pauseDownload(this);
    }
    return orElse();
  }
}

abstract class _PauseDownload implements AnimeDownloadEvent {
  const factory _PauseDownload({required final String taskId}) =
      _$PauseDownloadImpl;

  String get taskId;
  @JsonKey(ignore: true)
  _$$PauseDownloadImplCopyWith<_$PauseDownloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResumeDownloadImplCopyWith<$Res> {
  factory _$$ResumeDownloadImplCopyWith(_$ResumeDownloadImpl value,
          $Res Function(_$ResumeDownloadImpl) then) =
      __$$ResumeDownloadImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String taskId});
}

/// @nodoc
class __$$ResumeDownloadImplCopyWithImpl<$Res>
    extends _$AnimeDownloadEventCopyWithImpl<$Res, _$ResumeDownloadImpl>
    implements _$$ResumeDownloadImplCopyWith<$Res> {
  __$$ResumeDownloadImplCopyWithImpl(
      _$ResumeDownloadImpl _value, $Res Function(_$ResumeDownloadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
  }) {
    return _then(_$ResumeDownloadImpl(
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ResumeDownloadImpl implements _ResumeDownload {
  const _$ResumeDownloadImpl({required this.taskId});

  @override
  final String taskId;

  @override
  String toString() {
    return 'AnimeDownloadEvent.resumeDownload(taskId: $taskId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResumeDownloadImpl &&
            (identical(other.taskId, taskId) || other.taskId == taskId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, taskId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResumeDownloadImplCopyWith<_$ResumeDownloadImpl> get copyWith =>
      __$$ResumeDownloadImplCopyWithImpl<_$ResumeDownloadImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DownloadParams params) download,
    required TResult Function() getDownload,
    required TResult Function(String taskId) removeDownload,
    required TResult Function(String taskId) cancelDownload,
    required TResult Function(String taskId) cancelAllDownload,
    required TResult Function(String taskId) pauseDownload,
    required TResult Function(String taskId) resumeDownload,
    required TResult Function(String taskId) retryDownload,
  }) {
    return resumeDownload(taskId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DownloadParams params)? download,
    TResult? Function()? getDownload,
    TResult? Function(String taskId)? removeDownload,
    TResult? Function(String taskId)? cancelDownload,
    TResult? Function(String taskId)? cancelAllDownload,
    TResult? Function(String taskId)? pauseDownload,
    TResult? Function(String taskId)? resumeDownload,
    TResult? Function(String taskId)? retryDownload,
  }) {
    return resumeDownload?.call(taskId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DownloadParams params)? download,
    TResult Function()? getDownload,
    TResult Function(String taskId)? removeDownload,
    TResult Function(String taskId)? cancelDownload,
    TResult Function(String taskId)? cancelAllDownload,
    TResult Function(String taskId)? pauseDownload,
    TResult Function(String taskId)? resumeDownload,
    TResult Function(String taskId)? retryDownload,
    required TResult orElse(),
  }) {
    if (resumeDownload != null) {
      return resumeDownload(taskId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Download value) download,
    required TResult Function(_GetDownload value) getDownload,
    required TResult Function(_RemoveDownload value) removeDownload,
    required TResult Function(_CancelDownload value) cancelDownload,
    required TResult Function(_CancelAllDownload value) cancelAllDownload,
    required TResult Function(_PauseDownload value) pauseDownload,
    required TResult Function(_ResumeDownload value) resumeDownload,
    required TResult Function(_RetryDownload value) retryDownload,
  }) {
    return resumeDownload(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Download value)? download,
    TResult? Function(_GetDownload value)? getDownload,
    TResult? Function(_RemoveDownload value)? removeDownload,
    TResult? Function(_CancelDownload value)? cancelDownload,
    TResult? Function(_CancelAllDownload value)? cancelAllDownload,
    TResult? Function(_PauseDownload value)? pauseDownload,
    TResult? Function(_ResumeDownload value)? resumeDownload,
    TResult? Function(_RetryDownload value)? retryDownload,
  }) {
    return resumeDownload?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Download value)? download,
    TResult Function(_GetDownload value)? getDownload,
    TResult Function(_RemoveDownload value)? removeDownload,
    TResult Function(_CancelDownload value)? cancelDownload,
    TResult Function(_CancelAllDownload value)? cancelAllDownload,
    TResult Function(_PauseDownload value)? pauseDownload,
    TResult Function(_ResumeDownload value)? resumeDownload,
    TResult Function(_RetryDownload value)? retryDownload,
    required TResult orElse(),
  }) {
    if (resumeDownload != null) {
      return resumeDownload(this);
    }
    return orElse();
  }
}

abstract class _ResumeDownload implements AnimeDownloadEvent {
  const factory _ResumeDownload({required final String taskId}) =
      _$ResumeDownloadImpl;

  String get taskId;
  @JsonKey(ignore: true)
  _$$ResumeDownloadImplCopyWith<_$ResumeDownloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RetryDownloadImplCopyWith<$Res> {
  factory _$$RetryDownloadImplCopyWith(
          _$RetryDownloadImpl value, $Res Function(_$RetryDownloadImpl) then) =
      __$$RetryDownloadImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String taskId});
}

/// @nodoc
class __$$RetryDownloadImplCopyWithImpl<$Res>
    extends _$AnimeDownloadEventCopyWithImpl<$Res, _$RetryDownloadImpl>
    implements _$$RetryDownloadImplCopyWith<$Res> {
  __$$RetryDownloadImplCopyWithImpl(
      _$RetryDownloadImpl _value, $Res Function(_$RetryDownloadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
  }) {
    return _then(_$RetryDownloadImpl(
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RetryDownloadImpl implements _RetryDownload {
  const _$RetryDownloadImpl({required this.taskId});

  @override
  final String taskId;

  @override
  String toString() {
    return 'AnimeDownloadEvent.retryDownload(taskId: $taskId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RetryDownloadImpl &&
            (identical(other.taskId, taskId) || other.taskId == taskId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, taskId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RetryDownloadImplCopyWith<_$RetryDownloadImpl> get copyWith =>
      __$$RetryDownloadImplCopyWithImpl<_$RetryDownloadImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DownloadParams params) download,
    required TResult Function() getDownload,
    required TResult Function(String taskId) removeDownload,
    required TResult Function(String taskId) cancelDownload,
    required TResult Function(String taskId) cancelAllDownload,
    required TResult Function(String taskId) pauseDownload,
    required TResult Function(String taskId) resumeDownload,
    required TResult Function(String taskId) retryDownload,
  }) {
    return retryDownload(taskId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DownloadParams params)? download,
    TResult? Function()? getDownload,
    TResult? Function(String taskId)? removeDownload,
    TResult? Function(String taskId)? cancelDownload,
    TResult? Function(String taskId)? cancelAllDownload,
    TResult? Function(String taskId)? pauseDownload,
    TResult? Function(String taskId)? resumeDownload,
    TResult? Function(String taskId)? retryDownload,
  }) {
    return retryDownload?.call(taskId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DownloadParams params)? download,
    TResult Function()? getDownload,
    TResult Function(String taskId)? removeDownload,
    TResult Function(String taskId)? cancelDownload,
    TResult Function(String taskId)? cancelAllDownload,
    TResult Function(String taskId)? pauseDownload,
    TResult Function(String taskId)? resumeDownload,
    TResult Function(String taskId)? retryDownload,
    required TResult orElse(),
  }) {
    if (retryDownload != null) {
      return retryDownload(taskId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Download value) download,
    required TResult Function(_GetDownload value) getDownload,
    required TResult Function(_RemoveDownload value) removeDownload,
    required TResult Function(_CancelDownload value) cancelDownload,
    required TResult Function(_CancelAllDownload value) cancelAllDownload,
    required TResult Function(_PauseDownload value) pauseDownload,
    required TResult Function(_ResumeDownload value) resumeDownload,
    required TResult Function(_RetryDownload value) retryDownload,
  }) {
    return retryDownload(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Download value)? download,
    TResult? Function(_GetDownload value)? getDownload,
    TResult? Function(_RemoveDownload value)? removeDownload,
    TResult? Function(_CancelDownload value)? cancelDownload,
    TResult? Function(_CancelAllDownload value)? cancelAllDownload,
    TResult? Function(_PauseDownload value)? pauseDownload,
    TResult? Function(_ResumeDownload value)? resumeDownload,
    TResult? Function(_RetryDownload value)? retryDownload,
  }) {
    return retryDownload?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Download value)? download,
    TResult Function(_GetDownload value)? getDownload,
    TResult Function(_RemoveDownload value)? removeDownload,
    TResult Function(_CancelDownload value)? cancelDownload,
    TResult Function(_CancelAllDownload value)? cancelAllDownload,
    TResult Function(_PauseDownload value)? pauseDownload,
    TResult Function(_ResumeDownload value)? resumeDownload,
    TResult Function(_RetryDownload value)? retryDownload,
    required TResult orElse(),
  }) {
    if (retryDownload != null) {
      return retryDownload(this);
    }
    return orElse();
  }
}

abstract class _RetryDownload implements AnimeDownloadEvent {
  const factory _RetryDownload({required final String taskId}) =
      _$RetryDownloadImpl;

  String get taskId;
  @JsonKey(ignore: true)
  _$$RetryDownloadImplCopyWith<_$RetryDownloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AnimeDownloadState {
  bool get loading => throw _privateConstructorUsedError;
  bool get error => throw _privateConstructorUsedError;
  List<DownloadTask> get task => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnimeDownloadStateCopyWith<AnimeDownloadState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeDownloadStateCopyWith<$Res> {
  factory $AnimeDownloadStateCopyWith(
          AnimeDownloadState value, $Res Function(AnimeDownloadState) then) =
      _$AnimeDownloadStateCopyWithImpl<$Res, AnimeDownloadState>;
  @useResult
  $Res call({bool loading, bool error, List<DownloadTask> task});
}

/// @nodoc
class _$AnimeDownloadStateCopyWithImpl<$Res, $Val extends AnimeDownloadState>
    implements $AnimeDownloadStateCopyWith<$Res> {
  _$AnimeDownloadStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? error = null,
    Object? task = null,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      task: null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as List<DownloadTask>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnimeDownloadStateImplCopyWith<$Res>
    implements $AnimeDownloadStateCopyWith<$Res> {
  factory _$$AnimeDownloadStateImplCopyWith(_$AnimeDownloadStateImpl value,
          $Res Function(_$AnimeDownloadStateImpl) then) =
      __$$AnimeDownloadStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, bool error, List<DownloadTask> task});
}

/// @nodoc
class __$$AnimeDownloadStateImplCopyWithImpl<$Res>
    extends _$AnimeDownloadStateCopyWithImpl<$Res, _$AnimeDownloadStateImpl>
    implements _$$AnimeDownloadStateImplCopyWith<$Res> {
  __$$AnimeDownloadStateImplCopyWithImpl(_$AnimeDownloadStateImpl _value,
      $Res Function(_$AnimeDownloadStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? error = null,
    Object? task = null,
  }) {
    return _then(_$AnimeDownloadStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      task: null == task
          ? _value._task
          : task // ignore: cast_nullable_to_non_nullable
              as List<DownloadTask>,
    ));
  }
}

/// @nodoc

class _$AnimeDownloadStateImpl extends _AnimeDownloadState {
  const _$AnimeDownloadStateImpl(
      {required this.loading,
      required this.error,
      required final List<DownloadTask> task})
      : _task = task,
        super._();

  @override
  final bool loading;
  @override
  final bool error;
  final List<DownloadTask> _task;
  @override
  List<DownloadTask> get task {
    if (_task is EqualUnmodifiableListView) return _task;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_task);
  }

  @override
  String toString() {
    return 'AnimeDownloadState(loading: $loading, error: $error, task: $task)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimeDownloadStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other._task, _task));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, loading, error, const DeepCollectionEquality().hash(_task));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimeDownloadStateImplCopyWith<_$AnimeDownloadStateImpl> get copyWith =>
      __$$AnimeDownloadStateImplCopyWithImpl<_$AnimeDownloadStateImpl>(
          this, _$identity);
}

abstract class _AnimeDownloadState extends AnimeDownloadState {
  const factory _AnimeDownloadState(
      {required final bool loading,
      required final bool error,
      required final List<DownloadTask> task}) = _$AnimeDownloadStateImpl;
  const _AnimeDownloadState._() : super._();

  @override
  bool get loading;
  @override
  bool get error;
  @override
  List<DownloadTask> get task;
  @override
  @JsonKey(ignore: true)
  _$$AnimeDownloadStateImplCopyWith<_$AnimeDownloadStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
