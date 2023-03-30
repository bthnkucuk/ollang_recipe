import 'dart:convert';
import 'package:http/http.dart' as http;

// ignore: constant_identifier_names
enum HttpMethods { GET, POST }

///[HttpClient] is a class that is used to make requests to the server.
class HttpClient {
  HttpClient._();
  static final HttpClient instance = HttpClient._();

  Future<http.Response?> request({
    required HttpMethods method,
    String baseUrl = HttpUrls.baseUrl,
    required String path,
    bool isUriParse = false,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    Object? body,
  }) async {
    Uri uri;
    if (isUriParse) {
      uri = Uri.parse(path);
    } else {
      uri = Uri(
        scheme: 'https',
        host: baseUrl,
        path: path,
        queryParameters: queryParameters,
      );
    }

    http.Response? response;

    try {
      switch (method) {
        case HttpMethods.GET:
          response = await _get(uri, headers);
          break;
        case HttpMethods.POST:
          response = await _post(uri, headers, body);
          break;
      }
    } catch (e, s) {
      rethrow;
    }

    return response;
  }

  Future<http.Response> _get(Uri uri, [Map<String, String>? headers]) async {
    var response = await http.get(uri, headers: headers);
    return response;
  }

  Future<http.Response> _post(Uri uri,
      [Map<String, String>? headers, Object? body]) async {
    var response =
        await http.post(uri, headers: headers, body: jsonEncode(body));
    return response;
  }
}

///[HttpUrls] is a class that is used to create a url for the request.
class HttpUrls {
  static const String baseUrl = 'api.edamam.com';

  static const String searchUrl = 'api/recipes/v2';
}
