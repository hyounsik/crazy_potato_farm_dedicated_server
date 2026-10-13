// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farm_document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FarmDocument _$FarmDocumentFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_FarmDocument',
      json,
      ($checkedConvert) {
        final val = _FarmDocument(
          formatVersion: $checkedConvert(
            'format_version',
            (v) => (v as num).toInt(),
          ),
          tick: $checkedConvert('tick', (v) => (v as num).toInt()),
          nextId: $checkedConvert('next_id', (v) => (v as num).toInt()),
          randomState: $checkedConvert(
            'random_state',
            (v) => (v as List<dynamic>).map((e) => (e as num).toInt()).toList(),
          ),
          food: $checkedConvert('food', (v) => (v as num).toInt()),
          seeds: $checkedConvert(
            'seeds',
            (v) => (v as List<dynamic>)
                .map((e) => SeedStackData.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
          fields: $checkedConvert(
            'fields',
            (v) => (v as List<dynamic>)
                .map((e) => FieldDocument.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'formatVersion': 'format_version',
        'nextId': 'next_id',
        'randomState': 'random_state',
      },
    );

Map<String, dynamic> _$FarmDocumentToJson(_FarmDocument instance) =>
    <String, dynamic>{
      'format_version': instance.formatVersion,
      'tick': instance.tick,
      'next_id': instance.nextId,
      'random_state': instance.randomState,
      'food': instance.food,
      'seeds': instance.seeds.map((e) => e.toJson()).toList(),
      'fields': instance.fields.map((e) => e.toJson()).toList(),
    };

_FieldDocument _$FieldDocumentFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_FieldDocument', json, ($checkedConvert) {
      final val = _FieldDocument(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        rect: $checkedConvert(
          'rect',
          (v) => TileRect.fromJson(v as Map<String, dynamic>),
        ),
        potatoes: $checkedConvert(
          'potatoes',
          (v) => (v as List<dynamic>)
              .map((e) => PotatoDocument.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$FieldDocumentToJson(_FieldDocument instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rect': instance.rect.toJson(),
      'potatoes': instance.potatoes.map((e) => e.toJson()).toList(),
    };

_PotatoDocument _$PotatoDocumentFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_PotatoDocument',
  json,
  ($checkedConvert) {
    final val = _PotatoDocument(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      tile: $checkedConvert(
        'tile',
        (v) => TilePos.fromJson(v as Map<String, dynamic>),
      ),
      type: $checkedConvert('type', (v) => $enumDecode(_$PotatoTypeEnumMap, v)),
      grade: $checkedConvert('grade', (v) => $enumDecode(_$GradeEnumMap, v)),
      grownMillis: $checkedConvert('grown_millis', (v) => (v as num).toInt()),
      livedMillis: $checkedConvert('lived_millis', (v) => (v as num).toInt()),
      productionMillis: $checkedConvert(
        'production_millis',
        (v) => (v as num).toInt(),
      ),
      stored: $checkedConvert('stored', (v) => (v as num).toInt()),
      away: $checkedConvert('away', (v) => v as bool),
    );
    return val;
  },
  fieldKeyMap: const {
    'grownMillis': 'grown_millis',
    'livedMillis': 'lived_millis',
    'productionMillis': 'production_millis',
  },
);

Map<String, dynamic> _$PotatoDocumentToJson(_PotatoDocument instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tile': instance.tile.toJson(),
      'type': _$PotatoTypeEnumMap[instance.type]!,
      'grade': _$GradeEnumMap[instance.grade]!,
      'grown_millis': instance.grownMillis,
      'lived_millis': instance.livedMillis,
      'production_millis': instance.productionMillis,
      'stored': instance.stored,
      'away': instance.away,
    };

const _$PotatoTypeEnumMap = {
  PotatoType.food: 'food',
  PotatoType.combat: 'combat',
  PotatoType.breeding: 'breeding',
  PotatoType.buff: 'buff',
};

const _$GradeEnumMap = {
  Grade.normal: 'normal',
  Grade.rare: 'rare',
  Grade.legendary: 'legendary',
};
