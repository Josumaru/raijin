// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anime_download_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AnimeDownloadModel {
  String get title => throw _privateConstructorUsedError;
  String get saveDir => throw _privateConstructorUsedError;
  int get progress => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnimeDownloadModelCopyWith<AnimeDownloadModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeDownloadModelCopyWith<$Res> {
  factory $AnimeDownloadModelCopyWith(
          AnimeDownloadModel value, $Res Function(AnimeDownloadModel) then) =
      _$AnimeDownloadModelCopyWithImpl<$Res, AnimeDownloadModel>;
  @useResult
  $Res call({String title, String saveDir, int progress});
}

/// @nodoc
class _$AnimeDownloadModelCopyWithImpl<$Res, $Val extends AnimeDownloadModel>
    implements $AnimeDownloadModelCopyWith<$Res> {
  _$AnimeDownloadModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? saveDir = null,
    Object? progress = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      saveDir: null == saveDir
          ? _value.saveDir
          : saveDir // ignore: cast_nullable_to_non_nullable
              as String,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnimeDownloadModelImplCopyWith<$Res>
    implements $AnimeDownloadModelCopyWith<$Res> {
  factory _$$AnimeDownloadModelImplCopyWith(_$AnimeDownloadModelImpl value,
          $Res Function(_$AnimeDownloadModelImpl) then) =
      __$$AnimeDownloadModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String saveDir, int progress});
}

/// @nodoc
class __$$AnimeDownloadModelImplCopyWithImpl<$Res>
    extends _$AnimeDownloadModelCopyWithImpl<$Res, _$AnimeDownloadModelImpl>
    implements _$$AnimeDownloadModelImplCopyWith<$Res> {
  __$$AnimeDownloadModelImplCopyWithImpl(_$AnimeDownloadModelImpl _value,
      $Res Function(_$AnimeDownloadModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? saveDir = null,
    Object? progress = null,
  }) {
    return _then(_$AnimeDownloadModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      saveDir: null == saveDir
          ? _value.saveDir
          : saveDir // ignore: cast_nullable_to_non_nullable
              as String,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AnimeDownloadModelImpl extends _AnimeDownloadModel {
  const _$AnimeDownloadModelImpl(
      {required this.title, required this.saveDir, required this.progress})
      : super._();

  @override
  final String title;
  @override
  final String saveDir;
  @override
  final int progress;

  @override
  String toString() {
    return 'AnimeDownloadModel(title: $title, saveDir: $saveDir, progress: $progress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimeDownloadModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.saveDir, saveDir) || other.saveDir == saveDir) &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, saveDir, progress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimeDownloadModelImplCopyWith<_$AnimeDownloadModelImpl> get copyWith =>
      __$$AnimeDownloadModelImplCopyWithImpl<_$AnimeDownloadModelImpl>(
          this, _$identity);
}

abstract class _AnimeDownloadModel extends AnimeDownloadModel {
  const factory _AnimeDownloadModel(
      {required final String title,
      required final String saveDir,
      required final int progress}) = _$AnimeDownloadModelImpl;
  const _AnimeDownloadModel._() : super._();

  @override
  String get title;
  @override
  String get saveDir;
  @override
  int get progress;
  @override
  @JsonKey(ignore: true)
  _$$AnimeDownloadModelImplCopyWith<_$AnimeDownloadModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
