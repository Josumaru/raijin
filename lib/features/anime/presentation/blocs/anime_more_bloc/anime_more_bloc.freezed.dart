// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anime_more_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AnimeMoreEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() animeResetMore,
    required TResult Function(
            String status, String order, String type, String genre, int page)
        animeGetMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? animeResetMore,
    TResult? Function(
            String status, String order, String type, String genre, int page)?
        animeGetMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? animeResetMore,
    TResult Function(
            String status, String order, String type, String genre, int page)?
        animeGetMore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AnimeResetMore value) animeResetMore,
    required TResult Function(_AnimeGetMore value) animeGetMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AnimeResetMore value)? animeResetMore,
    TResult? Function(_AnimeGetMore value)? animeGetMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AnimeResetMore value)? animeResetMore,
    TResult Function(_AnimeGetMore value)? animeGetMore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeMoreEventCopyWith<$Res> {
  factory $AnimeMoreEventCopyWith(
          AnimeMoreEvent value, $Res Function(AnimeMoreEvent) then) =
      _$AnimeMoreEventCopyWithImpl<$Res, AnimeMoreEvent>;
}

/// @nodoc
class _$AnimeMoreEventCopyWithImpl<$Res, $Val extends AnimeMoreEvent>
    implements $AnimeMoreEventCopyWith<$Res> {
  _$AnimeMoreEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AnimeResetMoreImplCopyWith<$Res> {
  factory _$$AnimeResetMoreImplCopyWith(_$AnimeResetMoreImpl value,
          $Res Function(_$AnimeResetMoreImpl) then) =
      __$$AnimeResetMoreImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AnimeResetMoreImplCopyWithImpl<$Res>
    extends _$AnimeMoreEventCopyWithImpl<$Res, _$AnimeResetMoreImpl>
    implements _$$AnimeResetMoreImplCopyWith<$Res> {
  __$$AnimeResetMoreImplCopyWithImpl(
      _$AnimeResetMoreImpl _value, $Res Function(_$AnimeResetMoreImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AnimeResetMoreImpl implements _AnimeResetMore {
  const _$AnimeResetMoreImpl();

  @override
  String toString() {
    return 'AnimeMoreEvent.animeResetMore()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AnimeResetMoreImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() animeResetMore,
    required TResult Function(
            String status, String order, String type, String genre, int page)
        animeGetMore,
  }) {
    return animeResetMore();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? animeResetMore,
    TResult? Function(
            String status, String order, String type, String genre, int page)?
        animeGetMore,
  }) {
    return animeResetMore?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? animeResetMore,
    TResult Function(
            String status, String order, String type, String genre, int page)?
        animeGetMore,
    required TResult orElse(),
  }) {
    if (animeResetMore != null) {
      return animeResetMore();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AnimeResetMore value) animeResetMore,
    required TResult Function(_AnimeGetMore value) animeGetMore,
  }) {
    return animeResetMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AnimeResetMore value)? animeResetMore,
    TResult? Function(_AnimeGetMore value)? animeGetMore,
  }) {
    return animeResetMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AnimeResetMore value)? animeResetMore,
    TResult Function(_AnimeGetMore value)? animeGetMore,
    required TResult orElse(),
  }) {
    if (animeResetMore != null) {
      return animeResetMore(this);
    }
    return orElse();
  }
}

abstract class _AnimeResetMore implements AnimeMoreEvent {
  const factory _AnimeResetMore() = _$AnimeResetMoreImpl;
}

/// @nodoc
abstract class _$$AnimeGetMoreImplCopyWith<$Res> {
  factory _$$AnimeGetMoreImplCopyWith(
          _$AnimeGetMoreImpl value, $Res Function(_$AnimeGetMoreImpl) then) =
      __$$AnimeGetMoreImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String status, String order, String type, String genre, int page});
}

/// @nodoc
class __$$AnimeGetMoreImplCopyWithImpl<$Res>
    extends _$AnimeMoreEventCopyWithImpl<$Res, _$AnimeGetMoreImpl>
    implements _$$AnimeGetMoreImplCopyWith<$Res> {
  __$$AnimeGetMoreImplCopyWithImpl(
      _$AnimeGetMoreImpl _value, $Res Function(_$AnimeGetMoreImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? order = null,
    Object? type = null,
    Object? genre = null,
    Object? page = null,
  }) {
    return _then(_$AnimeGetMoreImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      genre: null == genre
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AnimeGetMoreImpl implements _AnimeGetMore {
  const _$AnimeGetMoreImpl(
      {required this.status,
      required this.order,
      required this.type,
      required this.genre,
      required this.page});

  @override
  final String status;
  @override
  final String order;
  @override
  final String type;
  @override
  final String genre;
  @override
  final int page;

  @override
  String toString() {
    return 'AnimeMoreEvent.animeGetMore(status: $status, order: $order, type: $type, genre: $genre, page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimeGetMoreImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.genre, genre) || other.genre == genre) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, order, type, genre, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimeGetMoreImplCopyWith<_$AnimeGetMoreImpl> get copyWith =>
      __$$AnimeGetMoreImplCopyWithImpl<_$AnimeGetMoreImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() animeResetMore,
    required TResult Function(
            String status, String order, String type, String genre, int page)
        animeGetMore,
  }) {
    return animeGetMore(status, order, type, genre, page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? animeResetMore,
    TResult? Function(
            String status, String order, String type, String genre, int page)?
        animeGetMore,
  }) {
    return animeGetMore?.call(status, order, type, genre, page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? animeResetMore,
    TResult Function(
            String status, String order, String type, String genre, int page)?
        animeGetMore,
    required TResult orElse(),
  }) {
    if (animeGetMore != null) {
      return animeGetMore(status, order, type, genre, page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AnimeResetMore value) animeResetMore,
    required TResult Function(_AnimeGetMore value) animeGetMore,
  }) {
    return animeGetMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AnimeResetMore value)? animeResetMore,
    TResult? Function(_AnimeGetMore value)? animeGetMore,
  }) {
    return animeGetMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AnimeResetMore value)? animeResetMore,
    TResult Function(_AnimeGetMore value)? animeGetMore,
    required TResult orElse(),
  }) {
    if (animeGetMore != null) {
      return animeGetMore(this);
    }
    return orElse();
  }
}

abstract class _AnimeGetMore implements AnimeMoreEvent {
  const factory _AnimeGetMore(
      {required final String status,
      required final String order,
      required final String type,
      required final String genre,
      required final int page}) = _$AnimeGetMoreImpl;

  String get status;
  String get order;
  String get type;
  String get genre;
  int get page;
  @JsonKey(ignore: true)
  _$$AnimeGetMoreImplCopyWith<_$AnimeGetMoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AnimeMoreState {
  bool get loading => throw _privateConstructorUsedError;
  bool get error => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  List<AnimeModel> get animeList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnimeMoreStateCopyWith<AnimeMoreState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeMoreStateCopyWith<$Res> {
  factory $AnimeMoreStateCopyWith(
          AnimeMoreState value, $Res Function(AnimeMoreState) then) =
      _$AnimeMoreStateCopyWithImpl<$Res, AnimeMoreState>;
  @useResult
  $Res call({bool loading, bool error, int page, List<AnimeModel> animeList});
}

/// @nodoc
class _$AnimeMoreStateCopyWithImpl<$Res, $Val extends AnimeMoreState>
    implements $AnimeMoreStateCopyWith<$Res> {
  _$AnimeMoreStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? error = null,
    Object? page = null,
    Object? animeList = null,
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
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      animeList: null == animeList
          ? _value.animeList
          : animeList // ignore: cast_nullable_to_non_nullable
              as List<AnimeModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnimeMoreStateImplCopyWith<$Res>
    implements $AnimeMoreStateCopyWith<$Res> {
  factory _$$AnimeMoreStateImplCopyWith(_$AnimeMoreStateImpl value,
          $Res Function(_$AnimeMoreStateImpl) then) =
      __$$AnimeMoreStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, bool error, int page, List<AnimeModel> animeList});
}

/// @nodoc
class __$$AnimeMoreStateImplCopyWithImpl<$Res>
    extends _$AnimeMoreStateCopyWithImpl<$Res, _$AnimeMoreStateImpl>
    implements _$$AnimeMoreStateImplCopyWith<$Res> {
  __$$AnimeMoreStateImplCopyWithImpl(
      _$AnimeMoreStateImpl _value, $Res Function(_$AnimeMoreStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? error = null,
    Object? page = null,
    Object? animeList = null,
  }) {
    return _then(_$AnimeMoreStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      animeList: null == animeList
          ? _value._animeList
          : animeList // ignore: cast_nullable_to_non_nullable
              as List<AnimeModel>,
    ));
  }
}

/// @nodoc

class _$AnimeMoreStateImpl extends _AnimeMoreState {
  const _$AnimeMoreStateImpl(
      {required this.loading,
      required this.error,
      required this.page,
      required final List<AnimeModel> animeList})
      : _animeList = animeList,
        super._();

  @override
  final bool loading;
  @override
  final bool error;
  @override
  final int page;
  final List<AnimeModel> _animeList;
  @override
  List<AnimeModel> get animeList {
    if (_animeList is EqualUnmodifiableListView) return _animeList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_animeList);
  }

  @override
  String toString() {
    return 'AnimeMoreState(loading: $loading, error: $error, page: $page, animeList: $animeList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimeMoreStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality()
                .equals(other._animeList, _animeList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading, error, page,
      const DeepCollectionEquality().hash(_animeList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimeMoreStateImplCopyWith<_$AnimeMoreStateImpl> get copyWith =>
      __$$AnimeMoreStateImplCopyWithImpl<_$AnimeMoreStateImpl>(
          this, _$identity);
}

abstract class _AnimeMoreState extends AnimeMoreState {
  const factory _AnimeMoreState(
      {required final bool loading,
      required final bool error,
      required final int page,
      required final List<AnimeModel> animeList}) = _$AnimeMoreStateImpl;
  const _AnimeMoreState._() : super._();

  @override
  bool get loading;
  @override
  bool get error;
  @override
  int get page;
  @override
  List<AnimeModel> get animeList;
  @override
  @JsonKey(ignore: true)
  _$$AnimeMoreStateImplCopyWith<_$AnimeMoreStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
