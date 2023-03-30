import 'dart:convert';
import 'dart:io';

import 'package:ollang_recipe/core/models/recipes_model.dart';
import 'package:ollang_recipe/core/network_service.dart';

class Repository extends Header {
  Repository._();
  static final Repository instance = Repository._();

  Future<BaseHttpRequest<Recipies>> search(String searchQuery) async {
    // try {
    var response = await HttpClient.instance.request(
        method: HttpMethods.GET,
        path: HttpUrls.searchUrl,
        queryParameters: {
          'app_id': 'd615a47c',
          'app_key': 'c9bbabb534a1b0e8e23b0851b8c80ecb',
          'type': 'public',
          'q': searchQuery
        },
        headers: createHeader());

    if (response!.statusCode == HttpStatus.ok) {
      Recipies model = Recipies().fromJson(jsonDecode(response.body));
      return BaseHttpRequest(status: response.statusCode, data: model);
    } else {
      HttpNotOkModel model =
          HttpNotOkModel().fromJson(jsonDecode(response.body));

      return BaseHttpRequest(
          status: response.statusCode, errorMessage: model.errorMessage);
    }
    // }

    // catch (e, s) {
    //   /// TODO: burayı halledin:
    //   return BaseHttpRequest(
    //       status: 20000, errorMessage: 'Repository Catch Block');
    // }
  }
}

// TODO(bthn) buraya token al
class Header {
  Map<String, String> createHeader({Map<String, String> addHeader = const {}}) {
    /// TODO(bthn) Accept-Language localden alıncak!

    Map<String, String> header = {
      'Content-type': 'application/json',
      ...addHeader,
    };

    return header;
  }
}

class HttpNotOkModel {
  final String? errorMessage;

  HttpNotOkModel({this.errorMessage});

  HttpNotOkModel fromJson(Map<String, dynamic> json) => HttpNotOkModel(
        errorMessage: json['error'],
      );

  Map<String, dynamic> toJson() => {
        'error': errorMessage,
      };
}
