// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'phase_resolution_snapshot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PhaseResolutionSnapshot {

 int get id;/// Sequential phase number in the match (0-indexed).
 int get phaseIndex;/// Match minute when phase occurred (0-120+).
 int get minute;/// Phase type (what exact phase/state is happening).
 MatchPhaseType get phaseType;/// Team with ball initiative during this phase.
 TeamSide? get initiativeTeam;/// Team with possession during majority of this phase.
 TeamSide? get possessionTeam;/// Team dominating territorial control during this phase.
 TeamSide? get territoryTeam;/// Optional: Complete attack state if this was an attacking phase.
/// INCLUDES: route (spatial), mode (tactical), context (situational).
/// NULL if phase was not attacking (e.g., defensive organization, substitution).
 AttackState? get attackState;/// Optional: Type of chance if a clear-cut chance occurred.
 ChanceType? get chanceType;/// Optional: Outcome if a chance was taken (goal, saved, etc).
 ChanceOutcome? get chanceOutcome;/// Optional: Quality metric of chance (0.0-1.0).
 double? get chanceQuality;/// Optional: Primary pitch zone where phase activity occurred.
 PitchZone? get zone;/// Whether this phase is marked as important for match narrative.
 bool get isImportant;
/// Create a copy of PhaseResolutionSnapshot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhaseResolutionSnapshotCopyWith<PhaseResolutionSnapshot> get copyWith => _$PhaseResolutionSnapshotCopyWithImpl<PhaseResolutionSnapshot>(this as PhaseResolutionSnapshot, _$identity);

  /// Serializes this PhaseResolutionSnapshot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhaseResolutionSnapshot&&(identical(other.id, id) || other.id == id)&&(identical(other.phaseIndex, phaseIndex) || other.phaseIndex == phaseIndex)&&(identical(other.minute, minute) || other.minute == minute)&&(identical(other.phaseType, phaseType) || other.phaseType == phaseType)&&(identical(other.initiativeTeam, initiativeTeam) || other.initiativeTeam == initiativeTeam)&&(identical(other.possessionTeam, possessionTeam) || other.possessionTeam == possessionTeam)&&(identical(other.territoryTeam, territoryTeam) || other.territoryTeam == territoryTeam)&&(identical(other.attackState, attackState) || other.attackState == attackState)&&(identical(other.chanceType, chanceType) || other.chanceType == chanceType)&&(identical(other.chanceOutcome, chanceOutcome) || other.chanceOutcome == chanceOutcome)&&(identical(other.chanceQuality, chanceQuality) || other.chanceQuality == chanceQuality)&&(identical(other.zone, zone) || other.zone == zone)&&(identical(other.isImportant, isImportant) || other.isImportant == isImportant));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,phaseIndex,minute,phaseType,initiativeTeam,possessionTeam,territoryTeam,attackState,chanceType,chanceOutcome,chanceQuality,zone,isImportant);

@override
String toString() {
  return 'PhaseResolutionSnapshot(id: $id, phaseIndex: $phaseIndex, minute: $minute, phaseType: $phaseType, initiativeTeam: $initiativeTeam, possessionTeam: $possessionTeam, territoryTeam: $territoryTeam, attackState: $attackState, chanceType: $chanceType, chanceOutcome: $chanceOutcome, chanceQuality: $chanceQuality, zone: $zone, isImportant: $isImportant)';
}


}

/// @nodoc
abstract mixin class $PhaseResolutionSnapshotCopyWith<$Res>  {
  factory $PhaseResolutionSnapshotCopyWith(PhaseResolutionSnapshot value, $Res Function(PhaseResolutionSnapshot) _then) = _$PhaseResolutionSnapshotCopyWithImpl;
@useResult
$Res call({
 int id, int phaseIndex, int minute, MatchPhaseType phaseType, TeamSide? initiativeTeam, TeamSide? possessionTeam, TeamSide? territoryTeam, AttackState? attackState, ChanceType? chanceType, ChanceOutcome? chanceOutcome, double? chanceQuality, PitchZone? zone, bool isImportant
});


$AttackStateCopyWith<$Res>? get attackState;

}
/// @nodoc
class _$PhaseResolutionSnapshotCopyWithImpl<$Res>
    implements $PhaseResolutionSnapshotCopyWith<$Res> {
  _$PhaseResolutionSnapshotCopyWithImpl(this._self, this._then);

  final PhaseResolutionSnapshot _self;
  final $Res Function(PhaseResolutionSnapshot) _then;

/// Create a copy of PhaseResolutionSnapshot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? phaseIndex = null,Object? minute = null,Object? phaseType = null,Object? initiativeTeam = freezed,Object? possessionTeam = freezed,Object? territoryTeam = freezed,Object? attackState = freezed,Object? chanceType = freezed,Object? chanceOutcome = freezed,Object? chanceQuality = freezed,Object? zone = freezed,Object? isImportant = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,phaseIndex: null == phaseIndex ? _self.phaseIndex : phaseIndex // ignore: cast_nullable_to_non_nullable
as int,minute: null == minute ? _self.minute : minute // ignore: cast_nullable_to_non_nullable
as int,phaseType: null == phaseType ? _self.phaseType : phaseType // ignore: cast_nullable_to_non_nullable
as MatchPhaseType,initiativeTeam: freezed == initiativeTeam ? _self.initiativeTeam : initiativeTeam // ignore: cast_nullable_to_non_nullable
as TeamSide?,possessionTeam: freezed == possessionTeam ? _self.possessionTeam : possessionTeam // ignore: cast_nullable_to_non_nullable
as TeamSide?,territoryTeam: freezed == territoryTeam ? _self.territoryTeam : territoryTeam // ignore: cast_nullable_to_non_nullable
as TeamSide?,attackState: freezed == attackState ? _self.attackState : attackState // ignore: cast_nullable_to_non_nullable
as AttackState?,chanceType: freezed == chanceType ? _self.chanceType : chanceType // ignore: cast_nullable_to_non_nullable
as ChanceType?,chanceOutcome: freezed == chanceOutcome ? _self.chanceOutcome : chanceOutcome // ignore: cast_nullable_to_non_nullable
as ChanceOutcome?,chanceQuality: freezed == chanceQuality ? _self.chanceQuality : chanceQuality // ignore: cast_nullable_to_non_nullable
as double?,zone: freezed == zone ? _self.zone : zone // ignore: cast_nullable_to_non_nullable
as PitchZone?,isImportant: null == isImportant ? _self.isImportant : isImportant // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of PhaseResolutionSnapshot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AttackStateCopyWith<$Res>? get attackState {
    if (_self.attackState == null) {
    return null;
  }

  return $AttackStateCopyWith<$Res>(_self.attackState!, (value) {
    return _then(_self.copyWith(attackState: value));
  });
}
}


/// Adds pattern-matching-related methods to [PhaseResolutionSnapshot].
extension PhaseResolutionSnapshotPatterns on PhaseResolutionSnapshot {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PhaseResolutionSnapshot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PhaseResolutionSnapshot() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PhaseResolutionSnapshot value)  $default,){
final _that = this;
switch (_that) {
case _PhaseResolutionSnapshot():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PhaseResolutionSnapshot value)?  $default,){
final _that = this;
switch (_that) {
case _PhaseResolutionSnapshot() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int phaseIndex,  int minute,  MatchPhaseType phaseType,  TeamSide? initiativeTeam,  TeamSide? possessionTeam,  TeamSide? territoryTeam,  AttackState? attackState,  ChanceType? chanceType,  ChanceOutcome? chanceOutcome,  double? chanceQuality,  PitchZone? zone,  bool isImportant)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PhaseResolutionSnapshot() when $default != null:
return $default(_that.id,_that.phaseIndex,_that.minute,_that.phaseType,_that.initiativeTeam,_that.possessionTeam,_that.territoryTeam,_that.attackState,_that.chanceType,_that.chanceOutcome,_that.chanceQuality,_that.zone,_that.isImportant);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int phaseIndex,  int minute,  MatchPhaseType phaseType,  TeamSide? initiativeTeam,  TeamSide? possessionTeam,  TeamSide? territoryTeam,  AttackState? attackState,  ChanceType? chanceType,  ChanceOutcome? chanceOutcome,  double? chanceQuality,  PitchZone? zone,  bool isImportant)  $default,) {final _that = this;
switch (_that) {
case _PhaseResolutionSnapshot():
return $default(_that.id,_that.phaseIndex,_that.minute,_that.phaseType,_that.initiativeTeam,_that.possessionTeam,_that.territoryTeam,_that.attackState,_that.chanceType,_that.chanceOutcome,_that.chanceQuality,_that.zone,_that.isImportant);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int phaseIndex,  int minute,  MatchPhaseType phaseType,  TeamSide? initiativeTeam,  TeamSide? possessionTeam,  TeamSide? territoryTeam,  AttackState? attackState,  ChanceType? chanceType,  ChanceOutcome? chanceOutcome,  double? chanceQuality,  PitchZone? zone,  bool isImportant)?  $default,) {final _that = this;
switch (_that) {
case _PhaseResolutionSnapshot() when $default != null:
return $default(_that.id,_that.phaseIndex,_that.minute,_that.phaseType,_that.initiativeTeam,_that.possessionTeam,_that.territoryTeam,_that.attackState,_that.chanceType,_that.chanceOutcome,_that.chanceQuality,_that.zone,_that.isImportant);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PhaseResolutionSnapshot extends PhaseResolutionSnapshot {
  const _PhaseResolutionSnapshot({required this.id, required this.phaseIndex, required this.minute, required this.phaseType, this.initiativeTeam, this.possessionTeam, this.territoryTeam, this.attackState, this.chanceType, this.chanceOutcome, this.chanceQuality, this.zone, this.isImportant = false}): super._();
  factory _PhaseResolutionSnapshot.fromJson(Map<String, dynamic> json) => _$PhaseResolutionSnapshotFromJson(json);

@override final  int id;
/// Sequential phase number in the match (0-indexed).
@override final  int phaseIndex;
/// Match minute when phase occurred (0-120+).
@override final  int minute;
/// Phase type (what exact phase/state is happening).
@override final  MatchPhaseType phaseType;
/// Team with ball initiative during this phase.
@override final  TeamSide? initiativeTeam;
/// Team with possession during majority of this phase.
@override final  TeamSide? possessionTeam;
/// Team dominating territorial control during this phase.
@override final  TeamSide? territoryTeam;
/// Optional: Complete attack state if this was an attacking phase.
/// INCLUDES: route (spatial), mode (tactical), context (situational).
/// NULL if phase was not attacking (e.g., defensive organization, substitution).
@override final  AttackState? attackState;
/// Optional: Type of chance if a clear-cut chance occurred.
@override final  ChanceType? chanceType;
/// Optional: Outcome if a chance was taken (goal, saved, etc).
@override final  ChanceOutcome? chanceOutcome;
/// Optional: Quality metric of chance (0.0-1.0).
@override final  double? chanceQuality;
/// Optional: Primary pitch zone where phase activity occurred.
@override final  PitchZone? zone;
/// Whether this phase is marked as important for match narrative.
@override@JsonKey() final  bool isImportant;

/// Create a copy of PhaseResolutionSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhaseResolutionSnapshotCopyWith<_PhaseResolutionSnapshot> get copyWith => __$PhaseResolutionSnapshotCopyWithImpl<_PhaseResolutionSnapshot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PhaseResolutionSnapshotToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PhaseResolutionSnapshot&&(identical(other.id, id) || other.id == id)&&(identical(other.phaseIndex, phaseIndex) || other.phaseIndex == phaseIndex)&&(identical(other.minute, minute) || other.minute == minute)&&(identical(other.phaseType, phaseType) || other.phaseType == phaseType)&&(identical(other.initiativeTeam, initiativeTeam) || other.initiativeTeam == initiativeTeam)&&(identical(other.possessionTeam, possessionTeam) || other.possessionTeam == possessionTeam)&&(identical(other.territoryTeam, territoryTeam) || other.territoryTeam == territoryTeam)&&(identical(other.attackState, attackState) || other.attackState == attackState)&&(identical(other.chanceType, chanceType) || other.chanceType == chanceType)&&(identical(other.chanceOutcome, chanceOutcome) || other.chanceOutcome == chanceOutcome)&&(identical(other.chanceQuality, chanceQuality) || other.chanceQuality == chanceQuality)&&(identical(other.zone, zone) || other.zone == zone)&&(identical(other.isImportant, isImportant) || other.isImportant == isImportant));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,phaseIndex,minute,phaseType,initiativeTeam,possessionTeam,territoryTeam,attackState,chanceType,chanceOutcome,chanceQuality,zone,isImportant);

@override
String toString() {
  return 'PhaseResolutionSnapshot(id: $id, phaseIndex: $phaseIndex, minute: $minute, phaseType: $phaseType, initiativeTeam: $initiativeTeam, possessionTeam: $possessionTeam, territoryTeam: $territoryTeam, attackState: $attackState, chanceType: $chanceType, chanceOutcome: $chanceOutcome, chanceQuality: $chanceQuality, zone: $zone, isImportant: $isImportant)';
}


}

/// @nodoc
abstract mixin class _$PhaseResolutionSnapshotCopyWith<$Res> implements $PhaseResolutionSnapshotCopyWith<$Res> {
  factory _$PhaseResolutionSnapshotCopyWith(_PhaseResolutionSnapshot value, $Res Function(_PhaseResolutionSnapshot) _then) = __$PhaseResolutionSnapshotCopyWithImpl;
@override @useResult
$Res call({
 int id, int phaseIndex, int minute, MatchPhaseType phaseType, TeamSide? initiativeTeam, TeamSide? possessionTeam, TeamSide? territoryTeam, AttackState? attackState, ChanceType? chanceType, ChanceOutcome? chanceOutcome, double? chanceQuality, PitchZone? zone, bool isImportant
});


@override $AttackStateCopyWith<$Res>? get attackState;

}
/// @nodoc
class __$PhaseResolutionSnapshotCopyWithImpl<$Res>
    implements _$PhaseResolutionSnapshotCopyWith<$Res> {
  __$PhaseResolutionSnapshotCopyWithImpl(this._self, this._then);

  final _PhaseResolutionSnapshot _self;
  final $Res Function(_PhaseResolutionSnapshot) _then;

/// Create a copy of PhaseResolutionSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? phaseIndex = null,Object? minute = null,Object? phaseType = null,Object? initiativeTeam = freezed,Object? possessionTeam = freezed,Object? territoryTeam = freezed,Object? attackState = freezed,Object? chanceType = freezed,Object? chanceOutcome = freezed,Object? chanceQuality = freezed,Object? zone = freezed,Object? isImportant = null,}) {
  return _then(_PhaseResolutionSnapshot(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,phaseIndex: null == phaseIndex ? _self.phaseIndex : phaseIndex // ignore: cast_nullable_to_non_nullable
as int,minute: null == minute ? _self.minute : minute // ignore: cast_nullable_to_non_nullable
as int,phaseType: null == phaseType ? _self.phaseType : phaseType // ignore: cast_nullable_to_non_nullable
as MatchPhaseType,initiativeTeam: freezed == initiativeTeam ? _self.initiativeTeam : initiativeTeam // ignore: cast_nullable_to_non_nullable
as TeamSide?,possessionTeam: freezed == possessionTeam ? _self.possessionTeam : possessionTeam // ignore: cast_nullable_to_non_nullable
as TeamSide?,territoryTeam: freezed == territoryTeam ? _self.territoryTeam : territoryTeam // ignore: cast_nullable_to_non_nullable
as TeamSide?,attackState: freezed == attackState ? _self.attackState : attackState // ignore: cast_nullable_to_non_nullable
as AttackState?,chanceType: freezed == chanceType ? _self.chanceType : chanceType // ignore: cast_nullable_to_non_nullable
as ChanceType?,chanceOutcome: freezed == chanceOutcome ? _self.chanceOutcome : chanceOutcome // ignore: cast_nullable_to_non_nullable
as ChanceOutcome?,chanceQuality: freezed == chanceQuality ? _self.chanceQuality : chanceQuality // ignore: cast_nullable_to_non_nullable
as double?,zone: freezed == zone ? _self.zone : zone // ignore: cast_nullable_to_non_nullable
as PitchZone?,isImportant: null == isImportant ? _self.isImportant : isImportant // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of PhaseResolutionSnapshot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AttackStateCopyWith<$Res>? get attackState {
    if (_self.attackState == null) {
    return null;
  }

  return $AttackStateCopyWith<$Res>(_self.attackState!, (value) {
    return _then(_self.copyWith(attackState: value));
  });
}
}

// dart format on
