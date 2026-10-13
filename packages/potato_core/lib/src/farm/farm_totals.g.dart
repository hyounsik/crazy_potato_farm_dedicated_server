// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farm_totals.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FarmTotals _$FarmTotalsFromJson(Map<String, dynamic> json) => $checkedCreate(
  'FarmTotals',
  json,
  ($checkedConvert) {
    final val = FarmTotals(
      upkeepPaid: $checkedConvert(
        'upkeep_paid',
        (v) => (v as num?)?.toInt() ?? 0,
      ),
      foodEatenByBugs: $checkedConvert(
        'food_eaten_by_bugs',
        (v) => (v as num?)?.toInt() ?? 0,
      ),
      lifeLostToBlightMillis: $checkedConvert(
        'life_lost_to_blight_millis',
        (v) => (v as num?)?.toInt() ?? 0,
      ),
      pestsAppeared: $checkedConvert(
        'pests_appeared',
        (v) => (v as num?)?.toInt() ?? 0,
      ),
      pestsClearedByGuards: $checkedConvert(
        'pests_cleared_by_guards',
        (v) => (v as num?)?.toInt() ?? 0,
      ),
      pestsClearedByTap: $checkedConvert(
        'pests_cleared_by_tap',
        (v) => (v as num?)?.toInt() ?? 0,
      ),
      foodHarvestedByGuards: $checkedConvert(
        'food_harvested_by_guards',
        (v) => (v as num?)?.toInt() ?? 0,
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'upkeepPaid': 'upkeep_paid',
    'foodEatenByBugs': 'food_eaten_by_bugs',
    'lifeLostToBlightMillis': 'life_lost_to_blight_millis',
    'pestsAppeared': 'pests_appeared',
    'pestsClearedByGuards': 'pests_cleared_by_guards',
    'pestsClearedByTap': 'pests_cleared_by_tap',
    'foodHarvestedByGuards': 'food_harvested_by_guards',
  },
);

Map<String, dynamic> _$FarmTotalsToJson(FarmTotals instance) =>
    <String, dynamic>{
      'upkeep_paid': instance.upkeepPaid,
      'food_eaten_by_bugs': instance.foodEatenByBugs,
      'life_lost_to_blight_millis': instance.lifeLostToBlightMillis,
      'pests_appeared': instance.pestsAppeared,
      'pests_cleared_by_guards': instance.pestsClearedByGuards,
      'pests_cleared_by_tap': instance.pestsClearedByTap,
      'food_harvested_by_guards': instance.foodHarvestedByGuards,
    };
