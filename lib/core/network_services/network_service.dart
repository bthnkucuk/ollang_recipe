import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

// ignore: constant_identifier_names

///[HttpMethods] is a enum define http methods.
// ignore: constant_identifier_names
enum HttpMethods { GET, POST }

///[HttpClient] is a base class that is used to make requests to the server
class HttpClient {
  HttpClient._();
  static final HttpClient instance = HttpClient._();

  ///[request] is a method that is used to make all requests to the server.
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
    } catch (e) {
      developer.log(
          '$e method: $method, path: $path, queryParameters: $queryParameters');
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

  static const String searcjInfo = 'doc/open-api/recipe-search-v2.json';
}
