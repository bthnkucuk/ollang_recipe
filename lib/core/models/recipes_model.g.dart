// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipes_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipeAdapter extends TypeAdapter<Recipe> {
  @override
  final int typeId = 1;

  @override
  Recipe read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Recipe(
      uri: fields[0] as String?,
      label: fields[1] as String?,
      image: fields[2] as String?,
      images: fields[3] as Images?,
      calories: fields[4] as num?,
      totalTime: fields[5] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, Recipe obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.uri)
      ..writeByte(1)
      ..write(obj.label)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.images)
      ..writeByte(4)
      ..write(obj.calories)
      ..writeByte(5)
      ..write(obj.totalTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ImagesAdapter extends TypeAdapter<Images> {
  @override
  final int typeId = 2;

  @override
  Images read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Images(
      thumbnail: fields[0] as Large?,
    );
  }

  @override
  void write(BinaryWriter writer, Images obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.thumbnail);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImagesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LargeAdapter extends TypeAdapter<Large> {
  @override
  final int typeId = 3;

  @override
  Large read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Large(
      url: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Large obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LargeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
