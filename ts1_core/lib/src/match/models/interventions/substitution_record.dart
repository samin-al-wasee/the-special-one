import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ts1_core/src/core/enums/match_enums.dart';

part 'substitution_record.freezed.dart';
part 'substitution_record.g.dart';

@freezed
abstract class SubstitutionRecord with _$SubstitutionRecord {
  const factory SubstitutionRecord({
    required int id,
    required int minute,
    required TeamSide teamSide,
    required int playerOutId,
    required int playerInId,
    required SubstitutionType type,
    String? reason,
  }) = _SubstitutionRecord;

  const SubstitutionRecord._();

  factory SubstitutionRecord.fromJson(Map<String, dynamic> json) =>
      _$SubstitutionRecordFromJson(json);
}
