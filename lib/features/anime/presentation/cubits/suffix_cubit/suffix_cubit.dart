import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'suffix_state.dart';
part 'suffix_cubit.freezed.dart';

class SuffixCubit extends Cubit<SuffixState> {
  SuffixCubit() : super(const SuffixState.initial());
  void suffix({required Icon icon}) {
    try {
      emit(const SuffixState.loading());
    } catch (e) {
      emit(SuffixState.loaded(icon: icon));
    }
  }
}
