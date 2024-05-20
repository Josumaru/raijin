import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_preferences_model.freezed.dart';
part 'user_preferences_model.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
abstract class UserPreferencesModel with _$UserPreferencesModel {
  const UserPreferencesModel._();
  const factory UserPreferencesModel({
    String? theme,
    String? resolution,
    double? playback,
    String? photoPath,
    String? username,
  }) = _UserPreferencesModel;

  factory UserPreferencesModel.fromJson(Map<String, dynamic> json) {
    return _$UserPreferencesModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserPreferencesModelToJson(this);
}
