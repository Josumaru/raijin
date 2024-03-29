import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
abstract class Failure<T> with _$Failure<T> {
  const Failure._();
  const factory Failure.serverError({required String message}) = ServerError;
  const factory Failure.networkError() = NetworkError;
  const factory Failure.unauthorizedError({required String message}) =
      UnauthorizedError;
  const factory Failure.invalidInputError({required String message}) =
      InvalidInputError;
  const factory Failure.notFoundError() = NotFoundError;

  factory Failure.fromResponse(Response response) {
    switch (response.statusCode) {
      case 400:
        return const Failure.invalidInputError(message: 'Invalid Input');
      case 401:
        return const Failure.unauthorizedError(message: 'Unauthorize Error');
      case 404:
        return const Failure.notFoundError();
      default:
        return const Failure.serverError(message: 'Server Error');
    }
  }

  String get messages {
    return when(
      serverError: (message) => message,
      networkError: () => 'Network Error',
      unauthorizedError: (message) => message,
      invalidInputError: (message) => message,
      notFoundError: () => 'Not Found Error',
    );
  }
}
