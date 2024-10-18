import 'package:tractian/core/exception/app_exception.dart';
import 'package:tractian/core/types/type.dart';

class HttpException implements AppException {
  @override
  final String message;
  final int code;

  const HttpException(
    this.message, {
    this.stackTrace,
    this.code = 0,
  });

  @override
  final StackTrace? stackTrace;

  @override
  FailureType get failureType => FailureType.unknown;
}
