// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'formation_shape.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FormationShape _$FormationShapeFromJson(Map<String, dynamic> json) =>
    _FormationShape(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      slotDefinitions: (json['slotDefinitions'] as List<dynamic>)
          .map((e) => FormationSlot.fromJson(e as Map<String, dynamic>))
          .toList(),
      structuralTags:
          (json['structuralTags'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, (e as num).toDouble()),
          ) ??
          const {},
    );

Map<String, dynamic> _$FormationShapeToJson(_FormationShape instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'slotDefinitions': instance.slotDefinitions,
      'structuralTags': instance.structuralTags,
    };
