///[RecipesSearchInfoModel] is a model class for recipes search info,
/// its for filtering recipes
class RecipesSearchInfoModel {
  RecipesSearchInfoModel({
    this.recipesSearchInfoModelGet,
  });

  GetSearch? recipesSearchInfoModelGet;

  RecipesSearchInfoModel copyWith({
    GetSearch? recipesSearchInfoModelGet,
  }) =>
      RecipesSearchInfoModel(
        recipesSearchInfoModelGet:
            recipesSearchInfoModelGet ?? this.recipesSearchInfoModelGet,
      );

  factory RecipesSearchInfoModel.fromJson(Map<String, dynamic> json) =>
      RecipesSearchInfoModel(
        recipesSearchInfoModelGet:
            json["get"] == null ? null : GetSearch.fromJson(json["get"]),
      );

  Map<String, dynamic> toJson() => {
        "get": recipesSearchInfoModelGet?.toJson(),
      };
}

class GetSearch {
  GetSearch({
    this.tags,
    this.summary,
    this.description,
    this.parameters,
    this.responses,
  });

  List<String>? tags;
  String? summary;
  String? description;
  List<Parameter>? parameters;
  Map<String, Response>? responses;

  GetSearch copyWith({
    List<String>? tags,
    String? summary,
    String? description,
    List<Parameter>? parameters,
    Map<String, Response>? responses,
  }) =>
      GetSearch(
        tags: tags ?? this.tags,
        summary: summary ?? this.summary,
        description: description ?? this.description,
        parameters: parameters ?? this.parameters,
        responses: responses ?? this.responses,
      );

  factory GetSearch.fromJson(Map<String, dynamic> json) => GetSearch(
        tags: json["tags"] == null
            ? []
            : List<String>.from(json["tags"]!.map((x) => x)),
        summary: json["summary"],
        description: json["description"],
        parameters: json["parameters"] == null
            ? []
            : List<Parameter>.from(
                json["parameters"]!.map((x) => Parameter.fromJson(x))),
        responses: Map.from(json["responses"]!)
            .map((k, v) => MapEntry<String, Response>(k, Response.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "summary": summary,
        "description": description,
        "parameters": parameters == null
            ? []
            : List<dynamic>.from(parameters!.map((x) => x.toJson())),
        "responses": Map.from(responses!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class Parameter {
  Parameter({
    this.name,
    this.parameterIn,
    this.description,
    this.required,
    this.type,
    this.parameterEnum,
    this.xDataThreescaleName,
    this.pattern,
    this.collectionFormat,
    this.uniqueItems,
    this.items,
    this.parameterDefault,
  });

  String? name;
  In? parameterIn;
  String? description;
  bool? required;
  Type? type;
  List<String>? parameterEnum;
  String? xDataThreescaleName;
  String? pattern;
  String? collectionFormat;
  bool? uniqueItems;
  Items? items;
  String? parameterDefault;

  Parameter copyWith({
    String? name,
    In? parameterIn,
    String? description,
    bool? required,
    Type? type,
    List<String>? parameterEnum,
    String? xDataThreescaleName,
    String? pattern,
    String? collectionFormat,
    bool? uniqueItems,
    Items? items,
    String? parameterDefault,
  }) =>
      Parameter(
        name: name ?? this.name,
        parameterIn: parameterIn ?? this.parameterIn,
        description: description ?? this.description,
        required: required ?? this.required,
        type: type ?? this.type,
        parameterEnum: parameterEnum ?? this.parameterEnum,
        xDataThreescaleName: xDataThreescaleName ?? this.xDataThreescaleName,
        pattern: pattern ?? this.pattern,
        collectionFormat: collectionFormat ?? this.collectionFormat,
        uniqueItems: uniqueItems ?? this.uniqueItems,
        items: items ?? this.items,
        parameterDefault: parameterDefault ?? this.parameterDefault,
      );

  factory Parameter.fromJson(Map<String, dynamic> json) => Parameter(
        name: json["name"],
        parameterIn: inValues.map[json["in"]]!,
        description: json["description"],
        required: json["required"],
        type: typeValues.map[json["type"]]!,
        parameterEnum: json["enum"] == null
            ? []
            : List<String>.from(json["enum"]!.map((x) => x)),
        xDataThreescaleName: json["x-data-threescale-name"],
        pattern: json["pattern"],
        collectionFormat: json["collectionFormat"],
        uniqueItems: json["uniqueItems"],
        items: json["items"] == null ? null : Items.fromJson(json["items"]),
        parameterDefault: json["default"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "in": inValues.reverse[parameterIn],
        "description": description,
        "required": required,
        "type": typeValues.reverse[type],
        "enum": parameterEnum == null
            ? []
            : List<dynamic>.from(parameterEnum!.map((x) => x)),
        "x-data-threescale-name": xDataThreescaleName,
        "pattern": pattern,
        "collectionFormat": collectionFormat,
        "uniqueItems": uniqueItems,
        "items": items?.toJson(),
        "default": parameterDefault,
      };
}

class Items {
  Items({
    this.type,
    this.itemsEnum,
  });

  Type? type;
  List<String>? itemsEnum;

  Items copyWith({
    Type? type,
    List<String>? itemsEnum,
  }) =>
      Items(
        type: type ?? this.type,
        itemsEnum: itemsEnum ?? this.itemsEnum,
      );

  factory Items.fromJson(Map<String, dynamic> json) => Items(
        type: typeValues.map[json["type"]]!,
        itemsEnum: json["enum"] == null
            ? []
            : List<String>.from(json["enum"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "type": typeValues.reverse[type],
        "enum": itemsEnum == null
            ? []
            : List<dynamic>.from(itemsEnum!.map((x) => x)),
      };
}

enum Type { STRING, BOOLEAN, ARRAY }

final typeValues = EnumValues(
    {"array": Type.ARRAY, "boolean": Type.BOOLEAN, "string": Type.STRING});

enum In { QUERY, HEADER }

final inValues = EnumValues({"header": In.HEADER, "query": In.QUERY});

class Response {
  Response({
    this.description,
    this.headers,
    this.schema,
  });

  String? description;
  Headers? headers;
  Schema? schema;

  Response copyWith({
    String? description,
    Headers? headers,
    Schema? schema,
  }) =>
      Response(
        description: description ?? this.description,
        headers: headers ?? this.headers,
        schema: schema ?? this.schema,
      );

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        description: json["description"],
        headers:
            json["headers"] == null ? null : Headers.fromJson(json["headers"]),
        schema: json["schema"] == null ? null : Schema.fromJson(json["schema"]),
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "headers": headers?.toJson(),
        "schema": schema?.toJson(),
      };
}

class Headers {
  Headers({
    this.contentLanguage,
  });

  ContentLanguage? contentLanguage;

  Headers copyWith({
    ContentLanguage? contentLanguage,
  }) =>
      Headers(
        contentLanguage: contentLanguage ?? this.contentLanguage,
      );

  factory Headers.fromJson(Map<String, dynamic> json) => Headers(
        contentLanguage: json["Content-Language"] == null
            ? null
            : ContentLanguage.fromJson(json["Content-Language"]),
      );

  Map<String, dynamic> toJson() => {
        "Content-Language": contentLanguage?.toJson(),
      };
}

class ContentLanguage {
  ContentLanguage({
    this.type,
    this.description,
  });

  Type? type;
  String? description;

  ContentLanguage copyWith({
    Type? type,
    String? description,
  }) =>
      ContentLanguage(
        type: type ?? this.type,
        description: description ?? this.description,
      );

  factory ContentLanguage.fromJson(Map<String, dynamic> json) =>
      ContentLanguage(
        type: typeValues.map[json["type"]]!,
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "type": typeValues.reverse[type],
        "description": description,
      };
}

class Schema {
  Schema({
    this.ref,
  });

  String? ref;

  Schema copyWith({
    String? ref,
  }) =>
      Schema(
        ref: ref ?? this.ref,
      );

  factory Schema.fromJson(Map<String, dynamic> json) => Schema(
        ref: json["\u0024ref"],
      );

  Map<String, dynamic> toJson() => {
        "\u0024ref": ref,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
