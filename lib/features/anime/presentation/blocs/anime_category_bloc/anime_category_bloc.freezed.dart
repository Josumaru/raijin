// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anime_category_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AnimeCategoryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getGenre,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getGenre,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getGenre,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetGenre value) getGenre,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetGenre value)? getGenre,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetGenre value)? getGenre,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeCategoryEventCopyWith<$Res> {
  factory $AnimeCategoryEventCopyWith(
          AnimeCategoryEvent value, $Res Function(AnimeCategoryEvent) then) =
      _$AnimeCategoryEventCopyWithImpl<$Res, AnimeCategoryEvent>;
}

/// @nodoc
class _$AnimeCategoryEventCopyWithImpl<$Res, $Val extends AnimeCategoryEvent>
    implements $AnimeCategoryEventCopyWith<$Res> {
  _$AnimeCategoryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetGenreImplCopyWith<$Res> {
  factory _$$GetGenreImplCopyWith(
          _$GetGenreImpl value, $Res Function(_$GetGenreImpl) then) =
      __$$GetGenreImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetGenreImplCopyWithImpl<$Res>
    extends _$AnimeCategoryEventCopyWithImpl<$Res, _$GetGenreImpl>
    implements _$$GetGenreImplCopyWith<$Res> {
  __$$GetGenreImplCopyWithImpl(
      _$GetGenreImpl _value, $Res Function(_$GetGenreImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetGenreImpl implements _GetGenre {
  const _$GetGenreImpl();

  @override
  String toString() {
    return 'AnimeCategoryEvent.getGenre()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetGenreImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getGenre,
  }) {
    return getGenre();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getGenre,
  }) {
    return getGenre?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getGenre,
    required TResult orElse(),
  }) {
    if (getGenre != null) {
      return getGenre();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetGenre value) getGenre,
  }) {
    return getGenre(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetGenre value)? getGenre,
  }) {
    return getGenre?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetGenre value)? getGenre,
    required TResult orElse(),
  }) {
    if (getGenre != null) {
      return getGenre(this);
    }
    return orElse();
  }
}

abstract class _GetGenre implements AnimeCategoryEvent {
  const factory _GetGenre() = _$GetGenreImpl;
}

/// @nodoc
mixin _$AnimeCategoryState {
  bool get loading => throw _privateConstructorUsedError;
  bool get error => throw _privateConstructorUsedError;
  List<String> get genreList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnimeCategoryStateCopyWith<AnimeCategoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeCategoryStateCopyWith<$Res> {
  factory $AnimeCategoryStateCopyWith(
          AnimeCategoryState value, $Res Function(AnimeCategoryState) then) =
      _$AnimeCategoryStateCopyWithImpl<$Res, AnimeCategoryState>;
  @useResult
  $Res call({bool loading, bool error, List<String> genreList});
}

/// @nodoc
class _$AnimeCategoryStateCopyWithImpl<$Res, $Val extends AnimeCategoryState>
    implements $AnimeCategoryStateCopyWith<$Res> {
  _$AnimeCategoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? error = null,
    Object? genreList = null,
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
      genreList: null == genreList
          ? _value.genreList
          : genreList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnimeCategoryStateImplCopyWith<$Res>
    implements $AnimeCategoryStateCopyWith<$Res> {
  factory _$$AnimeCategoryStateImplCopyWith(_$AnimeCategoryStateImpl value,
          $Res Function(_$AnimeCategoryStateImpl) then) =
      __$$AnimeCategoryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, bool error, List<String> genreList});
}

/// @nodoc
class __$$AnimeCategoryStateImplCopyWithImpl<$Res>
    extends _$AnimeCategoryStateCopyWithImpl<$Res, _$AnimeCategoryStateImpl>
    implements _$$AnimeCategoryStateImplCopyWith<$Res> {
  __$$AnimeCategoryStateImplCopyWithImpl(_$AnimeCategoryStateImpl _value,
      $Res Function(_$AnimeCategoryStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? error = null,
    Object? genreList = null,
  }) {
    return _then(_$AnimeCategoryStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      genreList: null == genreList
          ? _value._genreList
          : genreList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$AnimeCategoryStateImpl implements _AnimeCategoryState {
  const _$AnimeCategoryStateImpl(
      {required this.loading,
      required this.error,
      required final List<String> genreList})
      : _genreList = genreList;

  @override
  final bool loading;
  @override
  final bool error;
  final List<String> _genreList;
  @override
  List<String> get genreList {
    if (_genreList is EqualUnmodifiableListView) return _genreList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genreList);
  }

  @override
  String toString() {
    return 'AnimeCategoryState(loading: $loading, error: $error, genreList: $genreList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimeCategoryStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality()
                .equals(other._genreList, _genreList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading, error,
      const DeepCollectionEquality().hash(_genreList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimeCategoryStateImplCopyWith<_$AnimeCategoryStateImpl> get copyWith =>
      __$$AnimeCategoryStateImplCopyWithImpl<_$AnimeCategoryStateImpl>(
          this, _$identity);
}

abstract class _AnimeCategoryState implements AnimeCategoryState {
  const factory _AnimeCategoryState(
      {required final bool loading,
      required final bool error,
      required final List<String> genreList}) = _$AnimeCategoryStateImpl;

  @override
  bool get loading;
  @override
  bool get error;
  @override
  List<String> get genreList;
  @override
  @JsonKey(ignore: true)
  _$$AnimeCategoryStateImplCopyWith<_$AnimeCategoryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
