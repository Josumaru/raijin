part of 'suffix_cubit.dart';

@freezed
class SuffixState with _$SuffixState {
  const factory SuffixState.initial() = _Initial;
  const factory SuffixState.loading() = _Loading;
  const factory SuffixState.loaded({required Icon icon}) = _Loaded;
  const factory SuffixState.error({required String message}) = _Error;
}
