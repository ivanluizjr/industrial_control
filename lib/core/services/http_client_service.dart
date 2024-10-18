import 'package:tractian/core/services/http_response.dart';
import 'package:tractian/core/types/type.dart';

abstract class IHttpClientService {
  Future<HttpResponse> get(
    String url, {
    Json? headers,
    Json? queryParams,
    Json? body,
  });

  Future<HttpResponse> post(
    String url, {
    Json? headers,
    Json? queryParams,
    Json? body,
  });

  Future<HttpResponse> delete(
    String url, {
    Json? headers,
    Json? queryParams,
    Json? body,
  });

  Future<HttpResponse> put(
    String url, {
    Json? headers,
    Json? queryParams,
    Json? body,
  });
}
