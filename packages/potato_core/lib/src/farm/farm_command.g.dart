// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farm_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlantSeed _$PlantSeedFromJson(Map<String, dynamic> json) =>
    $checkedCreate('PlantSeed', json, ($checkedConvert) {
      final val = PlantSeed(
        fieldId: $checkedConvert('field_id', (v) => (v as num).toInt()),
        tile: $checkedConvert(
          'tile',
          (v) => TilePos.fromJson(v as Map<String, dynamic>),
        ),
        seed: $checkedConvert(
          'seed',
          (v) => Seed.fromJson(v as Map<String, dynamic>),
        ),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'fieldId': 'field_id', r'$type': 'runtimeType'});

Map<String, dynamic> _$PlantSeedToJson(PlantSeed instance) => <String, dynamic>{
  'field_id': instance.fieldId,
  'tile': instance.tile.toJson(),
  'seed': instance.seed.toJson(),
  'runtimeType': instance.$type,
};

HarvestPotato _$HarvestPotatoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('HarvestPotato', json, ($checkedConvert) {
      final val = HarvestPotato(
        fieldId: $checkedConvert('field_id', (v) => (v as num).toInt()),
        tile: $checkedConvert(
          'tile',
          (v) => TilePos.fromJson(v as Map<String, dynamic>),
        ),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'fieldId': 'field_id', r'$type': 'runtimeType'});

Map<String, dynamic> _$HarvestPotatoToJson(HarvestPotato instance) =>
    <String, dynamic>{
      'field_id': instance.fieldId,
      'tile': instance.tile.toJson(),
      'runtimeType': instance.$type,
    };

HarvestField _$HarvestFieldFromJson(Map<String, dynamic> json) =>
    $checkedCreate('HarvestField', json, ($checkedConvert) {
      final val = HarvestField(
        fieldId: $checkedConvert('field_id', (v) => (v as num).toInt()),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'fieldId': 'field_id', r'$type': 'runtimeType'});

Map<String, dynamic> _$HarvestFieldToJson(HarvestField instance) =>
    <String, dynamic>{
      'field_id': instance.fieldId,
      'runtimeType': instance.$type,
    };

EnhanceGear _$EnhanceGearFromJson(Map<String, dynamic> json) =>
    $checkedCreate('EnhanceGear', json, ($checkedConvert) {
      final val = EnhanceGear(
        worn: $checkedConvert(
          'worn',
          (v) => $enumDecodeNullable(_$GearKindEnumMap, v),
        ),
        index: $checkedConvert('index', (v) => (v as num?)?.toInt()),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$EnhanceGearToJson(EnhanceGear instance) =>
    <String, dynamic>{
      'worn': _$GearKindEnumMap[instance.worn],
      'index': instance.index,
      'runtimeType': instance.$type,
    };

const _$GearKindEnumMap = {
  GearKind.weapon: 'weapon',
  GearKind.bag: 'bag',
  GearKind.belt: 'belt',
};

EquipGear _$EquipGearFromJson(Map<String, dynamic> json) =>
    $checkedCreate('EquipGear', json, ($checkedConvert) {
      final val = EquipGear(
        index: $checkedConvert('index', (v) => (v as num).toInt()),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$EquipGearToJson(EquipGear instance) => <String, dynamic>{
  'index': instance.index,
  'runtimeType': instance.$type,
};

UnequipGear _$UnequipGearFromJson(Map<String, dynamic> json) =>
    $checkedCreate('UnequipGear', json, ($checkedConvert) {
      final val = UnequipGear(
        kind: $checkedConvert('kind', (v) => $enumDecode(_$GearKindEnumMap, v)),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$UnequipGearToJson(UnequipGear instance) =>
    <String, dynamic>{
      'kind': _$GearKindEnumMap[instance.kind]!,
      'runtimeType': instance.$type,
    };

DisassembleGear _$DisassembleGearFromJson(Map<String, dynamic> json) =>
    $checkedCreate('DisassembleGear', json, ($checkedConvert) {
      final val = DisassembleGear(
        index: $checkedConvert('index', (v) => (v as num).toInt()),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$DisassembleGearToJson(DisassembleGear instance) =>
    <String, dynamic>{'index': instance.index, 'runtimeType': instance.$type};

CollectSeeds _$CollectSeedsFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CollectSeeds',
      json,
      ($checkedConvert) {
        final val = CollectSeeds(
          buildingId: $checkedConvert('building_id', (v) => (v as num).toInt()),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'buildingId': 'building_id', r'$type': 'runtimeType'},
    );

Map<String, dynamic> _$CollectSeedsToJson(CollectSeeds instance) =>
    <String, dynamic>{
      'building_id': instance.buildingId,
      'runtimeType': instance.$type,
    };

LightTotem _$LightTotemFromJson(Map<String, dynamic> json) => $checkedCreate(
  'LightTotem',
  json,
  ($checkedConvert) {
    final val = LightTotem(
      buildingId: $checkedConvert('building_id', (v) => (v as num).toInt()),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {'buildingId': 'building_id', r'$type': 'runtimeType'},
);

Map<String, dynamic> _$LightTotemToJson(LightTotem instance) =>
    <String, dynamic>{
      'building_id': instance.buildingId,
      'runtimeType': instance.$type,
    };

RaiseTotemLimit _$RaiseTotemLimitFromJson(Map<String, dynamic> json) =>
    $checkedCreate('RaiseTotemLimit', json, ($checkedConvert) {
      final val = RaiseTotemLimit(
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$RaiseTotemLimitToJson(RaiseTotemLimit instance) =>
    <String, dynamic>{'runtimeType': instance.$type};

WidenPouch _$WidenPouchFromJson(Map<String, dynamic> json) =>
    $checkedCreate('WidenPouch', json, ($checkedConvert) {
      final val = WidenPouch(
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$WidenPouchToJson(WidenPouch instance) =>
    <String, dynamic>{'runtimeType': instance.$type};

WidenGearBox _$WidenGearBoxFromJson(Map<String, dynamic> json) =>
    $checkedCreate('WidenGearBox', json, ($checkedConvert) {
      final val = WidenGearBox(
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$WidenGearBoxToJson(WidenGearBox instance) =>
    <String, dynamic>{'runtimeType': instance.$type};

SellSeed _$SellSeedFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SellSeed', json, ($checkedConvert) {
      final val = SellSeed(
        seed: $checkedConvert(
          'seed',
          (v) => Seed.fromJson(v as Map<String, dynamic>),
        ),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$SellSeedToJson(SellSeed instance) => <String, dynamic>{
  'seed': instance.seed.toJson(),
  'runtimeType': instance.$type,
};

TakeOverflow _$TakeOverflowFromJson(Map<String, dynamic> json) =>
    $checkedCreate('TakeOverflow', json, ($checkedConvert) {
      final val = TakeOverflow(
        seed: $checkedConvert(
          'seed',
          (v) => Seed.fromJson(v as Map<String, dynamic>),
        ),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$TakeOverflowToJson(TakeOverflow instance) =>
    <String, dynamic>{
      'seed': instance.seed.toJson(),
      'runtimeType': instance.$type,
    };

SellOverflow _$SellOverflowFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SellOverflow', json, ($checkedConvert) {
      final val = SellOverflow(
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$SellOverflowToJson(SellOverflow instance) =>
    <String, dynamic>{'runtimeType': instance.$type};

ReadMail _$ReadMailFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ReadMail', json, ($checkedConvert) {
      final val = ReadMail(
        mailId: $checkedConvert('mail_id', (v) => (v as num).toInt()),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'mailId': 'mail_id', r'$type': 'runtimeType'});

Map<String, dynamic> _$ReadMailToJson(ReadMail instance) => <String, dynamic>{
  'mail_id': instance.mailId,
  'runtimeType': instance.$type,
};

ClaimMail _$ClaimMailFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ClaimMail', json, ($checkedConvert) {
      final val = ClaimMail(
        mailId: $checkedConvert('mail_id', (v) => (v as num).toInt()),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'mailId': 'mail_id', r'$type': 'runtimeType'});

Map<String, dynamic> _$ClaimMailToJson(ClaimMail instance) => <String, dynamic>{
  'mail_id': instance.mailId,
  'runtimeType': instance.$type,
};

OpenBlock _$OpenBlockFromJson(Map<String, dynamic> json) =>
    $checkedCreate('OpenBlock', json, ($checkedConvert) {
      final val = OpenBlock(
        block: $checkedConvert(
          'block',
          (v) => TilePos.fromJson(v as Map<String, dynamic>),
        ),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$OpenBlockToJson(OpenBlock instance) => <String, dynamic>{
  'block': instance.block.toJson(),
  'runtimeType': instance.$type,
};

MakeField _$MakeFieldFromJson(Map<String, dynamic> json) =>
    $checkedCreate('MakeField', json, ($checkedConvert) {
      final val = MakeField(
        rect: $checkedConvert(
          'rect',
          (v) => TileRect.fromJson(v as Map<String, dynamic>),
        ),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$MakeFieldToJson(MakeField instance) => <String, dynamic>{
  'rect': instance.rect.toJson(),
  'runtimeType': instance.$type,
};

ResizeField _$ResizeFieldFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ResizeField', json, ($checkedConvert) {
      final val = ResizeField(
        fieldId: $checkedConvert('field_id', (v) => (v as num).toInt()),
        rect: $checkedConvert(
          'rect',
          (v) => TileRect.fromJson(v as Map<String, dynamic>),
        ),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'fieldId': 'field_id', r'$type': 'runtimeType'});

Map<String, dynamic> _$ResizeFieldToJson(ResizeField instance) =>
    <String, dynamic>{
      'field_id': instance.fieldId,
      'rect': instance.rect.toJson(),
      'runtimeType': instance.$type,
    };

MoveField _$MoveFieldFromJson(Map<String, dynamic> json) =>
    $checkedCreate('MoveField', json, ($checkedConvert) {
      final val = MoveField(
        fieldId: $checkedConvert('field_id', (v) => (v as num).toInt()),
        origin: $checkedConvert(
          'origin',
          (v) => TilePos.fromJson(v as Map<String, dynamic>),
        ),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'fieldId': 'field_id', r'$type': 'runtimeType'});

Map<String, dynamic> _$MoveFieldToJson(MoveField instance) => <String, dynamic>{
  'field_id': instance.fieldId,
  'origin': instance.origin.toJson(),
  'runtimeType': instance.$type,
};

RemoveField _$RemoveFieldFromJson(Map<String, dynamic> json) =>
    $checkedCreate('RemoveField', json, ($checkedConvert) {
      final val = RemoveField(
        fieldId: $checkedConvert('field_id', (v) => (v as num).toInt()),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'fieldId': 'field_id', r'$type': 'runtimeType'});

Map<String, dynamic> _$RemoveFieldToJson(RemoveField instance) =>
    <String, dynamic>{
      'field_id': instance.fieldId,
      'runtimeType': instance.$type,
    };

MoveBuilding _$MoveBuildingFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'MoveBuilding',
      json,
      ($checkedConvert) {
        final val = MoveBuilding(
          buildingId: $checkedConvert('building_id', (v) => (v as num).toInt()),
          origin: $checkedConvert(
            'origin',
            (v) => TilePos.fromJson(v as Map<String, dynamic>),
          ),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'buildingId': 'building_id', r'$type': 'runtimeType'},
    );

Map<String, dynamic> _$MoveBuildingToJson(MoveBuilding instance) =>
    <String, dynamic>{
      'building_id': instance.buildingId,
      'origin': instance.origin.toJson(),
      'runtimeType': instance.$type,
    };

BuildBuilding _$BuildBuildingFromJson(Map<String, dynamic> json) =>
    $checkedCreate('BuildBuilding', json, ($checkedConvert) {
      final val = BuildBuilding(
        kind: $checkedConvert('kind', (v) => v as String),
        origin: $checkedConvert(
          'origin',
          (v) => TilePos.fromJson(v as Map<String, dynamic>),
        ),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$BuildBuildingToJson(BuildBuilding instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'origin': instance.origin.toJson(),
      'runtimeType': instance.$type,
    };

UpgradeBuilding _$UpgradeBuildingFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'UpgradeBuilding',
      json,
      ($checkedConvert) {
        final val = UpgradeBuilding(
          buildingId: $checkedConvert('building_id', (v) => (v as num).toInt()),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'buildingId': 'building_id', r'$type': 'runtimeType'},
    );

Map<String, dynamic> _$UpgradeBuildingToJson(UpgradeBuilding instance) =>
    <String, dynamic>{
      'building_id': instance.buildingId,
      'runtimeType': instance.$type,
    };

DemolishBuilding _$DemolishBuildingFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'DemolishBuilding',
      json,
      ($checkedConvert) {
        final val = DemolishBuilding(
          buildingId: $checkedConvert('building_id', (v) => (v as num).toInt()),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'buildingId': 'building_id', r'$type': 'runtimeType'},
    );

Map<String, dynamic> _$DemolishBuildingToJson(DemolishBuilding instance) =>
    <String, dynamic>{
      'building_id': instance.buildingId,
      'runtimeType': instance.$type,
    };

TrainSeed _$TrainSeedFromJson(Map<String, dynamic> json) => $checkedCreate(
  'TrainSeed',
  json,
  ($checkedConvert) {
    final val = TrainSeed(
      buildingId: $checkedConvert('building_id', (v) => (v as num).toInt()),
      seed: $checkedConvert(
        'seed',
        (v) => Seed.fromJson(v as Map<String, dynamic>),
      ),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {'buildingId': 'building_id', r'$type': 'runtimeType'},
);

Map<String, dynamic> _$TrainSeedToJson(TrainSeed instance) => <String, dynamic>{
  'building_id': instance.buildingId,
  'seed': instance.seed.toJson(),
  'runtimeType': instance.$type,
};

ClearPest _$ClearPestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ClearPest', json, ($checkedConvert) {
      final val = ClearPest(
        fieldId: $checkedConvert('field_id', (v) => (v as num).toInt()),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'fieldId': 'field_id', r'$type': 'runtimeType'});

Map<String, dynamic> _$ClearPestToJson(ClearPest instance) => <String, dynamic>{
  'field_id': instance.fieldId,
  'runtimeType': instance.$type,
};

Uproot _$UprootFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Uproot', json, ($checkedConvert) {
      final val = Uproot(
        potatoId: $checkedConvert('potato_id', (v) => (v as num).toInt()),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'potatoId': 'potato_id', r'$type': 'runtimeType'});

Map<String, dynamic> _$UprootToJson(Uproot instance) => <String, dynamic>{
  'potato_id': instance.potatoId,
  'runtimeType': instance.$type,
};

Replant _$ReplantFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Replant',
  json,
  ($checkedConvert) {
    final val = Replant(
      potatoId: $checkedConvert('potato_id', (v) => (v as num).toInt()),
      fieldId: $checkedConvert('field_id', (v) => (v as num).toInt()),
      tile: $checkedConvert(
        'tile',
        (v) => TilePos.fromJson(v as Map<String, dynamic>),
      ),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'potatoId': 'potato_id',
    'fieldId': 'field_id',
    r'$type': 'runtimeType',
  },
);

Map<String, dynamic> _$ReplantToJson(Replant instance) => <String, dynamic>{
  'potato_id': instance.potatoId,
  'field_id': instance.fieldId,
  'tile': instance.tile.toJson(),
  'runtimeType': instance.$type,
};

Retrain _$RetrainFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Retrain',
  json,
  ($checkedConvert) {
    final val = Retrain(
      potatoId: $checkedConvert('potato_id', (v) => (v as num).toInt()),
      buildingId: $checkedConvert('building_id', (v) => (v as num).toInt()),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'potatoId': 'potato_id',
    'buildingId': 'building_id',
    r'$type': 'runtimeType',
  },
);

Map<String, dynamic> _$RetrainToJson(Retrain instance) => <String, dynamic>{
  'potato_id': instance.potatoId,
  'building_id': instance.buildingId,
  'runtimeType': instance.$type,
};

Revive _$ReviveFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Revive', json, ($checkedConvert) {
      final val = Revive(
        potatoId: $checkedConvert('potato_id', (v) => (v as num).toInt()),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'potatoId': 'potato_id', r'$type': 'runtimeType'});

Map<String, dynamic> _$ReviveToJson(Revive instance) => <String, dynamic>{
  'potato_id': instance.potatoId,
  'runtimeType': instance.$type,
};

Depart _$DepartFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Depart', json, ($checkedConvert) {
      final val = Depart(
        food: $checkedConvert('food', (v) => (v as num).toInt()),
        potatoIds: $checkedConvert(
          'potato_ids',
          (v) =>
              (v as List<dynamic>?)?.map((e) => (e as num).toInt()).toList() ??
              const <int>[],
        ),
        zone: $checkedConvert('zone', (v) => v as String?),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'potatoIds': 'potato_ids', r'$type': 'runtimeType'});

Map<String, dynamic> _$DepartToJson(Depart instance) => <String, dynamic>{
  'food': instance.food,
  'potato_ids': instance.potatoIds,
  'zone': instance.zone,
  'runtimeType': instance.$type,
};

UnlockAll _$UnlockAllFromJson(Map<String, dynamic> json) =>
    $checkedCreate('UnlockAll', json, ($checkedConvert) {
      final val = UnlockAll(
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$UnlockAllToJson(UnlockAll instance) => <String, dynamic>{
  'runtimeType': instance.$type,
};

ReturnHome _$ReturnHomeFromJson(Map<String, dynamic> json) => $checkedCreate(
  'ReturnHome',
  json,
  ($checkedConvert) {
    final val = ReturnHome(
      food: $checkedConvert('food', (v) => (v as num).toInt()),
      seeds: $checkedConvert(
        'seeds',
        (v) =>
            (v as List<dynamic>?)
                ?.map((e) => SeedCount.fromJson(e as Map<String, dynamic>))
                .toList() ??
            const <SeedCount>[],
      ),
      materials: $checkedConvert(
        'materials',
        (v) =>
            (v as Map<String, dynamic>?)?.map(
              (k, e) => MapEntry(k, (e as num).toInt()),
            ) ??
            const <String, int>{},
      ),
      potatoIds: $checkedConvert(
        'potato_ids',
        (v) =>
            (v as List<dynamic>?)?.map((e) => (e as num).toInt()).toList() ??
            const <int>[],
      ),
      lostPotatoIds: $checkedConvert(
        'lost_potato_ids',
        (v) =>
            (v as List<dynamic>?)?.map((e) => (e as num).toInt()).toList() ??
            const <int>[],
      ),
      score: $checkedConvert('score', (v) => (v as num?)?.toInt()),
      gear: $checkedConvert(
        'gear',
        (v) =>
            (v as List<dynamic>?)
                ?.map((e) => Gear.fromJson(e as Map<String, dynamic>))
                .toList() ??
            const <Gear>[],
      ),
      equipped: $checkedConvert(
        'equipped',
        (v) => v == null ? null : Equipped.fromJson(v as Map<String, dynamic>),
      ),
      zone: $checkedConvert('zone', (v) => v as String?),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'potatoIds': 'potato_ids',
    'lostPotatoIds': 'lost_potato_ids',
    r'$type': 'runtimeType',
  },
);

Map<String, dynamic> _$ReturnHomeToJson(ReturnHome instance) =>
    <String, dynamic>{
      'food': instance.food,
      'seeds': instance.seeds.map((e) => e.toJson()).toList(),
      'materials': instance.materials,
      'potato_ids': instance.potatoIds,
      'lost_potato_ids': instance.lostPotatoIds,
      'score': instance.score,
      'gear': instance.gear.map((e) => e.toJson()).toList(),
      'equipped': instance.equipped?.toJson(),
      'zone': instance.zone,
      'runtimeType': instance.$type,
    };
