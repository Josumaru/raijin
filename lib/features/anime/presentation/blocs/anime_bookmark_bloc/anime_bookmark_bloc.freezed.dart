// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anime_bookmark_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AnimeBookmarkEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AnimeModel anime) addAnimeList,
    required TResult Function(String baseUrl) removeAnimeList,
    required TResult Function() getAnimeList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AnimeModel anime)? addAnimeList,
    TResult? Function(String baseUrl)? removeAnimeList,
    TResult? Function()? getAnimeList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AnimeModel anime)? addAnimeList,
    TResult Function(String baseUrl)? removeAnimeList,
    TResult Function()? getAnimeList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddAnimeList value) addAnimeList,
    required TResult Function(_RemoveAnimeList value) removeAnimeList,
    required TResult Function(_GetAnimeList value) getAnimeList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddAnimeList value)? addAnimeList,
    TResult? Function(_RemoveAnimeList value)? removeAnimeList,
    TResult? Function(_GetAnimeList value)? getAnimeList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddAnimeList value)? addAnimeList,
    TResult Function(_RemoveAnimeList value)? removeAnimeList,
    TResult Function(_GetAnimeList value)? getAnimeList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeBookmarkEventCopyWith<$Res> {
  factory $AnimeBookmarkEventCopyWith(
          AnimeBookmarkEvent value, $Res Function(AnimeBookmarkEvent) then) =
      _$AnimeBookmarkEventCopyWithImpl<$Res, AnimeBookmarkEvent>;
}

/// @nodoc
class _$AnimeBookmarkEventCopyWithImpl<$Res, $Val extends AnimeBookmarkEvent>
    implements $AnimeBookmarkEventCopyWith<$Res> {
  _$AnimeBookmarkEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AddAnimeListImplCopyWith<$Res> {
  factory _$$AddAnimeListImplCopyWith(
          _$AddAnimeListImpl value, $Res Function(_$AddAnimeListImpl) then) =
      __$$AddAnimeListImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AnimeModel anime});

  $AnimeModelCopyWith<$Res> get anime;
}

/// @nodoc
class __$$AddAnimeListImplCopyWithImpl<$Res>
    extends _$AnimeBookmarkEventCopyWithImpl<$Res, _$AddAnimeListImpl>
    implements _$$AddAnimeListImplCopyWith<$Res> {
  __$$AddAnimeListImplCopyWithImpl(
      _$AddAnimeListImpl _value, $Res Function(_$AddAnimeListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? anime = null,
  }) {
    return _then(_$AddAnimeListImpl(
      anime: null == anime
          ? _value.anime
          : anime // ignore: cast_nullable_to_non_nullable
              as AnimeModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $AnimeModelCopyWith<$Res> get anime {
    return $AnimeModelCopyWith<$Res>(_value.anime, (value) {
      return _then(_value.copyWith(anime: value));
    });
  }
}

/// @nodoc

class _$AddAnimeListImpl implements _AddAnimeList {
  const _$AddAnimeListImpl({required this.anime});

  @override
  final AnimeModel anime;

  @override
  String toString() {
    return 'AnimeBookmarkEvent.addAnimeList(anime: $anime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddAnimeListImpl &&
            (identical(other.anime, anime) || other.anime == anime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, anime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddAnimeListImplCopyWith<_$AddAnimeListImpl> get copyWith =>
      __$$AddAnimeListImplCopyWithImpl<_$AddAnimeListImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AnimeModel anime) addAnimeList,
    required TResult Function(String baseUrl) removeAnimeList,
    required TResult Function() getAnimeList,
  }) {
    return addAnimeList(anime);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AnimeModel anime)? addAnimeList,
    TResult? Function(String baseUrl)? removeAnimeList,
    TResult? Function()? getAnimeList,
  }) {
    return addAnimeList?.call(anime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AnimeModel anime)? addAnimeList,
    TResult Function(String baseUrl)? removeAnimeList,
    TResult Function()? getAnimeList,
    required TResult orElse(),
  }) {
    if (addAnimeList != null) {
      return addAnimeList(anime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddAnimeList value) addAnimeList,
    required TResult Function(_RemoveAnimeList value) removeAnimeList,
    required TResult Function(_GetAnimeList value) getAnimeList,
  }) {
    return addAnimeList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddAnimeList value)? addAnimeList,
    TResult? Function(_RemoveAnimeList value)? removeAnimeList,
    TResult? Function(_GetAnimeList value)? getAnimeList,
  }) {
    return addAnimeList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddAnimeList value)? addAnimeList,
    TResult Function(_RemoveAnimeList value)? removeAnimeList,
    TResult Function(_GetAnimeList value)? getAnimeList,
    required TResult orElse(),
  }) {
    if (addAnimeList != null) {
      return addAnimeList(this);
    }
    return orElse();
  }
}

abstract class _AddAnimeList implements AnimeBookmarkEvent {
  const factory _AddAnimeList({required final AnimeModel anime}) =
      _$AddAnimeListImpl;

  AnimeModel get anime;
  @JsonKey(ignore: true)
  _$$AddAnimeListImplCopyWith<_$AddAnimeListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveAnimeListImplCopyWith<$Res> {
  factory _$$RemoveAnimeListImplCopyWith(_$RemoveAnimeListImpl value,
          $Res Function(_$RemoveAnimeListImpl) then) =
      __$$RemoveAnimeListImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String baseUrl});
}

/// @nodoc
class __$$RemoveAnimeListImplCopyWithImpl<$Res>
    extends _$AnimeBookmarkEventCopyWithImpl<$Res, _$RemoveAnimeListImpl>
    implements _$$RemoveAnimeListImplCopyWith<$Res> {
  __$$RemoveAnimeListImplCopyWithImpl(
      _$RemoveAnimeListImpl _value, $Res Function(_$RemoveAnimeListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseUrl = null,
  }) {
    return _then(_$RemoveAnimeListImpl(
      baseUrl: null == baseUrl
          ? _value.baseUrl
          : baseUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RemoveAnimeListImpl implements _RemoveAnimeList {
  const _$RemoveAnimeListImpl({required this.baseUrl});

  @override
  final String baseUrl;

  @override
  String toString() {
    return 'AnimeBookmarkEvent.removeAnimeList(baseUrl: $baseUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveAnimeListImpl &&
            (identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, baseUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveAnimeListImplCopyWith<_$RemoveAnimeListImpl> get copyWith =>
      __$$RemoveAnimeListImplCopyWithImpl<_$RemoveAnimeListImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AnimeModel anime) addAnimeList,
    required TResult Function(String baseUrl) removeAnimeList,
    required TResult Function() getAnimeList,
  }) {
    return removeAnimeList(baseUrl);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AnimeModel anime)? addAnimeList,
    TResult? Function(String baseUrl)? removeAnimeList,
    TResult? Function()? getAnimeList,
  }) {
    return removeAnimeList?.call(baseUrl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AnimeModel anime)? addAnimeList,
    TResult Function(String baseUrl)? removeAnimeList,
    TResult Function()? getAnimeList,
    required TResult orElse(),
  }) {
    if (removeAnimeList != null) {
      return removeAnimeList(baseUrl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddAnimeList value) addAnimeList,
    required TResult Function(_RemoveAnimeList value) removeAnimeList,
    required TResult Function(_GetAnimeList value) getAnimeList,
  }) {
    return removeAnimeList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddAnimeList value)? addAnimeList,
    TResult? Function(_RemoveAnimeList value)? removeAnimeList,
    TResult? Function(_GetAnimeList value)? getAnimeList,
  }) {
    return removeAnimeList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddAnimeList value)? addAnimeList,
    TResult Function(_RemoveAnimeList value)? removeAnimeList,
    TResult Function(_GetAnimeList value)? getAnimeList,
    required TResult orElse(),
  }) {
    if (removeAnimeList != null) {
      return removeAnimeList(this);
    }
    return orElse();
  }
}

abstract class _RemoveAnimeList implements AnimeBookmarkEvent {
  const factory _RemoveAnimeList({required final String baseUrl}) =
      _$RemoveAnimeListImpl;

  String get baseUrl;
  @JsonKey(ignore: true)
  _$$RemoveAnimeListImplCopyWith<_$RemoveAnimeListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetAnimeListImplCopyWith<$Res> {
  factory _$$GetAnimeListImplCopyWith(
          _$GetAnimeListImpl value, $Res Function(_$GetAnimeListImpl) then) =
      __$$GetAnimeListImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetAnimeListImplCopyWithImpl<$Res>
    extends _$AnimeBookmarkEventCopyWithImpl<$Res, _$GetAnimeListImpl>
    implements _$$GetAnimeListImplCopyWith<$Res> {
  __$$GetAnimeListImplCopyWithImpl(
      _$GetAnimeListImpl _value, $Res Function(_$GetAnimeListImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetAnimeListImpl implements _GetAnimeList {
  const _$GetAnimeListImpl();

  @override
  String toString() {
    return 'AnimeBookmarkEvent.getAnimeList()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetAnimeListImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AnimeModel anime) addAnimeList,
    required TResult Function(String baseUrl) removeAnimeList,
    required TResult Function() getAnimeList,
  }) {
    return getAnimeList();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AnimeModel anime)? addAnimeList,
    TResult? Function(String baseUrl)? removeAnimeList,
    TResult? Function()? getAnimeList,
  }) {
    return getAnimeList?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AnimeModel anime)? addAnimeList,
    TResult Function(String baseUrl)? removeAnimeList,
    TResult Function()? getAnimeList,
    required TResult orElse(),
  }) {
    if (getAnimeList != null) {
      return getAnimeList();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddAnimeList value) addAnimeList,
    required TResult Function(_RemoveAnimeList value) removeAnimeList,
    required TResult Function(_GetAnimeList value) getAnimeList,
  }) {
    return getAnimeList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddAnimeList value)? addAnimeList,
    TResult? Function(_RemoveAnimeList value)? removeAnimeList,
    TResult? Function(_GetAnimeList value)? getAnimeList,
  }) {
    return getAnimeList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddAnimeList value)? addAnimeList,
    TResult Function(_RemoveAnimeList value)? removeAnimeList,
    TResult Function(_GetAnimeList value)? getAnimeList,
    required TResult orElse(),
  }) {
    if (getAnimeList != null) {
      return getAnimeList(this);
    }
    return orElse();
  }
}

abstract class _GetAnimeList implements AnimeBookmarkEvent {
  const factory _GetAnimeList() = _$GetAnimeListImpl;
}

/// @nodoc
mixin _$AnimeBookmarkState {
  bool get loading => throw _privateConstructorUsedError;
  bool get error => throw _privateConstructorUsedError;
  List<AnimeModel> get animeList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnimeBookmarkStateCopyWith<AnimeBookmarkState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeBookmarkStateCopyWith<$Res> {
  factory $AnimeBookmarkStateCopyWith(
          AnimeBookmarkState value, $Res Function(AnimeBookmarkState) then) =
      _$AnimeBookmarkStateCopyWithImpl<$Res, AnimeBookmarkState>;
  @useResult
  $Res call({bool loading, bool error, List<AnimeModel> animeList});
}

/// @nodoc
class _$AnimeBookmarkStateCopyWithImpl<$Res, $Val extends AnimeBookmarkState>
    implements $AnimeBookmarkStateCopyWith<$Res> {
  _$AnimeBookmarkStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? error = null,
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
      animeList: null == animeList
          ? _value.animeList
          : animeList // ignore: cast_nullable_to_non_nullable
              as List<AnimeModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnimeBookmarkStateImplCopyWith<$Res>
    implements $AnimeBookmarkStateCopyWith<$Res> {
  factory _$$AnimeBookmarkStateImplCopyWith(_$AnimeBookmarkStateImpl value,
          $Res Function(_$AnimeBookmarkStateImpl) then) =
      __$$AnimeBookmarkStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, bool error, List<AnimeModel> animeList});
}

/// @nodoc
class __$$AnimeBookmarkStateImplCopyWithImpl<$Res>
    extends _$AnimeBookmarkStateCopyWithImpl<$Res, _$AnimeBookmarkStateImpl>
    implements _$$AnimeBookmarkStateImplCopyWith<$Res> {
  __$$AnimeBookmarkStateImplCopyWithImpl(_$AnimeBookmarkStateImpl _value,
      $Res Function(_$AnimeBookmarkStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? error = null,
    Object? animeList = null,
  }) {
    return _then(_$AnimeBookmarkStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      animeList: null == animeList
          ? _value._animeList
          : animeList // ignore: cast_nullable_to_non_nullable
              as List<AnimeModel>,
    ));
  }
}

/// @nodoc

class _$AnimeBookmarkStateImpl extends _AnimeBookmarkState {
  const _$AnimeBookmarkStateImpl(
      {required this.loading,
      required this.error,
      required final List<AnimeModel> animeList})
      : _animeList = animeList,
        super._();

  @override
  final bool loading;
  @override
  final bool error;
  final List<AnimeModel> _animeList;
  @override
  List<AnimeModel> get animeList {
    if (_animeList is EqualUnmodifiableListView) return _animeList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_animeList);
  }

  @override
  String toString() {
    return 'AnimeBookmarkState(loading: $loading, error: $error, animeList: $animeList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimeBookmarkStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality()
                .equals(other._animeList, _animeList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading, error,
      const DeepCollectionEquality().hash(_animeList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimeBookmarkStateImplCopyWith<_$AnimeBookmarkStateImpl> get copyWith =>
      __$$AnimeBookmarkStateImplCopyWithImpl<_$AnimeBookmarkStateImpl>(
          this, _$identity);
}

abstract class _AnimeBookmarkState extends AnimeBookmarkState {
  const factory _AnimeBookmarkState(
      {required final bool loading,
      required final bool error,
      required final List<AnimeModel> animeList}) = _$AnimeBookmarkStateImpl;
  const _AnimeBookmarkState._() : super._();

  @override
  bool get loading;
  @override
  bool get error;
  @override
  List<AnimeModel> get animeList;
  @override
  @JsonKey(ignore: true)
  _$$AnimeBookmarkStateImplCopyWith<_$AnimeBookmarkStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
