import 'package:json_annotation/json_annotation.dart';

part 'farm_totals.g.dart';

/// Running counts since the farm was made, saved with it.
///
/// Things that happen every few seconds (a bite, an upkeep payment) would
/// flood the event list over a long catch-up, so they are counted here
/// instead. A summary compares the totals before and after.
@JsonSerializable()
final class FarmTotals {
  FarmTotals({
    this.upkeepPaid = 0,
    this.foodEatenByBugs = 0,
    this.lifeLostToBlightMillis = 0,
    this.pestsAppeared = 0,
    this.pestsClearedByGuards = 0,
    this.pestsClearedByTap = 0,
  });

  factory FarmTotals.fromJson(Map<String, dynamic> json) =>
      _$FarmTotalsFromJson(json);

  /// Baby potatoes paid as upkeep.
  int upkeepPaid;
  int foodEatenByBugs;

  /// Extra life used by potatoes in blighted fields, added up.
  int lifeLostToBlightMillis;
  int pestsAppeared;
  int pestsClearedByGuards;
  int pestsClearedByTap;

  FarmTotals copy() => FarmTotals.fromJson(toJson());

  /// What changed since [before], as totals.
  FarmTotals since(FarmTotals before) => FarmTotals(
    upkeepPaid: upkeepPaid - before.upkeepPaid,
    foodEatenByBugs: foodEatenByBugs - before.foodEatenByBugs,
    lifeLostToBlightMillis:
        lifeLostToBlightMillis - before.lifeLostToBlightMillis,
    pestsAppeared: pestsAppeared - before.pestsAppeared,
    pestsClearedByGuards: pestsClearedByGuards - before.pestsClearedByGuards,
    pestsClearedByTap: pestsClearedByTap - before.pestsClearedByTap,
  );

  Map<String, dynamic> toJson() => _$FarmTotalsToJson(this);
}
