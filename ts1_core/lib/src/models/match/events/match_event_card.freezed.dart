// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_event_card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MatchEventCard {

/// Match minute when event occurred (0-120+).
 int get minute;/// Event summary title (e.g., "Good Chance Missed", "Goal", "Tackle").
 String get title;/// Detailed description of what happened.
 String get description;/// Phase type during which event occurred.
 MatchPhaseType get phaseType;/// Team side (home or away) involved in event.
 TeamSide get teamSide;/// Optional: Pitch zone where event occurred.
 PitchZone? get zone;/// Optional: Complete attack state if event is attacking action.
/// NULL if event is not an attack (e.g., defensive error, substitution).
/// Includes route (WHERE), mode (HOW), context (WHY).
 AttackState? get attackState;/// Optional: Type of chance if this is a shot/chance event.
 ChanceType? get chanceType;/// Optional: Outcome of chance (goal, saved, wide, etc).
 ChanceOutcome? get chanceOutcome;/// Optional: Quality rating of chance (0.0-1.0; higher = more dangerous).
 double? get chanceQuality;/// Optional: Tactical insight or analysis about the event.
 String? get tacticalInsight;/// Whether this event is marked as major (goal, key chance, sending off, etc).
 bool get isMajor;
/// Create a copy of MatchEventCard
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchEventCardCopyWith<MatchEventCard> get copyWith => _$MatchEventCardCopyWithImpl<MatchEventCard>(this as MatchEventCard, _$identity);

  /// Serializes this MatchEventCard to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchEventCard&&(identical(other.minute, minute) || other.minute == minute)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.phaseType, phaseType) || other.phaseType == phaseType)&&(identical(other.teamSide, teamSide) || other.teamSide == teamSide)&&(identical(other.zone, zone) || other.zone == zone)&&(identical(other.attackState, attackState) || other.attackState == attackState)&&(identical(other.chanceType, chanceType) || other.chanceType == chanceType)&&(identical(other.chanceOutcome, chanceOutcome) || other.chanceOutcome == chanceOutcome)&&(identical(other.chanceQuality, chanceQuality) || other.chanceQuality == chanceQuality)&&(identical(other.tacticalInsight, tacticalInsight) || other.tacticalInsight == tacticalInsight)&&(identical(other.isMajor, isMajor) || other.isMajor == isMajor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,minute,title,description,phaseType,teamSide,zone,attackState,chanceType,chanceOutcome,chanceQuality,tacticalInsight,isMajor);

@override
String toString() {
  return 'MatchEventCard(minute: $minute, title: $title, description: $description, phaseType: $phaseType, teamSide: $teamSide, zone: $zone, attackState: $attackState, chanceType: $chanceType, chanceOutcome: $chanceOutcome, chanceQuality: $chanceQuality, tacticalInsight: $tacticalInsight, isMajor: $isMajor)';
}


}

/// @nodoc
abstract mixin class $MatchEventCardCopyWith<$Res>  {
  factory $MatchEventCardCopyWith(MatchEventCard value, $Res Function(MatchEventCard) _then) = _$MatchEventCardCopyWithImpl;
@useResult
$Res call({
 int minute, String title, String description, MatchPhaseType phaseType, TeamSide teamSide, PitchZone? zone, AttackState? attackState, ChanceType? chanceType, ChanceOutcome? chanceOutcome, double? chanceQuality, String? tacticalInsight, bool isMajor
});


$AttackStateCopyWith<$Res>? get attackState;

}
/// @nodoc
class _$MatchEventCardCopyWithImpl<$Res>
    implements $MatchEventCardCopyWith<$Res> {
  _$MatchEventCardCopyWithImpl(this._self, this._then);

  final MatchEventCard _self;
  final $Res Function(MatchEventCard) _then;

/// Create a copy of MatchEventCard
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? minute = null,Object? title = null,Object? description = null,Object? phaseType = null,Object? teamSide = null,Object? zone = freezed,Object? attackState = freezed,Object? chanceType = freezed,Object? chanceOutcome = freezed,Object? chanceQuality = freezed,Object? tacticalInsight = freezed,Object? isMajor = null,}) {
  return _then(_self.copyWith(
minute: null == minute ? _self.minute : minute // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,phaseType: null == phaseType ? _self.phaseType : phaseType // ignore: cast_nullable_to_non_nullable
as MatchPhaseType,teamSide: null == teamSide ? _self.teamSide : teamSide // ignore: cast_nullable_to_non_nullable
as TeamSide,zone: freezed == zone ? _self.zone : zone // ignore: cast_nullable_to_non_nullable
as PitchZone?,attackState: freezed == attackState ? _self.attackState : attackState // ignore: cast_nullable_to_non_nullable
as AttackState?,chanceType: freezed == chanceType ? _self.chanceType : chanceType // ignore: cast_nullable_to_non_nullable
as ChanceType?,chanceOutcome: freezed == chanceOutcome ? _self.chanceOutcome : chanceOutcome // ignore: cast_nullable_to_non_nullable
as ChanceOutcome?,chanceQuality: freezed == chanceQuality ? _self.chanceQuality : chanceQuality // ignore: cast_nullable_to_non_nullable
as double?,tacticalInsight: freezed == tacticalInsight ? _self.tacticalInsight : tacticalInsight // ignore: cast_nullable_to_non_nullable
as String?,isMajor: null == isMajor ? _self.isMajor : isMajor // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of MatchEventCard
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


/// Adds pattern-matching-related methods to [MatchEventCard].
extension MatchEventCardPatterns on MatchEventCard {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchEventCard value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchEventCard() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchEventCard value)  $default,){
final _that = this;
switch (_that) {
case _MatchEventCard():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchEventCard value)?  $default,){
final _that = this;
switch (_that) {
case _MatchEventCard() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int minute,  String title,  String description,  MatchPhaseType phaseType,  TeamSide teamSide,  PitchZone? zone,  AttackState? attackState,  ChanceType? chanceType,  ChanceOutcome? chanceOutcome,  double? chanceQuality,  String? tacticalInsight,  bool isMajor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchEventCard() when $default != null:
return $default(_that.minute,_that.title,_that.description,_that.phaseType,_that.teamSide,_that.zone,_that.attackState,_that.chanceType,_that.chanceOutcome,_that.chanceQuality,_that.tacticalInsight,_that.isMajor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int minute,  String title,  String description,  MatchPhaseType phaseType,  TeamSide teamSide,  PitchZone? zone,  AttackState? attackState,  ChanceType? chanceType,  ChanceOutcome? chanceOutcome,  double? chanceQuality,  String? tacticalInsight,  bool isMajor)  $default,) {final _that = this;
switch (_that) {
case _MatchEventCard():
return $default(_that.minute,_that.title,_that.description,_that.phaseType,_that.teamSide,_that.zone,_that.attackState,_that.chanceType,_that.chanceOutcome,_that.chanceQuality,_that.tacticalInsight,_that.isMajor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int minute,  String title,  String description,  MatchPhaseType phaseType,  TeamSide teamSide,  PitchZone? zone,  AttackState? attackState,  ChanceType? chanceType,  ChanceOutcome? chanceOutcome,  double? chanceQuality,  String? tacticalInsight,  bool isMajor)?  $default,) {final _that = this;
switch (_that) {
case _MatchEventCard() when $default != null:
return $default(_that.minute,_that.title,_that.description,_that.phaseType,_that.teamSide,_that.zone,_that.attackState,_that.chanceType,_that.chanceOutcome,_that.chanceQuality,_that.tacticalInsight,_that.isMajor);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MatchEventCard extends MatchEventCard {
  const _MatchEventCard({required this.minute, required this.title, required this.description, required this.phaseType, required this.teamSide, this.zone, this.attackState, this.chanceType, this.chanceOutcome, this.chanceQuality, this.tacticalInsight, this.isMajor = false}): super._();
  factory _MatchEventCard.fromJson(Map<String, dynamic> json) => _$MatchEventCardFromJson(json);

/// Match minute when event occurred (0-120+).
@override final  int minute;
/// Event summary title (e.g., "Good Chance Missed", "Goal", "Tackle").
@override final  String title;
/// Detailed description of what happened.
@override final  String description;
/// Phase type during which event occurred.
@override final  MatchPhaseType phaseType;
/// Team side (home or away) involved in event.
@override final  TeamSide teamSide;
/// Optional: Pitch zone where event occurred.
@override final  PitchZone? zone;
/// Optional: Complete attack state if event is attacking action.
/// NULL if event is not an attack (e.g., defensive error, substitution).
/// Includes route (WHERE), mode (HOW), context (WHY).
@override final  AttackState? attackState;
/// Optional: Type of chance if this is a shot/chance event.
@override final  ChanceType? chanceType;
/// Optional: Outcome of chance (goal, saved, wide, etc).
@override final  ChanceOutcome? chanceOutcome;
/// Optional: Quality rating of chance (0.0-1.0; higher = more dangerous).
@override final  double? chanceQuality;
/// Optional: Tactical insight or analysis about the event.
@override final  String? tacticalInsight;
/// Whether this event is marked as major (goal, key chance, sending off, etc).
@override@JsonKey() final  bool isMajor;

/// Create a copy of MatchEventCard
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchEventCardCopyWith<_MatchEventCard> get copyWith => __$MatchEventCardCopyWithImpl<_MatchEventCard>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchEventCardToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchEventCard&&(identical(other.minute, minute) || other.minute == minute)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.phaseType, phaseType) || other.phaseType == phaseType)&&(identical(other.teamSide, teamSide) || other.teamSide == teamSide)&&(identical(other.zone, zone) || other.zone == zone)&&(identical(other.attackState, attackState) || other.attackState == attackState)&&(identical(other.chanceType, chanceType) || other.chanceType == chanceType)&&(identical(other.chanceOutcome, chanceOutcome) || other.chanceOutcome == chanceOutcome)&&(identical(other.chanceQuality, chanceQuality) || other.chanceQuality == chanceQuality)&&(identical(other.tacticalInsight, tacticalInsight) || other.tacticalInsight == tacticalInsight)&&(identical(other.isMajor, isMajor) || other.isMajor == isMajor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,minute,title,description,phaseType,teamSide,zone,attackState,chanceType,chanceOutcome,chanceQuality,tacticalInsight,isMajor);

@override
String toString() {
  return 'MatchEventCard(minute: $minute, title: $title, description: $description, phaseType: $phaseType, teamSide: $teamSide, zone: $zone, attackState: $attackState, chanceType: $chanceType, chanceOutcome: $chanceOutcome, chanceQuality: $chanceQuality, tacticalInsight: $tacticalInsight, isMajor: $isMajor)';
}


}

/// @nodoc
abstract mixin class _$MatchEventCardCopyWith<$Res> implements $MatchEventCardCopyWith<$Res> {
  factory _$MatchEventCardCopyWith(_MatchEventCard value, $Res Function(_MatchEventCard) _then) = __$MatchEventCardCopyWithImpl;
@override @useResult
$Res call({
 int minute, String title, String description, MatchPhaseType phaseType, TeamSide teamSide, PitchZone? zone, AttackState? attackState, ChanceType? chanceType, ChanceOutcome? chanceOutcome, double? chanceQuality, String? tacticalInsight, bool isMajor
});


@override $AttackStateCopyWith<$Res>? get attackState;

}
/// @nodoc
class __$MatchEventCardCopyWithImpl<$Res>
    implements _$MatchEventCardCopyWith<$Res> {
  __$MatchEventCardCopyWithImpl(this._self, this._then);

  final _MatchEventCard _self;
  final $Res Function(_MatchEventCard) _then;

/// Create a copy of MatchEventCard
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? minute = null,Object? title = null,Object? description = null,Object? phaseType = null,Object? teamSide = null,Object? zone = freezed,Object? attackState = freezed,Object? chanceType = freezed,Object? chanceOutcome = freezed,Object? chanceQuality = freezed,Object? tacticalInsight = freezed,Object? isMajor = null,}) {
  return _then(_MatchEventCard(
minute: null == minute ? _self.minute : minute // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,phaseType: null == phaseType ? _self.phaseType : phaseType // ignore: cast_nullable_to_non_nullable
as MatchPhaseType,teamSide: null == teamSide ? _self.teamSide : teamSide // ignore: cast_nullable_to_non_nullable
as TeamSide,zone: freezed == zone ? _self.zone : zone // ignore: cast_nullable_to_non_nullable
as PitchZone?,attackState: freezed == attackState ? _self.attackState : attackState // ignore: cast_nullable_to_non_nullable
as AttackState?,chanceType: freezed == chanceType ? _self.chanceType : chanceType // ignore: cast_nullable_to_non_nullable
as ChanceType?,chanceOutcome: freezed == chanceOutcome ? _self.chanceOutcome : chanceOutcome // ignore: cast_nullable_to_non_nullable
as ChanceOutcome?,chanceQuality: freezed == chanceQuality ? _self.chanceQuality : chanceQuality // ignore: cast_nullable_to_non_nullable
as double?,tacticalInsight: freezed == tacticalInsight ? _self.tacticalInsight : tacticalInsight // ignore: cast_nullable_to_non_nullable
as String?,isMajor: null == isMajor ? _self.isMajor : isMajor // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of MatchEventCard
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
