// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anime_preferences_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AnimePreferencesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserPreferencesModel preferences) setPreferences,
    required TResult Function() getPreferences,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserPreferencesModel preferences)? setPreferences,
    TResult? Function()? getPreferences,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserPreferencesModel preferences)? setPreferences,
    TResult Function()? getPreferences,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetPreferences value) setPreferences,
    required TResult Function(_GetPreferences value) getPreferences,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetPreferences value)? setPreferences,
    TResult? Function(_GetPreferences value)? getPreferences,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetPreferences value)? setPreferences,
    TResult Function(_GetPreferences value)? getPreferences,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimePreferencesEventCopyWith<$Res> {
  factory $AnimePreferencesEventCopyWith(AnimePreferencesEvent value,
          $Res Function(AnimePreferencesEvent) then) =
      _$AnimePreferencesEventCopyWithImpl<$Res, AnimePreferencesEvent>;
}

/// @nodoc
class _$AnimePreferencesEventCopyWithImpl<$Res,
        $Val extends AnimePreferencesEvent>
    implements $AnimePreferencesEventCopyWith<$Res> {
  _$AnimePreferencesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SetPreferencesImplCopyWith<$Res> {
  factory _$$SetPreferencesImplCopyWith(_$SetPreferencesImpl value,
          $Res Function(_$SetPreferencesImpl) then) =
      __$$SetPreferencesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserPreferencesModel preferences});

  $UserPreferencesModelCopyWith<$Res> get preferences;
}

/// @nodoc
class __$$SetPreferencesImplCopyWithImpl<$Res>
    extends _$AnimePreferencesEventCopyWithImpl<$Res, _$SetPreferencesImpl>
    implements _$$SetPreferencesImplCopyWith<$Res> {
  __$$SetPreferencesImplCopyWithImpl(
      _$SetPreferencesImpl _value, $Res Function(_$SetPreferencesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preferences = null,
  }) {
    return _then(_$SetPreferencesImpl(
      preferences: null == preferences
          ? _value.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as UserPreferencesModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserPreferencesModelCopyWith<$Res> get preferences {
    return $UserPreferencesModelCopyWith<$Res>(_value.preferences, (value) {
      return _then(_value.copyWith(preferences: value));
    });
  }
}

/// @nodoc

class _$SetPreferencesImpl implements _SetPreferences {
  const _$SetPreferencesImpl({required this.preferences});

  @override
  final UserPreferencesModel preferences;

  @override
  String toString() {
    return 'AnimePreferencesEvent.setPreferences(preferences: $preferences)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetPreferencesImpl &&
            (identical(other.preferences, preferences) ||
                other.preferences == preferences));
  }

  @override
  int get hashCode => Object.hash(runtimeType, preferences);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetPreferencesImplCopyWith<_$SetPreferencesImpl> get copyWith =>
      __$$SetPreferencesImplCopyWithImpl<_$SetPreferencesImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserPreferencesModel preferences) setPreferences,
    required TResult Function() getPreferences,
  }) {
    return setPreferences(preferences);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserPreferencesModel preferences)? setPreferences,
    TResult? Function()? getPreferences,
  }) {
    return setPreferences?.call(preferences);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserPreferencesModel preferences)? setPreferences,
    TResult Function()? getPreferences,
    required TResult orElse(),
  }) {
    if (setPreferences != null) {
      return setPreferences(preferences);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetPreferences value) setPreferences,
    required TResult Function(_GetPreferences value) getPreferences,
  }) {
    return setPreferences(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetPreferences value)? setPreferences,
    TResult? Function(_GetPreferences value)? getPreferences,
  }) {
    return setPreferences?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetPreferences value)? setPreferences,
    TResult Function(_GetPreferences value)? getPreferences,
    required TResult orElse(),
  }) {
    if (setPreferences != null) {
      return setPreferences(this);
    }
    return orElse();
  }
}

abstract class _SetPreferences implements AnimePreferencesEvent {
  const factory _SetPreferences(
      {required final UserPreferencesModel preferences}) = _$SetPreferencesImpl;

  UserPreferencesModel get preferences;
  @JsonKey(ignore: true)
  _$$SetPreferencesImplCopyWith<_$SetPreferencesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetPreferencesImplCopyWith<$Res> {
  factory _$$GetPreferencesImplCopyWith(_$GetPreferencesImpl value,
          $Res Function(_$GetPreferencesImpl) then) =
      __$$GetPreferencesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetPreferencesImplCopyWithImpl<$Res>
    extends _$AnimePreferencesEventCopyWithImpl<$Res, _$GetPreferencesImpl>
    implements _$$GetPreferencesImplCopyWith<$Res> {
  __$$GetPreferencesImplCopyWithImpl(
      _$GetPreferencesImpl _value, $Res Function(_$GetPreferencesImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetPreferencesImpl implements _GetPreferences {
  const _$GetPreferencesImpl();

  @override
  String toString() {
    return 'AnimePreferencesEvent.getPreferences()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetPreferencesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserPreferencesModel preferences) setPreferences,
    required TResult Function() getPreferences,
  }) {
    return getPreferences();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserPreferencesModel preferences)? setPreferences,
    TResult? Function()? getPreferences,
  }) {
    return getPreferences?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserPreferencesModel preferences)? setPreferences,
    TResult Function()? getPreferences,
    required TResult orElse(),
  }) {
    if (getPreferences != null) {
      return getPreferences();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetPreferences value) setPreferences,
    required TResult Function(_GetPreferences value) getPreferences,
  }) {
    return getPreferences(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetPreferences value)? setPreferences,
    TResult? Function(_GetPreferences value)? getPreferences,
  }) {
    return getPreferences?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetPreferences value)? setPreferences,
    TResult Function(_GetPreferences value)? getPreferences,
    required TResult orElse(),
  }) {
    if (getPreferences != null) {
      return getPreferences(this);
    }
    return orElse();
  }
}

abstract class _GetPreferences implements AnimePreferencesEvent {
  const factory _GetPreferences() = _$GetPreferencesImpl;
}

/// @nodoc
mixin _$AnimePreferencesState {
  bool get loading => throw _privateConstructorUsedError;
  bool get error => throw _privateConstructorUsedError;
  UserPreferencesModel get preferences => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnimePreferencesStateCopyWith<AnimePreferencesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimePreferencesStateCopyWith<$Res> {
  factory $AnimePreferencesStateCopyWith(AnimePreferencesState value,
          $Res Function(AnimePreferencesState) then) =
      _$AnimePreferencesStateCopyWithImpl<$Res, AnimePreferencesState>;
  @useResult
  $Res call({bool loading, bool error, UserPreferencesModel preferences});

  $UserPreferencesModelCopyWith<$Res> get preferences;
}

/// @nodoc
class _$AnimePreferencesStateCopyWithImpl<$Res,
        $Val extends AnimePreferencesState>
    implements $AnimePreferencesStateCopyWith<$Res> {
  _$AnimePreferencesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? error = null,
    Object? preferences = null,
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
      preferences: null == preferences
          ? _value.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as UserPreferencesModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserPreferencesModelCopyWith<$Res> get preferences {
    return $UserPreferencesModelCopyWith<$Res>(_value.preferences, (value) {
      return _then(_value.copyWith(preferences: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AnimePreferencesStateImplCopyWith<$Res>
    implements $AnimePreferencesStateCopyWith<$Res> {
  factory _$$AnimePreferencesStateImplCopyWith(
          _$AnimePreferencesStateImpl value,
          $Res Function(_$AnimePreferencesStateImpl) then) =
      __$$AnimePreferencesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, bool error, UserPreferencesModel preferences});

  @override
  $UserPreferencesModelCopyWith<$Res> get preferences;
}

/// @nodoc
class __$$AnimePreferencesStateImplCopyWithImpl<$Res>
    extends _$AnimePreferencesStateCopyWithImpl<$Res,
        _$AnimePreferencesStateImpl>
    implements _$$AnimePreferencesStateImplCopyWith<$Res> {
  __$$AnimePreferencesStateImplCopyWithImpl(_$AnimePreferencesStateImpl _value,
      $Res Function(_$AnimePreferencesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? error = null,
    Object? preferences = null,
  }) {
    return _then(_$AnimePreferencesStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      preferences: null == preferences
          ? _value.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as UserPreferencesModel,
    ));
  }
}

/// @nodoc

class _$AnimePreferencesStateImpl extends _AnimePreferencesState {
  const _$AnimePreferencesStateImpl(
      {required this.loading, required this.error, required this.preferences})
      : super._();

  @override
  final bool loading;
  @override
  final bool error;
  @override
  final UserPreferencesModel preferences;

  @override
  String toString() {
    return 'AnimePreferencesState(loading: $loading, error: $error, preferences: $preferences)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimePreferencesStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.preferences, preferences) ||
                other.preferences == preferences));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading, error, preferences);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimePreferencesStateImplCopyWith<_$AnimePreferencesStateImpl>
      get copyWith => __$$AnimePreferencesStateImplCopyWithImpl<
          _$AnimePreferencesStateImpl>(this, _$identity);
}

abstract class _AnimePreferencesState extends AnimePreferencesState {
  const factory _AnimePreferencesState(
          {required final bool loading,
          required final bool error,
          required final UserPreferencesModel preferences}) =
      _$AnimePreferencesStateImpl;
  const _AnimePreferencesState._() : super._();

  @override
  bool get loading;
  @override
  bool get error;
  @override
  UserPreferencesModel get preferences;
  @override
  @JsonKey(ignore: true)
  _$$AnimePreferencesStateImplCopyWith<_$AnimePreferencesStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
