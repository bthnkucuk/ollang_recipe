// ignore_for_file: constant_identifier_names

import 'package:get/state_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'recipes_model.g.dart';

class Recipies {
  Recipies({
    this.from,
    this.to,
    this.count,
    this.links,
    this.hits,
  });

  num? from;
  num? to;
  num? count;
  WelcomeLinks? links;
  List<Hit>? hits;

  Recipies fromJson(Map<String, dynamic> json) => Recipies(
        from: json["from"],
        to: json["to"],
        count: json["count"],
        links: json["_links"] == null ? null : WelcomeLinks.fromJson(json["_links"]),
        hits: json["hits"] == null ? [] : List<Hit>.from(json["hits"]!.map((x) => Hit.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "from": from,
        "to": to,
        "count": count,
        "_links": links?.toJson(),
        "hits": hits == null ? [] : List<dynamic>.from(hits!.map((x) => x.toJson())),
      };
}

class Hit {
  Hit({
    this.recipe,
    this.links,
  });

  Recipe? recipe;
  HitLinks? links;

  factory Hit.fromJson(Map<String, dynamic> json) => Hit(
        recipe: json["recipe"] == null ? null : Recipe.fromJson(json["recipe"]),
        links: json["_links"] == null ? null : HitLinks.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "recipe": recipe?.toJson(),
        "_links": links?.toJson(),
      };
}

class HitLinks {
  HitLinks({
    this.self,
  });

  Next? self;

  factory HitLinks.fromJson(Map<String, dynamic> json) => HitLinks(
        self: json["self"] == null ? null : Next.fromJson(json["self"]),
      );

  Map<String, dynamic> toJson() => {
        "self": self?.toJson(),
      };
}

class Next {
  Next({
    this.href,
    this.title,
  });

  String? href;
  Title? title;

  factory Next.fromJson(Map<String, dynamic> json) => Next(
        href: json["href"],
        title: titleValues.map[json["title"]]!,
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "title": titleValues.reverse[title],
      };
}

enum Title { NEXT_PAGE, SELF }

final titleValues = EnumValues({"Next page": Title.NEXT_PAGE, "Self": Title.SELF});

@HiveType(typeId: 1)
class Recipe {
  Recipe({
    this.uri,
    this.label,
    this.image,
    this.images,
    this.source,
    this.url,
    this.shareAs,
    this.recipeYield,
    this.dietLabels,
    this.healthLabels,
    this.cautions,
    this.ingredientLines,
    this.ingredients,
    this.calories,
    this.totalWeight,
    this.totalTime,
    this.cuisineType,
    this.mealType,
    this.dishType,
    this.totalNutrients,
    this.totalDaily,
    this.digest,
  });

  @HiveField(0)
  String? uri;
  @HiveField(1)
  String? label;
  @HiveField(2)
  String? image;
  @HiveField(3)
  Images? images;
  String? source;
  String? url;
  String? shareAs;
  num? recipeYield;
  List<DietLabel?>? dietLabels;
  List<String?>? healthLabels;
  List<Caution?>? cautions;
  List<String>? ingredientLines;
  List<Ingredient>? ingredients;
  @HiveField(4)
  num? calories;
  num? totalWeight;
  @HiveField(5)
  num? totalTime;
  List<String>? cuisineType;
  List<MealType?>? mealType;
  List<DishType?>? dishType;
  Map<String, Total>? totalNutrients;
  Map<String, Total>? totalDaily;
  List<Digest?>? digest;
  RxBool isFavorite = false.obs;

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        uri: json["uri"],
        label: json["label"],
        image: json["image"],
        images: json["images"] == null ? null : Images.fromJson(json["images"]),
        source: json["source"],
        url: json["url"],
        shareAs: json["shareAs"],
        recipeYield: json["yield"],
        dietLabels: json["dietLabels"] == null
            ? []
            : List<DietLabel?>.from(json["dietLabels"].map((x) => dietLabelValues.map[x])),
        healthLabels: json["healthLabels"] == null ? [] : List<String?>.from(json["healthLabels"].map((x) => x)),
        cautions:
            json["cautions"] == null ? [] : List<Caution?>.from(json["cautions"]!.map((x) => cautionValues.map[x])),
        ingredientLines:
            json["ingredientLines"] == null ? [] : List<String>.from(json["ingredientLines"]!.map((x) => x)),
        ingredients: json["ingredients"] == null
            ? []
            : List<Ingredient>.from(json["ingredients"]!.map((x) => Ingredient.fromJson(x))),
        calories: json["calories"]?.toDouble(),
        totalWeight: json["totalWeight"]?.toDouble(),
        totalTime: json["totalTime"],
        cuisineType: json["cuisineType"] == null ? [] : List<String>.from(json["cuisineType"]!.map((x) => x)),
        mealType:
            json["mealType"] == null ? [] : List<MealType?>.from(json["mealType"]!.map((x) => mealTypeValues.map[x])),
        dishType:
            json["dishType"] == null ? [] : List<DishType?>.from(json["dishType"]!.map((x) => dishTypeValues.map[x])),
        totalNutrients: Map.from(json["totalNutrients"]!).map((k, v) => MapEntry<String, Total>(k, Total.fromJson(v))),
        totalDaily: Map.from(json["totalDaily"]!).map((k, v) => MapEntry<String, Total>(k, Total.fromJson(v))),
        digest: json["digest"] == null ? [] : List<Digest>.from(json["digest"]!.map((x) => Digest.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "uri": uri,
        "label": label,
        "image": image,
        "images": images?.toJson(),
        "source": source,
        "url": url,
        "shareAs": shareAs,
        "yield": recipeYield,
        "dietLabels": dietLabels == null ? [] : List<dynamic>.from(dietLabels!.map((x) => dietLabelValues.reverse[x])),
        "healthLabels": healthLabels == null ? [] : List<dynamic>.from(healthLabels!.map((x) => x)),
        "cautions": cautions == null ? [] : List<dynamic>.from(cautions!.map((x) => cautionValues.reverse[x])),
        "ingredientLines": ingredientLines == null ? [] : List<dynamic>.from(ingredientLines!.map((x) => x)),
        "ingredients": ingredients == null ? [] : List<dynamic>.from(ingredients!.map((x) => x.toJson())),
        "calories": calories,
        "totalWeight": totalWeight,
        "totalTime": totalTime,
        "cuisineType": cuisineType == null ? [] : List<dynamic>.from(cuisineType!.map((x) => x)),
        "mealType": mealType == null ? [] : List<dynamic>.from(mealType!.map((x) => mealTypeValues.reverse[x])),
        "dishType": dishType == null ? [] : List<dynamic>.from(dishType!.map((x) => dishTypeValues.reverse[x])),
        "totalNutrients": Map.from(totalNutrients!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "totalDaily": Map.from(totalDaily!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "digest": digest == null ? [] : List<dynamic>.from(digest!.map((x) => x!.toJson())),
      };
}

enum Caution { SULFITES, FODMAP, GLUTEN, WHEAT }

final cautionValues = EnumValues(
    {"FODMAP": Caution.FODMAP, "Gluten": Caution.GLUTEN, "Sulfites": Caution.SULFITES, "Wheat": Caution.WHEAT});

enum DietLabel { HIGH_FIBER, LOW_CARB, LOW_SODIUM, BALANCED }

final dietLabelValues = EnumValues({
  "Balanced": DietLabel.BALANCED,
  "High-Fiber": DietLabel.HIGH_FIBER,
  "Low-Carb": DietLabel.LOW_CARB,
  "Low-Sodium": DietLabel.LOW_SODIUM
});

class Digest {
  Digest({
    this.label,
    this.tag,
    this.schemaOrgTag,
    this.total,
    this.hasRdi,
    this.daily,
    this.unit,
    this.sub,
  });

  String? label;
  String? tag;
  SchemaOrgTag? schemaOrgTag;
  num? total;
  bool? hasRdi;
  num? daily;
  Unit? unit;
  List<Digest>? sub;

  factory Digest.fromJson(Map<String, dynamic> json) => Digest(
        label: json["label"],
        tag: json["tag"],
        schemaOrgTag: schemaOrgTagValues.map[json["schemaOrgTag"]],
        total: json["total"]?.toDouble(),
        hasRdi: json["hasRDI"],
        daily: json["daily"]?.toDouble(),
        unit: unitValues.map[json["unit"]],
        sub: json["sub"] == null ? [] : List<Digest>.from(json["sub"]!.map((x) => Digest.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "tag": tag,
        "schemaOrgTag": schemaOrgTagValues.reverse[schemaOrgTag],
        "total": total,
        "hasRDI": hasRdi,
        "daily": daily,
        "unit": unitValues.reverse[unit],
        "sub": sub == null ? [] : List<dynamic>.from(sub!.map((x) => x.toJson())),
      };
}

enum SchemaOrgTag {
  FAT_CONTENT,
  CARBOHYDRATE_CONTENT,
  PROTEIN_CONTENT,
  CHOLESTEROL_CONTENT,
  SODIUM_CONTENT,
  SATURATED_FAT_CONTENT,
  TRANS_FAT_CONTENT,
  FIBER_CONTENT,
  SUGAR_CONTENT
}

final schemaOrgTagValues = EnumValues({
  "carbohydrateContent": SchemaOrgTag.CARBOHYDRATE_CONTENT,
  "cholesterolContent": SchemaOrgTag.CHOLESTEROL_CONTENT,
  "fatContent": SchemaOrgTag.FAT_CONTENT,
  "fiberContent": SchemaOrgTag.FIBER_CONTENT,
  "proteinContent": SchemaOrgTag.PROTEIN_CONTENT,
  "saturatedFatContent": SchemaOrgTag.SATURATED_FAT_CONTENT,
  "sodiumContent": SchemaOrgTag.SODIUM_CONTENT,
  "sugarContent": SchemaOrgTag.SUGAR_CONTENT,
  "transFatContent": SchemaOrgTag.TRANS_FAT_CONTENT
});

enum Unit { G, MG, UNIT_G, EMPTY, KCAL }

final unitValues = EnumValues({"%": Unit.EMPTY, "g": Unit.G, "kcal": Unit.KCAL, "mg": Unit.MG, "µg": Unit.UNIT_G});

enum DishType { SALAD, CONDIMENTS_AND_SAUCES }

final dishTypeValues = EnumValues({"condiments and sauces": DishType.CONDIMENTS_AND_SAUCES, "salad": DishType.SALAD});

@HiveType(typeId: 2)
class Images {
  Images({
    this.thumbnail,
    this.small,
    this.regular,
    this.large,
  });

  @HiveField(0)
  Large? thumbnail;
  Large? small;
  Large? regular;
  Large? large;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        thumbnail: json["THUMBNAIL"] == null ? null : Large.fromJson(json["THUMBNAIL"]),
        small: json["SMALL"] == null ? null : Large.fromJson(json["SMALL"]),
        regular: json["REGULAR"] == null ? null : Large.fromJson(json["REGULAR"]),
        large: json["LARGE"] == null ? null : Large.fromJson(json["LARGE"]),
      );

  Map<String, dynamic> toJson() => {
        "THUMBNAIL": thumbnail?.toJson(),
        "SMALL": small?.toJson(),
        "REGULAR": regular?.toJson(),
        "LARGE": large?.toJson(),
      };
}

@HiveType(typeId: 3)
class Large {
  Large({
    this.url,
    this.width,
    this.height,
  });
  @HiveField(0)
  String? url;
  num? width;
  num? height;

  factory Large.fromJson(Map<String, dynamic> json) => Large(
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "width": width,
        "height": height,
      };
}

class Ingredient {
  Ingredient({
    this.text,
    this.quantity,
    this.measure,
    this.food,
    this.weight,
    this.foodCategory,
    this.foodId,
    this.image,
  });

  String? text;
  num? quantity;
  String? measure;
  String? food;
  num? weight;
  String? foodCategory;
  String? foodId;
  String? image;

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        text: json["text"],
        quantity: json["quantity"]?.toDouble(),
        measure: json["measure"],
        food: json["food"],
        weight: json["weight"]?.toDouble(),
        foodCategory: json["foodCategory"],
        foodId: json["foodId"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "quantity": quantity,
        "measure": measure,
        "food": food,
        "weight": weight,
        "foodCategory": foodCategory,
        "foodId": foodId,
        "image": image,
      };
}

enum MealType { LUNCH_DINNER }

final mealTypeValues = EnumValues({"lunch/dinner": MealType.LUNCH_DINNER});

class Total {
  Total({
    this.label,
    this.quantity,
    this.unit,
  });

  String? label;
  num? quantity;
  Unit? unit;

  factory Total.fromJson(Map<String, dynamic> json) => Total(
        label: json["label"],
        quantity: json["quantity"]?.toDouble(),
        unit: unitValues.map[json["unit"]],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "quantity": quantity,
        "unit": unitValues.reverse[unit],
      };
}

class WelcomeLinks {
  WelcomeLinks({
    this.next,
  });

  Next? next;

  factory WelcomeLinks.fromJson(Map<String, dynamic> json) => WelcomeLinks(
        next: json["next"] == null ? null : Next.fromJson(json["next"]),
      );

  Map<String, dynamic> toJson() => {
        "next": next?.toJson(),
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
