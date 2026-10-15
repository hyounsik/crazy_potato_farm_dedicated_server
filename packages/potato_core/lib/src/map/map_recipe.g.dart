// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MapRecipe _$MapRecipeFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_MapRecipe',
  json,
  ($checkedConvert) {
    final val = _MapRecipe(
      size: $checkedConvert('size', (v) => (v as num).toInt()),
      entry: $checkedConvert(
        'entry',
        (v) => TilePos.fromJson(v as Map<String, dynamic>),
      ),
      exits: $checkedConvert(
        'exits',
        (v) =>
            (v as List<dynamic>?)
                ?.map((e) => TilePos.fromJson(e as Map<String, dynamic>))
                .toList() ??
            const <TilePos>[],
      ),
      exitSites: $checkedConvert(
        'exit_sites',
        (v) => (v as num?)?.toInt() ?? 0,
      ),
      exitSpacing: $checkedConvert(
        'exit_spacing',
        (v) => (v as num?)?.toInt() ?? 0,
      ),
      clearRadius: $checkedConvert('clear_radius', (v) => (v as num).toInt()),
      terrain: $checkedConvert(
        'terrain',
        (v) =>
            (v as List<dynamic>?)
                ?.map((e) => TerrainPiece.fromJson(e as Map<String, dynamic>))
                .toList() ??
            const <TerrainPiece>[],
      ),
      scatter: $checkedConvert(
        'scatter',
        (v) => ScatterRule.fromJson(v as Map<String, dynamic>),
      ),
      rotate: $checkedConvert('rotate', (v) => v as bool? ?? true),
    );
    return val;
  },
  fieldKeyMap: const {
    'exitSites': 'exit_sites',
    'exitSpacing': 'exit_spacing',
    'clearRadius': 'clear_radius',
  },
);

Map<String, dynamic> _$MapRecipeToJson(_MapRecipe instance) =>
    <String, dynamic>{
      'size': instance.size,
      'entry': instance.entry.toJson(),
      'exits': instance.exits.map((e) => e.toJson()).toList(),
      'exit_sites': instance.exitSites,
      'exit_spacing': instance.exitSpacing,
      'clear_radius': instance.clearRadius,
      'terrain': instance.terrain.map((e) => e.toJson()).toList(),
      'scatter': instance.scatter.toJson(),
      'rotate': instance.rotate,
    };

_ScatterRule _$ScatterRuleFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ScatterRule', json, ($checkedConvert) {
      final val = _ScatterRule(
        count: $checkedConvert('count', (v) => (v as num).toInt()),
        bigChance: $checkedConvert(
          'big_chance',
          (v) => (v as num?)?.toDouble() ?? 0.0,
        ),
      );
      return val;
    }, fieldKeyMap: const {'bigChance': 'big_chance'});

Map<String, dynamic> _$ScatterRuleToJson(_ScatterRule instance) =>
    <String, dynamic>{
      'count': instance.count,
      'big_chance': instance.bigChance,
    };

BlobPiece _$BlobPieceFromJson(Map<String, dynamic> json) =>
    $checkedCreate('BlobPiece', json, ($checkedConvert) {
      final val = BlobPiece(
        center: $checkedConvert(
          'center',
          (v) => TilePos.fromJson(v as Map<String, dynamic>),
        ),
        area: $checkedConvert('area', (v) => (v as num).toInt()),
        $type: $checkedConvert('type', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'type'});

Map<String, dynamic> _$BlobPieceToJson(BlobPiece instance) => <String, dynamic>{
  'center': instance.center.toJson(),
  'area': instance.area,
  'type': instance.$type,
};

WallPiece _$WallPieceFromJson(Map<String, dynamic> json) =>
    $checkedCreate('WallPiece', json, ($checkedConvert) {
      final val = WallPiece(
        from: $checkedConvert(
          'from',
          (v) => TilePos.fromJson(v as Map<String, dynamic>),
        ),
        to: $checkedConvert(
          'to',
          (v) => TilePos.fromJson(v as Map<String, dynamic>),
        ),
        thickness: $checkedConvert('thickness', (v) => (v as num).toInt()),
        gap: $checkedConvert('gap', (v) => (v as num).toInt()),
        $type: $checkedConvert('type', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'type'});

Map<String, dynamic> _$WallPieceToJson(WallPiece instance) => <String, dynamic>{
  'from': instance.from.toJson(),
  'to': instance.to.toJson(),
  'thickness': instance.thickness,
  'gap': instance.gap,
  'type': instance.$type,
};

RingPiece _$RingPieceFromJson(Map<String, dynamic> json) =>
    $checkedCreate('RingPiece', json, ($checkedConvert) {
      final val = RingPiece(
        center: $checkedConvert(
          'center',
          (v) => TilePos.fromJson(v as Map<String, dynamic>),
        ),
        radius: $checkedConvert('radius', (v) => (v as num).toInt()),
        thickness: $checkedConvert('thickness', (v) => (v as num).toInt()),
        facing: $checkedConvert(
          'facing',
          (v) => TilePos.fromJson(v as Map<String, dynamic>),
        ),
        gap: $checkedConvert('gap', (v) => (v as num).toInt()),
        $type: $checkedConvert('type', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'type'});

Map<String, dynamic> _$RingPieceToJson(RingPiece instance) => <String, dynamic>{
  'center': instance.center.toJson(),
  'radius': instance.radius,
  'thickness': instance.thickness,
  'facing': instance.facing.toJson(),
  'gap': instance.gap,
  'type': instance.$type,
};

ChunkPiece _$ChunkPieceFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ChunkPiece', json, ($checkedConvert) {
      final val = ChunkPiece(
        chunk: $checkedConvert('chunk', (v) => v as String),
        origin: $checkedConvert(
          'origin',
          (v) => TilePos.fromJson(v as Map<String, dynamic>),
        ),
        quarterTurns: $checkedConvert(
          'quarter_turns',
          (v) => (v as num?)?.toInt() ?? 0,
        ),
        $type: $checkedConvert('type', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'quarterTurns': 'quarter_turns', r'$type': 'type'});

Map<String, dynamic> _$ChunkPieceToJson(ChunkPiece instance) =>
    <String, dynamic>{
      'chunk': instance.chunk,
      'origin': instance.origin.toJson(),
      'quarter_turns': instance.quarterTurns,
      'type': instance.$type,
    };
