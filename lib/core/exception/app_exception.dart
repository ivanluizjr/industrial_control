import 'package:tractian/core/types/type.dart';

abstract interface class AppException implements Exception {
  abstract final String message;
  abstract final StackTrace? stackTrace;
  abstract final FailureType failureType;

  @override
  String toString() {
    return '$message ($failureType)';
  }
}
