// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anime_ongoing_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AnimeOngoingEvent {
  String get status => throw _privateConstructorUsedError;
  String get order => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get genre => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String status, String order, String type, String genre, int page)
        animeGetOngoing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String status, String order, String type, String genre, int page)?
        animeGetOngoing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String status, String order, String type, String genre, int page)?
        animeGetOngoing,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AnimeGet value) animeGetOngoing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AnimeGet value)? animeGetOngoing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AnimeGet value)? animeGetOngoing,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnimeOngoingEventCopyWith<AnimeOngoingEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeOngoingEventCopyWith<$Res> {
  factory $AnimeOngoingEventCopyWith(
          AnimeOngoingEvent value, $Res Function(AnimeOngoingEvent) then) =
      _$AnimeOngoingEventCopyWithImpl<$Res, AnimeOngoingEvent>;
  @useResult
  $Res call({String status, String order, String type, String genre, int page});
}

/// @nodoc
class _$AnimeOngoingEventCopyWithImpl<$Res, $Val extends AnimeOngoingEvent>
    implements $AnimeOngoingEventCopyWith<$Res> {
  _$AnimeOngoingEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? order = null,
    Object? type = null,
    Object? genre = null,
    Object? page = null,
  }) {
    return _then(_value.copyWith(
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnimeGetImplCopyWith<$Res>
    implements $AnimeOngoingEventCopyWith<$Res> {
  factory _$$AnimeGetImplCopyWith(
          _$AnimeGetImpl value, $Res Function(_$AnimeGetImpl) then) =
      __$$AnimeGetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String order, String type, String genre, int page});
}

/// @nodoc
class __$$AnimeGetImplCopyWithImpl<$Res>
    extends _$AnimeOngoingEventCopyWithImpl<$Res, _$AnimeGetImpl>
    implements _$$AnimeGetImplCopyWith<$Res> {
  __$$AnimeGetImplCopyWithImpl(
      _$AnimeGetImpl _value, $Res Function(_$AnimeGetImpl) _then)
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
    return _then(_$AnimeGetImpl(
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

class _$AnimeGetImpl implements _AnimeGet {
  const _$AnimeGetImpl(
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
    return 'AnimeOngoingEvent.animeGetOngoing(status: $status, order: $order, type: $type, genre: $genre, page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimeGetImpl &&
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
  _$$AnimeGetImplCopyWith<_$AnimeGetImpl> get copyWith =>
      __$$AnimeGetImplCopyWithImpl<_$AnimeGetImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String status, String order, String type, String genre, int page)
        animeGetOngoing,
  }) {
    return animeGetOngoing(status, order, type, genre, page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String status, String order, String type, String genre, int page)?
        animeGetOngoing,
  }) {
    return animeGetOngoing?.call(status, order, type, genre, page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String status, String order, String type, String genre, int page)?
        animeGetOngoing,
    required TResult orElse(),
  }) {
    if (animeGetOngoing != null) {
      return animeGetOngoing(status, order, type, genre, page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AnimeGet value) animeGetOngoing,
  }) {
    return animeGetOngoing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AnimeGet value)? animeGetOngoing,
  }) {
    return animeGetOngoing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AnimeGet value)? animeGetOngoing,
    required TResult orElse(),
  }) {
    if (animeGetOngoing != null) {
      return animeGetOngoing(this);
    }
    return orElse();
  }
}

abstract class _AnimeGet implements AnimeOngoingEvent {
  const factory _AnimeGet(
      {required final String status,
      required final String order,
      required final String type,
      required final String genre,
      required final int page}) = _$AnimeGetImpl;

  @override
  String get status;
  @override
  String get order;
  @override
  String get type;
  @override
  String get genre;
  @override
  int get page;
  @override
  @JsonKey(ignore: true)
  _$$AnimeGetImplCopyWith<_$AnimeGetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AnimeOngoingState {
  bool get loading => throw _privateConstructorUsedError;
  bool get error => throw _privateConstructorUsedError;
  List<AnimeModel> get animeModel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnimeOngoingStateCopyWith<AnimeOngoingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeOngoingStateCopyWith<$Res> {
  factory $AnimeOngoingStateCopyWith(
          AnimeOngoingState value, $Res Function(AnimeOngoingState) then) =
      _$AnimeOngoingStateCopyWithImpl<$Res, AnimeOngoingState>;
  @useResult
  $Res call({bool loading, bool error, List<AnimeModel> animeModel});
}

/// @nodoc
class _$AnimeOngoingStateCopyWithImpl<$Res, $Val extends AnimeOngoingState>
    implements $AnimeOngoingStateCopyWith<$Res> {
  _$AnimeOngoingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? error = null,
    Object? animeModel = null,
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
      animeModel: null == animeModel
          ? _value.animeModel
          : animeModel // ignore: cast_nullable_to_non_nullable
              as List<AnimeModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnimeOngoingStateImplCopyWith<$Res>
    implements $AnimeOngoingStateCopyWith<$Res> {
  factory _$$AnimeOngoingStateImplCopyWith(_$AnimeOngoingStateImpl value,
          $Res Function(_$AnimeOngoingStateImpl) then) =
      __$$AnimeOngoingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, bool error, List<AnimeModel> animeModel});
}

/// @nodoc
class __$$AnimeOngoingStateImplCopyWithImpl<$Res>
    extends _$AnimeOngoingStateCopyWithImpl<$Res, _$AnimeOngoingStateImpl>
    implements _$$AnimeOngoingStateImplCopyWith<$Res> {
  __$$AnimeOngoingStateImplCopyWithImpl(_$AnimeOngoingStateImpl _value,
      $Res Function(_$AnimeOngoingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? error = null,
    Object? animeModel = null,
  }) {
    return _then(_$AnimeOngoingStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      animeModel: null == animeModel
          ? _value._animeModel
          : animeModel // ignore: cast_nullable_to_non_nullable
              as List<AnimeModel>,
    ));
  }
}

/// @nodoc

class _$AnimeOngoingStateImpl extends _AnimeOngoingState {
  const _$AnimeOngoingStateImpl(
      {required this.loading,
      required this.error,
      required final List<AnimeModel> animeModel})
      : _animeModel = animeModel,
        super._();

  @override
  final bool loading;
  @override
  final bool error;
  final List<AnimeModel> _animeModel;
  @override
  List<AnimeModel> get animeModel {
    if (_animeModel is EqualUnmodifiableListView) return _animeModel;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_animeModel);
  }

  @override
  String toString() {
    return 'AnimeOngoingState(loading: $loading, error: $error, animeModel: $animeModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimeOngoingStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality()
                .equals(other._animeModel, _animeModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading, error,
      const DeepCollectionEquality().hash(_animeModel));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimeOngoingStateImplCopyWith<_$AnimeOngoingStateImpl> get copyWith =>
      __$$AnimeOngoingStateImplCopyWithImpl<_$AnimeOngoingStateImpl>(
          this, _$identity);
}

abstract class _AnimeOngoingState extends AnimeOngoingState {
  const factory _AnimeOngoingState(
      {required final bool loading,
      required final bool error,
      required final List<AnimeModel> animeModel}) = _$AnimeOngoingStateImpl;
  const _AnimeOngoingState._() : super._();

  @override
  bool get loading;
  @override
  bool get error;
  @override
  List<AnimeModel> get animeModel;
  @override
  @JsonKey(ignore: true)
  _$$AnimeOngoingStateImplCopyWith<_$AnimeOngoingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
