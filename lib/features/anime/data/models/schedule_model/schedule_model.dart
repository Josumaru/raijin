// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_model.freezed.dart';
part 'schedule_model.g.dart';

@freezed
class ScheduleModel with _$ScheduleModel {
  factory ScheduleModel({
    required int id,
    required String slug,
    required String date,
    required String author,
    required String type,
    required String title,
    required String url,
    required String content,
    required String featured_img_src,
    required String genre,
    required String east_score,
    required String east_type,
    required String east_schedule,
    required String east_time,
  }) = _ScheduleModel;

  factory ScheduleModel.fromJson(Map<String, dynamic> json) =>
      _$ScheduleModelFromJson(json);
}
