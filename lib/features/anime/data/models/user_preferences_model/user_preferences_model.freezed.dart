// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_preferences_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserPreferencesModel {
  String? get theme => throw _privateConstructorUsedError;
  String? get resolution => throw _privateConstructorUsedError;
  double? get playback => throw _privateConstructorUsedError;
  String? get photoPath => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get server => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserPreferencesModelCopyWith<UserPreferencesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPreferencesModelCopyWith<$Res> {
  factory $UserPreferencesModelCopyWith(UserPreferencesModel value,
          $Res Function(UserPreferencesModel) then) =
      _$UserPreferencesModelCopyWithImpl<$Res, UserPreferencesModel>;
  @useResult
  $Res call(
      {String? theme,
      String? resolution,
      double? playback,
      String? photoPath,
      String? username,
      String? server});
}

/// @nodoc
class _$UserPreferencesModelCopyWithImpl<$Res,
        $Val extends UserPreferencesModel>
    implements $UserPreferencesModelCopyWith<$Res> {
  _$UserPreferencesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? theme = freezed,
    Object? resolution = freezed,
    Object? playback = freezed,
    Object? photoPath = freezed,
    Object? username = freezed,
    Object? server = freezed,
  }) {
    return _then(_value.copyWith(
      theme: freezed == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String?,
      resolution: freezed == resolution
          ? _value.resolution
          : resolution // ignore: cast_nullable_to_non_nullable
              as String?,
      playback: freezed == playback
          ? _value.playback
          : playback // ignore: cast_nullable_to_non_nullable
              as double?,
      photoPath: freezed == photoPath
          ? _value.photoPath
          : photoPath // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      server: freezed == server
          ? _value.server
          : server // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserPreferencesModelImplCopyWith<$Res>
    implements $UserPreferencesModelCopyWith<$Res> {
  factory _$$UserPreferencesModelImplCopyWith(_$UserPreferencesModelImpl value,
          $Res Function(_$UserPreferencesModelImpl) then) =
      __$$UserPreferencesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? theme,
      String? resolution,
      double? playback,
      String? photoPath,
      String? username,
      String? server});
}

/// @nodoc
class __$$UserPreferencesModelImplCopyWithImpl<$Res>
    extends _$UserPreferencesModelCopyWithImpl<$Res, _$UserPreferencesModelImpl>
    implements _$$UserPreferencesModelImplCopyWith<$Res> {
  __$$UserPreferencesModelImplCopyWithImpl(_$UserPreferencesModelImpl _value,
      $Res Function(_$UserPreferencesModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? theme = freezed,
    Object? resolution = freezed,
    Object? playback = freezed,
    Object? photoPath = freezed,
    Object? username = freezed,
    Object? server = freezed,
  }) {
    return _then(_$UserPreferencesModelImpl(
      theme: freezed == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String?,
      resolution: freezed == resolution
          ? _value.resolution
          : resolution // ignore: cast_nullable_to_non_nullable
              as String?,
      playback: freezed == playback
          ? _value.playback
          : playback // ignore: cast_nullable_to_non_nullable
              as double?,
      photoPath: freezed == photoPath
          ? _value.photoPath
          : photoPath // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      server: freezed == server
          ? _value.server
          : server // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UserPreferencesModelImpl extends _UserPreferencesModel {
  const _$UserPreferencesModelImpl(
      {this.theme,
      this.resolution,
      this.playback,
      this.photoPath,
      this.username,
      this.server})
      : super._();

  @override
  final String? theme;
  @override
  final String? resolution;
  @override
  final double? playback;
  @override
  final String? photoPath;
  @override
  final String? username;
  @override
  final String? server;

  @override
  String toString() {
    return 'UserPreferencesModel(theme: $theme, resolution: $resolution, playback: $playback, photoPath: $photoPath, username: $username, server: $server)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPreferencesModelImpl &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.resolution, resolution) ||
                other.resolution == resolution) &&
            (identical(other.playback, playback) ||
                other.playback == playback) &&
            (identical(other.photoPath, photoPath) ||
                other.photoPath == photoPath) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.server, server) || other.server == server));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, theme, resolution, playback, photoPath, username, server);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPreferencesModelImplCopyWith<_$UserPreferencesModelImpl>
      get copyWith =>
          __$$UserPreferencesModelImplCopyWithImpl<_$UserPreferencesModelImpl>(
              this, _$identity);
}

abstract class _UserPreferencesModel extends UserPreferencesModel {
  const factory _UserPreferencesModel(
      {final String? theme,
      final String? resolution,
      final double? playback,
      final String? photoPath,
      final String? username,
      final String? server}) = _$UserPreferencesModelImpl;
  const _UserPreferencesModel._() : super._();

  @override
  String? get theme;
  @override
  String? get resolution;
  @override
  double? get playback;
  @override
  String? get photoPath;
  @override
  String? get username;
  @override
  String? get server;
  @override
  @JsonKey(ignore: true)
  _$$UserPreferencesModelImplCopyWith<_$UserPreferencesModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
