// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Failure<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverError,
    required TResult Function() networkError,
    required TResult Function(String message) unauthorizedError,
    required TResult Function(String message) invalidInputError,
    required TResult Function() notFoundError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverError,
    TResult? Function()? networkError,
    TResult? Function(String message)? unauthorizedError,
    TResult? Function(String message)? invalidInputError,
    TResult? Function()? notFoundError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverError,
    TResult Function()? networkError,
    TResult Function(String message)? unauthorizedError,
    TResult Function(String message)? invalidInputError,
    TResult Function()? notFoundError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError<T> value) serverError,
    required TResult Function(NetworkError<T> value) networkError,
    required TResult Function(UnauthorizedError<T> value) unauthorizedError,
    required TResult Function(InvalidInputError<T> value) invalidInputError,
    required TResult Function(NotFoundError<T> value) notFoundError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError<T> value)? serverError,
    TResult? Function(NetworkError<T> value)? networkError,
    TResult? Function(UnauthorizedError<T> value)? unauthorizedError,
    TResult? Function(InvalidInputError<T> value)? invalidInputError,
    TResult? Function(NotFoundError<T> value)? notFoundError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError<T> value)? serverError,
    TResult Function(NetworkError<T> value)? networkError,
    TResult Function(UnauthorizedError<T> value)? unauthorizedError,
    TResult Function(InvalidInputError<T> value)? invalidInputError,
    TResult Function(NotFoundError<T> value)? notFoundError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<T, $Res> {
  factory $FailureCopyWith(Failure<T> value, $Res Function(Failure<T>) then) =
      _$FailureCopyWithImpl<T, $Res, Failure<T>>;
}

/// @nodoc
class _$FailureCopyWithImpl<T, $Res, $Val extends Failure<T>>
    implements $FailureCopyWith<T, $Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ServerErrorImplCopyWith<T, $Res> {
  factory _$$ServerErrorImplCopyWith(_$ServerErrorImpl<T> value,
          $Res Function(_$ServerErrorImpl<T>) then) =
      __$$ServerErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ServerErrorImplCopyWithImpl<T, $Res>
    extends _$FailureCopyWithImpl<T, $Res, _$ServerErrorImpl<T>>
    implements _$$ServerErrorImplCopyWith<T, $Res> {
  __$$ServerErrorImplCopyWithImpl(
      _$ServerErrorImpl<T> _value, $Res Function(_$ServerErrorImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ServerErrorImpl<T>(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ServerErrorImpl<T> extends ServerError<T> {
  const _$ServerErrorImpl({required this.message}) : super._();

  @override
  final String message;

  @override
  String toString() {
    return 'Failure<$T>.serverError(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerErrorImpl<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerErrorImplCopyWith<T, _$ServerErrorImpl<T>> get copyWith =>
      __$$ServerErrorImplCopyWithImpl<T, _$ServerErrorImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverError,
    required TResult Function() networkError,
    required TResult Function(String message) unauthorizedError,
    required TResult Function(String message) invalidInputError,
    required TResult Function() notFoundError,
  }) {
    return serverError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverError,
    TResult? Function()? networkError,
    TResult? Function(String message)? unauthorizedError,
    TResult? Function(String message)? invalidInputError,
    TResult? Function()? notFoundError,
  }) {
    return serverError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverError,
    TResult Function()? networkError,
    TResult Function(String message)? unauthorizedError,
    TResult Function(String message)? invalidInputError,
    TResult Function()? notFoundError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError<T> value) serverError,
    required TResult Function(NetworkError<T> value) networkError,
    required TResult Function(UnauthorizedError<T> value) unauthorizedError,
    required TResult Function(InvalidInputError<T> value) invalidInputError,
    required TResult Function(NotFoundError<T> value) notFoundError,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError<T> value)? serverError,
    TResult? Function(NetworkError<T> value)? networkError,
    TResult? Function(UnauthorizedError<T> value)? unauthorizedError,
    TResult? Function(InvalidInputError<T> value)? invalidInputError,
    TResult? Function(NotFoundError<T> value)? notFoundError,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError<T> value)? serverError,
    TResult Function(NetworkError<T> value)? networkError,
    TResult Function(UnauthorizedError<T> value)? unauthorizedError,
    TResult Function(InvalidInputError<T> value)? invalidInputError,
    TResult Function(NotFoundError<T> value)? notFoundError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class ServerError<T> extends Failure<T> {
  const factory ServerError({required final String message}) =
      _$ServerErrorImpl<T>;
  const ServerError._() : super._();

  String get message;
  @JsonKey(ignore: true)
  _$$ServerErrorImplCopyWith<T, _$ServerErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NetworkErrorImplCopyWith<T, $Res> {
  factory _$$NetworkErrorImplCopyWith(_$NetworkErrorImpl<T> value,
          $Res Function(_$NetworkErrorImpl<T>) then) =
      __$$NetworkErrorImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$NetworkErrorImplCopyWithImpl<T, $Res>
    extends _$FailureCopyWithImpl<T, $Res, _$NetworkErrorImpl<T>>
    implements _$$NetworkErrorImplCopyWith<T, $Res> {
  __$$NetworkErrorImplCopyWithImpl(
      _$NetworkErrorImpl<T> _value, $Res Function(_$NetworkErrorImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NetworkErrorImpl<T> extends NetworkError<T> {
  const _$NetworkErrorImpl() : super._();

  @override
  String toString() {
    return 'Failure<$T>.networkError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NetworkErrorImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverError,
    required TResult Function() networkError,
    required TResult Function(String message) unauthorizedError,
    required TResult Function(String message) invalidInputError,
    required TResult Function() notFoundError,
  }) {
    return networkError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverError,
    TResult? Function()? networkError,
    TResult? Function(String message)? unauthorizedError,
    TResult? Function(String message)? invalidInputError,
    TResult? Function()? notFoundError,
  }) {
    return networkError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverError,
    TResult Function()? networkError,
    TResult Function(String message)? unauthorizedError,
    TResult Function(String message)? invalidInputError,
    TResult Function()? notFoundError,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError<T> value) serverError,
    required TResult Function(NetworkError<T> value) networkError,
    required TResult Function(UnauthorizedError<T> value) unauthorizedError,
    required TResult Function(InvalidInputError<T> value) invalidInputError,
    required TResult Function(NotFoundError<T> value) notFoundError,
  }) {
    return networkError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError<T> value)? serverError,
    TResult? Function(NetworkError<T> value)? networkError,
    TResult? Function(UnauthorizedError<T> value)? unauthorizedError,
    TResult? Function(InvalidInputError<T> value)? invalidInputError,
    TResult? Function(NotFoundError<T> value)? notFoundError,
  }) {
    return networkError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError<T> value)? serverError,
    TResult Function(NetworkError<T> value)? networkError,
    TResult Function(UnauthorizedError<T> value)? unauthorizedError,
    TResult Function(InvalidInputError<T> value)? invalidInputError,
    TResult Function(NotFoundError<T> value)? notFoundError,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(this);
    }
    return orElse();
  }
}

abstract class NetworkError<T> extends Failure<T> {
  const factory NetworkError() = _$NetworkErrorImpl<T>;
  const NetworkError._() : super._();
}

/// @nodoc
abstract class _$$UnauthorizedErrorImplCopyWith<T, $Res> {
  factory _$$UnauthorizedErrorImplCopyWith(_$UnauthorizedErrorImpl<T> value,
          $Res Function(_$UnauthorizedErrorImpl<T>) then) =
      __$$UnauthorizedErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UnauthorizedErrorImplCopyWithImpl<T, $Res>
    extends _$FailureCopyWithImpl<T, $Res, _$UnauthorizedErrorImpl<T>>
    implements _$$UnauthorizedErrorImplCopyWith<T, $Res> {
  __$$UnauthorizedErrorImplCopyWithImpl(_$UnauthorizedErrorImpl<T> _value,
      $Res Function(_$UnauthorizedErrorImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$UnauthorizedErrorImpl<T>(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UnauthorizedErrorImpl<T> extends UnauthorizedError<T> {
  const _$UnauthorizedErrorImpl({required this.message}) : super._();

  @override
  final String message;

  @override
  String toString() {
    return 'Failure<$T>.unauthorizedError(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnauthorizedErrorImpl<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnauthorizedErrorImplCopyWith<T, _$UnauthorizedErrorImpl<T>>
      get copyWith =>
          __$$UnauthorizedErrorImplCopyWithImpl<T, _$UnauthorizedErrorImpl<T>>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverError,
    required TResult Function() networkError,
    required TResult Function(String message) unauthorizedError,
    required TResult Function(String message) invalidInputError,
    required TResult Function() notFoundError,
  }) {
    return unauthorizedError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverError,
    TResult? Function()? networkError,
    TResult? Function(String message)? unauthorizedError,
    TResult? Function(String message)? invalidInputError,
    TResult? Function()? notFoundError,
  }) {
    return unauthorizedError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverError,
    TResult Function()? networkError,
    TResult Function(String message)? unauthorizedError,
    TResult Function(String message)? invalidInputError,
    TResult Function()? notFoundError,
    required TResult orElse(),
  }) {
    if (unauthorizedError != null) {
      return unauthorizedError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError<T> value) serverError,
    required TResult Function(NetworkError<T> value) networkError,
    required TResult Function(UnauthorizedError<T> value) unauthorizedError,
    required TResult Function(InvalidInputError<T> value) invalidInputError,
    required TResult Function(NotFoundError<T> value) notFoundError,
  }) {
    return unauthorizedError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError<T> value)? serverError,
    TResult? Function(NetworkError<T> value)? networkError,
    TResult? Function(UnauthorizedError<T> value)? unauthorizedError,
    TResult? Function(InvalidInputError<T> value)? invalidInputError,
    TResult? Function(NotFoundError<T> value)? notFoundError,
  }) {
    return unauthorizedError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError<T> value)? serverError,
    TResult Function(NetworkError<T> value)? networkError,
    TResult Function(UnauthorizedError<T> value)? unauthorizedError,
    TResult Function(InvalidInputError<T> value)? invalidInputError,
    TResult Function(NotFoundError<T> value)? notFoundError,
    required TResult orElse(),
  }) {
    if (unauthorizedError != null) {
      return unauthorizedError(this);
    }
    return orElse();
  }
}

abstract class UnauthorizedError<T> extends Failure<T> {
  const factory UnauthorizedError({required final String message}) =
      _$UnauthorizedErrorImpl<T>;
  const UnauthorizedError._() : super._();

  String get message;
  @JsonKey(ignore: true)
  _$$UnauthorizedErrorImplCopyWith<T, _$UnauthorizedErrorImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InvalidInputErrorImplCopyWith<T, $Res> {
  factory _$$InvalidInputErrorImplCopyWith(_$InvalidInputErrorImpl<T> value,
          $Res Function(_$InvalidInputErrorImpl<T>) then) =
      __$$InvalidInputErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$InvalidInputErrorImplCopyWithImpl<T, $Res>
    extends _$FailureCopyWithImpl<T, $Res, _$InvalidInputErrorImpl<T>>
    implements _$$InvalidInputErrorImplCopyWith<T, $Res> {
  __$$InvalidInputErrorImplCopyWithImpl(_$InvalidInputErrorImpl<T> _value,
      $Res Function(_$InvalidInputErrorImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$InvalidInputErrorImpl<T>(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InvalidInputErrorImpl<T> extends InvalidInputError<T> {
  const _$InvalidInputErrorImpl({required this.message}) : super._();

  @override
  final String message;

  @override
  String toString() {
    return 'Failure<$T>.invalidInputError(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidInputErrorImpl<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvalidInputErrorImplCopyWith<T, _$InvalidInputErrorImpl<T>>
      get copyWith =>
          __$$InvalidInputErrorImplCopyWithImpl<T, _$InvalidInputErrorImpl<T>>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverError,
    required TResult Function() networkError,
    required TResult Function(String message) unauthorizedError,
    required TResult Function(String message) invalidInputError,
    required TResult Function() notFoundError,
  }) {
    return invalidInputError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverError,
    TResult? Function()? networkError,
    TResult? Function(String message)? unauthorizedError,
    TResult? Function(String message)? invalidInputError,
    TResult? Function()? notFoundError,
  }) {
    return invalidInputError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverError,
    TResult Function()? networkError,
    TResult Function(String message)? unauthorizedError,
    TResult Function(String message)? invalidInputError,
    TResult Function()? notFoundError,
    required TResult orElse(),
  }) {
    if (invalidInputError != null) {
      return invalidInputError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError<T> value) serverError,
    required TResult Function(NetworkError<T> value) networkError,
    required TResult Function(UnauthorizedError<T> value) unauthorizedError,
    required TResult Function(InvalidInputError<T> value) invalidInputError,
    required TResult Function(NotFoundError<T> value) notFoundError,
  }) {
    return invalidInputError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError<T> value)? serverError,
    TResult? Function(NetworkError<T> value)? networkError,
    TResult? Function(UnauthorizedError<T> value)? unauthorizedError,
    TResult? Function(InvalidInputError<T> value)? invalidInputError,
    TResult? Function(NotFoundError<T> value)? notFoundError,
  }) {
    return invalidInputError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError<T> value)? serverError,
    TResult Function(NetworkError<T> value)? networkError,
    TResult Function(UnauthorizedError<T> value)? unauthorizedError,
    TResult Function(InvalidInputError<T> value)? invalidInputError,
    TResult Function(NotFoundError<T> value)? notFoundError,
    required TResult orElse(),
  }) {
    if (invalidInputError != null) {
      return invalidInputError(this);
    }
    return orElse();
  }
}

abstract class InvalidInputError<T> extends Failure<T> {
  const factory InvalidInputError({required final String message}) =
      _$InvalidInputErrorImpl<T>;
  const InvalidInputError._() : super._();

  String get message;
  @JsonKey(ignore: true)
  _$$InvalidInputErrorImplCopyWith<T, _$InvalidInputErrorImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotFoundErrorImplCopyWith<T, $Res> {
  factory _$$NotFoundErrorImplCopyWith(_$NotFoundErrorImpl<T> value,
          $Res Function(_$NotFoundErrorImpl<T>) then) =
      __$$NotFoundErrorImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$NotFoundErrorImplCopyWithImpl<T, $Res>
    extends _$FailureCopyWithImpl<T, $Res, _$NotFoundErrorImpl<T>>
    implements _$$NotFoundErrorImplCopyWith<T, $Res> {
  __$$NotFoundErrorImplCopyWithImpl(_$NotFoundErrorImpl<T> _value,
      $Res Function(_$NotFoundErrorImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NotFoundErrorImpl<T> extends NotFoundError<T> {
  const _$NotFoundErrorImpl() : super._();

  @override
  String toString() {
    return 'Failure<$T>.notFoundError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NotFoundErrorImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverError,
    required TResult Function() networkError,
    required TResult Function(String message) unauthorizedError,
    required TResult Function(String message) invalidInputError,
    required TResult Function() notFoundError,
  }) {
    return notFoundError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverError,
    TResult? Function()? networkError,
    TResult? Function(String message)? unauthorizedError,
    TResult? Function(String message)? invalidInputError,
    TResult? Function()? notFoundError,
  }) {
    return notFoundError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverError,
    TResult Function()? networkError,
    TResult Function(String message)? unauthorizedError,
    TResult Function(String message)? invalidInputError,
    TResult Function()? notFoundError,
    required TResult orElse(),
  }) {
    if (notFoundError != null) {
      return notFoundError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError<T> value) serverError,
    required TResult Function(NetworkError<T> value) networkError,
    required TResult Function(UnauthorizedError<T> value) unauthorizedError,
    required TResult Function(InvalidInputError<T> value) invalidInputError,
    required TResult Function(NotFoundError<T> value) notFoundError,
  }) {
    return notFoundError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError<T> value)? serverError,
    TResult? Function(NetworkError<T> value)? networkError,
    TResult? Function(UnauthorizedError<T> value)? unauthorizedError,
    TResult? Function(InvalidInputError<T> value)? invalidInputError,
    TResult? Function(NotFoundError<T> value)? notFoundError,
  }) {
    return notFoundError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError<T> value)? serverError,
    TResult Function(NetworkError<T> value)? networkError,
    TResult Function(UnauthorizedError<T> value)? unauthorizedError,
    TResult Function(InvalidInputError<T> value)? invalidInputError,
    TResult Function(NotFoundError<T> value)? notFoundError,
    required TResult orElse(),
  }) {
    if (notFoundError != null) {
      return notFoundError(this);
    }
    return orElse();
  }
}

abstract class NotFoundError<T> extends Failure<T> {
  const factory NotFoundError() = _$NotFoundErrorImpl<T>;
  const NotFoundError._() : super._();
}
