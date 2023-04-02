import 'dart:convert';
import 'dart:io';

import 'package:ollang_recipe/core/models/recipes_model.dart';
import 'package:ollang_recipe/core/models/recipes_search_info_model.dart';
import 'package:ollang_recipe/core/network_service.dart';

//NOT api is somettime when ask for https:// image, cant handle it, so i replace it with http://
///[Repository] is a class that is used to make requests to the server.
class Repository extends Header {
  Repository._();
  static final Repository instance = Repository._();

  ///[search] is a method that is used to search for recipes.
  ///[searchQuery] is a string that is used to search for recipes.
  ///[filterQuery] is a map that is used to filter recipes.
  ///[isRandom] is a boolean that is used to get random recipes.
  Future<Recipes> search(String searchQuery,
      {Map<String, dynamic> filterQuery = const {},
      bool isRandom = false}) async {
    var response = await HttpClient.instance.request(
      method: HttpMethods.GET,
      path: HttpUrls.searchUrl,
      queryParameters: {
        'app_id': 'd615a47c',
        'app_key': 'c9bbabb534a1b0e8e23b0851b8c80ecb',
        'type': 'public',
        'q': searchQuery,
        'random': isRandom.toString(),
        ...filterQuery
      },
      headers: createHeader(),
    );

    if (response!.statusCode == HttpStatus.ok) {
      Recipes model = Recipes.fromJson(
          jsonDecode(response.body.replaceAll('https://', 'http://')));
      return model;
    } else {
      throw Exception('Status Error');
    }
  }

  ///[lazyLoadSearch] is a method that is used to lazy load recipes.
  Future<Recipes> lazyLoadSearch(String nextPage) async {
    var response = await HttpClient.instance.request(
        method: HttpMethods.GET,
        path: nextPage,
        isUriParse: true,
        headers: createHeader());

    if (response!.statusCode == HttpStatus.ok) {
      Recipes model = Recipes.fromJson(
          jsonDecode(response.body.replaceAll('https://', 'http://')));
      return model;
    } else {
      throw Exception('Status Error');
    }
  }

  ///[recipesSearchInfo] is a method that is used to get recipes search info.
  Future<RecipesSearchInfoModel> recipesSearchInfo() async {
    var response = await HttpClient.instance.request(
        method: HttpMethods.GET,
        path: HttpUrls.searcjInfo,
        headers: createHeader());

    if (response!.statusCode == HttpStatus.ok) {
      RecipesSearchInfoModel model = RecipesSearchInfoModel.fromJson(
          jsonDecode(response.body.replaceAll('https://', 'http://'))['paths']
              ['/api/recipes/v2']);
      return model;
    } else {
      throw Exception('Status Error');
    }
  }
}

///[Header] is a class that is used to create a header for the request.
class Header {
  Map<String, String> createHeader({Map<String, String> addHeader = const {}}) {
    Map<String, String> header = {
      'Content-type': 'application/json',
      ...addHeader,
    };

    return header;
  }
}
