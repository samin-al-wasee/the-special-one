// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MatchState {

 int get id;// ==================== MATCH FLOW SYSTEM ====================
 MatchStatus get status; MatchClock get clock; int get currentPhaseIndex; MatchPhaseType get currentPhaseType;// ==================== SCORE and RESULT SYSTEM ====================
 Scoreline get scoreline; ShootoutScore get shootoutScore;// ==================== TACTICAL FLOW SYSTEM ====================
 TeamSide? get currentInitiative; TeamSide? get currentPossession; TeamSide? get currentTerritoryControl;// ==================== TEAM PERFORMANCE SYSTEM ====================
 TeamMatchStats get homeStats; TeamMatchStats get awayStats;// ==================== POSITIONAL / DYNAMICS SYSTEM ====================
 MatchDynamics get dynamics;// ==================== MATCHUP ADVANTAGE SYSTEM ====================
 MatchupState get matchupState;// ==================== PHASE HISTORY SYSTEM ====================
 List<PhaseResolutionSnapshot> get phaseHistory;// ==================== EVENT SYSTEM ====================
 List<MatchEventCard> get eventCards;// ==================== TACTICAL INTELLIGENCE SYSTEM ====================
 List<TacticalInsight> get tacticalInsights;// ==================== INTERVENTION SYSTEM ====================
 List<SubstitutionRecord> get substitutions; List<ManagerIntervention> get interventions;
/// Create a copy of MatchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchStateCopyWith<MatchState> get copyWith => _$MatchStateCopyWithImpl<MatchState>(this as MatchState, _$identity);

  /// Serializes this MatchState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchState&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.clock, clock) || other.clock == clock)&&(identical(other.currentPhaseIndex, currentPhaseIndex) || other.currentPhaseIndex == currentPhaseIndex)&&(identical(other.currentPhaseType, currentPhaseType) || other.currentPhaseType == currentPhaseType)&&(identical(other.scoreline, scoreline) || other.scoreline == scoreline)&&(identical(other.shootoutScore, shootoutScore) || other.shootoutScore == shootoutScore)&&(identical(other.currentInitiative, currentInitiative) || other.currentInitiative == currentInitiative)&&(identical(other.currentPossession, currentPossession) || other.currentPossession == currentPossession)&&(identical(other.currentTerritoryControl, currentTerritoryControl) || other.currentTerritoryControl == currentTerritoryControl)&&(identical(other.homeStats, homeStats) || other.homeStats == homeStats)&&(identical(other.awayStats, awayStats) || other.awayStats == awayStats)&&(identical(other.dynamics, dynamics) || other.dynamics == dynamics)&&(identical(other.matchupState, matchupState) || other.matchupState == matchupState)&&const DeepCollectionEquality().equals(other.phaseHistory, phaseHistory)&&const DeepCollectionEquality().equals(other.eventCards, eventCards)&&const DeepCollectionEquality().equals(other.tacticalInsights, tacticalInsights)&&const DeepCollectionEquality().equals(other.substitutions, substitutions)&&const DeepCollectionEquality().equals(other.interventions, interventions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,status,clock,currentPhaseIndex,currentPhaseType,scoreline,shootoutScore,currentInitiative,currentPossession,currentTerritoryControl,homeStats,awayStats,dynamics,matchupState,const DeepCollectionEquality().hash(phaseHistory),const DeepCollectionEquality().hash(eventCards),const DeepCollectionEquality().hash(tacticalInsights),const DeepCollectionEquality().hash(substitutions),const DeepCollectionEquality().hash(interventions)]);

@override
String toString() {
  return 'MatchState(id: $id, status: $status, clock: $clock, currentPhaseIndex: $currentPhaseIndex, currentPhaseType: $currentPhaseType, scoreline: $scoreline, shootoutScore: $shootoutScore, currentInitiative: $currentInitiative, currentPossession: $currentPossession, currentTerritoryControl: $currentTerritoryControl, homeStats: $homeStats, awayStats: $awayStats, dynamics: $dynamics, matchupState: $matchupState, phaseHistory: $phaseHistory, eventCards: $eventCards, tacticalInsights: $tacticalInsights, substitutions: $substitutions, interventions: $interventions)';
}


}

/// @nodoc
abstract mixin class $MatchStateCopyWith<$Res>  {
  factory $MatchStateCopyWith(MatchState value, $Res Function(MatchState) _then) = _$MatchStateCopyWithImpl;
@useResult
$Res call({
 int id, MatchStatus status, MatchClock clock, int currentPhaseIndex, MatchPhaseType currentPhaseType, Scoreline scoreline, ShootoutScore shootoutScore, TeamSide? currentInitiative, TeamSide? currentPossession, TeamSide? currentTerritoryControl, TeamMatchStats homeStats, TeamMatchStats awayStats, MatchDynamics dynamics, MatchupState matchupState, List<PhaseResolutionSnapshot> phaseHistory, List<MatchEventCard> eventCards, List<TacticalInsight> tacticalInsights, List<SubstitutionRecord> substitutions, List<ManagerIntervention> interventions
});


$MatchClockCopyWith<$Res> get clock;$ScorelineCopyWith<$Res> get scoreline;$ShootoutScoreCopyWith<$Res> get shootoutScore;$TeamMatchStatsCopyWith<$Res> get homeStats;$TeamMatchStatsCopyWith<$Res> get awayStats;$MatchDynamicsCopyWith<$Res> get dynamics;$MatchupStateCopyWith<$Res> get matchupState;

}
/// @nodoc
class _$MatchStateCopyWithImpl<$Res>
    implements $MatchStateCopyWith<$Res> {
  _$MatchStateCopyWithImpl(this._self, this._then);

  final MatchState _self;
  final $Res Function(MatchState) _then;

/// Create a copy of MatchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? clock = null,Object? currentPhaseIndex = null,Object? currentPhaseType = null,Object? scoreline = null,Object? shootoutScore = null,Object? currentInitiative = freezed,Object? currentPossession = freezed,Object? currentTerritoryControl = freezed,Object? homeStats = null,Object? awayStats = null,Object? dynamics = null,Object? matchupState = null,Object? phaseHistory = null,Object? eventCards = null,Object? tacticalInsights = null,Object? substitutions = null,Object? interventions = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MatchStatus,clock: null == clock ? _self.clock : clock // ignore: cast_nullable_to_non_nullable
as MatchClock,currentPhaseIndex: null == currentPhaseIndex ? _self.currentPhaseIndex : currentPhaseIndex // ignore: cast_nullable_to_non_nullable
as int,currentPhaseType: null == currentPhaseType ? _self.currentPhaseType : currentPhaseType // ignore: cast_nullable_to_non_nullable
as MatchPhaseType,scoreline: null == scoreline ? _self.scoreline : scoreline // ignore: cast_nullable_to_non_nullable
as Scoreline,shootoutScore: null == shootoutScore ? _self.shootoutScore : shootoutScore // ignore: cast_nullable_to_non_nullable
as ShootoutScore,currentInitiative: freezed == currentInitiative ? _self.currentInitiative : currentInitiative // ignore: cast_nullable_to_non_nullable
as TeamSide?,currentPossession: freezed == currentPossession ? _self.currentPossession : currentPossession // ignore: cast_nullable_to_non_nullable
as TeamSide?,currentTerritoryControl: freezed == currentTerritoryControl ? _self.currentTerritoryControl : currentTerritoryControl // ignore: cast_nullable_to_non_nullable
as TeamSide?,homeStats: null == homeStats ? _self.homeStats : homeStats // ignore: cast_nullable_to_non_nullable
as TeamMatchStats,awayStats: null == awayStats ? _self.awayStats : awayStats // ignore: cast_nullable_to_non_nullable
as TeamMatchStats,dynamics: null == dynamics ? _self.dynamics : dynamics // ignore: cast_nullable_to_non_nullable
as MatchDynamics,matchupState: null == matchupState ? _self.matchupState : matchupState // ignore: cast_nullable_to_non_nullable
as MatchupState,phaseHistory: null == phaseHistory ? _self.phaseHistory : phaseHistory // ignore: cast_nullable_to_non_nullable
as List<PhaseResolutionSnapshot>,eventCards: null == eventCards ? _self.eventCards : eventCards // ignore: cast_nullable_to_non_nullable
as List<MatchEventCard>,tacticalInsights: null == tacticalInsights ? _self.tacticalInsights : tacticalInsights // ignore: cast_nullable_to_non_nullable
as List<TacticalInsight>,substitutions: null == substitutions ? _self.substitutions : substitutions // ignore: cast_nullable_to_non_nullable
as List<SubstitutionRecord>,interventions: null == interventions ? _self.interventions : interventions // ignore: cast_nullable_to_non_nullable
as List<ManagerIntervention>,
  ));
}
/// Create a copy of MatchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchClockCopyWith<$Res> get clock {
  
  return $MatchClockCopyWith<$Res>(_self.clock, (value) {
    return _then(_self.copyWith(clock: value));
  });
}/// Create a copy of MatchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScorelineCopyWith<$Res> get scoreline {
  
  return $ScorelineCopyWith<$Res>(_self.scoreline, (value) {
    return _then(_self.copyWith(scoreline: value));
  });
}/// Create a copy of MatchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShootoutScoreCopyWith<$Res> get shootoutScore {
  
  return $ShootoutScoreCopyWith<$Res>(_self.shootoutScore, (value) {
    return _then(_self.copyWith(shootoutScore: value));
  });
}/// Create a copy of MatchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamMatchStatsCopyWith<$Res> get homeStats {
  
  return $TeamMatchStatsCopyWith<$Res>(_self.homeStats, (value) {
    return _then(_self.copyWith(homeStats: value));
  });
}/// Create a copy of MatchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamMatchStatsCopyWith<$Res> get awayStats {
  
  return $TeamMatchStatsCopyWith<$Res>(_self.awayStats, (value) {
    return _then(_self.copyWith(awayStats: value));
  });
}/// Create a copy of MatchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchDynamicsCopyWith<$Res> get dynamics {
  
  return $MatchDynamicsCopyWith<$Res>(_self.dynamics, (value) {
    return _then(_self.copyWith(dynamics: value));
  });
}/// Create a copy of MatchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchupStateCopyWith<$Res> get matchupState {
  
  return $MatchupStateCopyWith<$Res>(_self.matchupState, (value) {
    return _then(_self.copyWith(matchupState: value));
  });
}
}


/// Adds pattern-matching-related methods to [MatchState].
extension MatchStatePatterns on MatchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchState value)  $default,){
final _that = this;
switch (_that) {
case _MatchState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchState value)?  $default,){
final _that = this;
switch (_that) {
case _MatchState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  MatchStatus status,  MatchClock clock,  int currentPhaseIndex,  MatchPhaseType currentPhaseType,  Scoreline scoreline,  ShootoutScore shootoutScore,  TeamSide? currentInitiative,  TeamSide? currentPossession,  TeamSide? currentTerritoryControl,  TeamMatchStats homeStats,  TeamMatchStats awayStats,  MatchDynamics dynamics,  MatchupState matchupState,  List<PhaseResolutionSnapshot> phaseHistory,  List<MatchEventCard> eventCards,  List<TacticalInsight> tacticalInsights,  List<SubstitutionRecord> substitutions,  List<ManagerIntervention> interventions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchState() when $default != null:
return $default(_that.id,_that.status,_that.clock,_that.currentPhaseIndex,_that.currentPhaseType,_that.scoreline,_that.shootoutScore,_that.currentInitiative,_that.currentPossession,_that.currentTerritoryControl,_that.homeStats,_that.awayStats,_that.dynamics,_that.matchupState,_that.phaseHistory,_that.eventCards,_that.tacticalInsights,_that.substitutions,_that.interventions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  MatchStatus status,  MatchClock clock,  int currentPhaseIndex,  MatchPhaseType currentPhaseType,  Scoreline scoreline,  ShootoutScore shootoutScore,  TeamSide? currentInitiative,  TeamSide? currentPossession,  TeamSide? currentTerritoryControl,  TeamMatchStats homeStats,  TeamMatchStats awayStats,  MatchDynamics dynamics,  MatchupState matchupState,  List<PhaseResolutionSnapshot> phaseHistory,  List<MatchEventCard> eventCards,  List<TacticalInsight> tacticalInsights,  List<SubstitutionRecord> substitutions,  List<ManagerIntervention> interventions)  $default,) {final _that = this;
switch (_that) {
case _MatchState():
return $default(_that.id,_that.status,_that.clock,_that.currentPhaseIndex,_that.currentPhaseType,_that.scoreline,_that.shootoutScore,_that.currentInitiative,_that.currentPossession,_that.currentTerritoryControl,_that.homeStats,_that.awayStats,_that.dynamics,_that.matchupState,_that.phaseHistory,_that.eventCards,_that.tacticalInsights,_that.substitutions,_that.interventions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  MatchStatus status,  MatchClock clock,  int currentPhaseIndex,  MatchPhaseType currentPhaseType,  Scoreline scoreline,  ShootoutScore shootoutScore,  TeamSide? currentInitiative,  TeamSide? currentPossession,  TeamSide? currentTerritoryControl,  TeamMatchStats homeStats,  TeamMatchStats awayStats,  MatchDynamics dynamics,  MatchupState matchupState,  List<PhaseResolutionSnapshot> phaseHistory,  List<MatchEventCard> eventCards,  List<TacticalInsight> tacticalInsights,  List<SubstitutionRecord> substitutions,  List<ManagerIntervention> interventions)?  $default,) {final _that = this;
switch (_that) {
case _MatchState() when $default != null:
return $default(_that.id,_that.status,_that.clock,_that.currentPhaseIndex,_that.currentPhaseType,_that.scoreline,_that.shootoutScore,_that.currentInitiative,_that.currentPossession,_that.currentTerritoryControl,_that.homeStats,_that.awayStats,_that.dynamics,_that.matchupState,_that.phaseHistory,_that.eventCards,_that.tacticalInsights,_that.substitutions,_that.interventions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MatchState extends MatchState {
  const _MatchState({required this.id, this.status = MatchStatus.scheduled, this.clock = const MatchClock(id: 0), this.currentPhaseIndex = 0, this.currentPhaseType = MatchPhaseType.neutralPossession, this.scoreline = const Scoreline(id: 0), this.shootoutScore = const ShootoutScore(id: 0), this.currentInitiative, this.currentPossession, this.currentTerritoryControl, this.homeStats = const TeamMatchStats(id: 0), this.awayStats = const TeamMatchStats(id: 0), required this.dynamics, required this.matchupState, final  List<PhaseResolutionSnapshot> phaseHistory = const <PhaseResolutionSnapshot>[], final  List<MatchEventCard> eventCards = const <MatchEventCard>[], final  List<TacticalInsight> tacticalInsights = const <TacticalInsight>[], final  List<SubstitutionRecord> substitutions = const <SubstitutionRecord>[], final  List<ManagerIntervention> interventions = const <ManagerIntervention>[]}): _phaseHistory = phaseHistory,_eventCards = eventCards,_tacticalInsights = tacticalInsights,_substitutions = substitutions,_interventions = interventions,super._();
  factory _MatchState.fromJson(Map<String, dynamic> json) => _$MatchStateFromJson(json);

@override final  int id;
// ==================== MATCH FLOW SYSTEM ====================
@override@JsonKey() final  MatchStatus status;
@override@JsonKey() final  MatchClock clock;
@override@JsonKey() final  int currentPhaseIndex;
@override@JsonKey() final  MatchPhaseType currentPhaseType;
// ==================== SCORE and RESULT SYSTEM ====================
@override@JsonKey() final  Scoreline scoreline;
@override@JsonKey() final  ShootoutScore shootoutScore;
// ==================== TACTICAL FLOW SYSTEM ====================
@override final  TeamSide? currentInitiative;
@override final  TeamSide? currentPossession;
@override final  TeamSide? currentTerritoryControl;
// ==================== TEAM PERFORMANCE SYSTEM ====================
@override@JsonKey() final  TeamMatchStats homeStats;
@override@JsonKey() final  TeamMatchStats awayStats;
// ==================== POSITIONAL / DYNAMICS SYSTEM ====================
@override final  MatchDynamics dynamics;
// ==================== MATCHUP ADVANTAGE SYSTEM ====================
@override final  MatchupState matchupState;
// ==================== PHASE HISTORY SYSTEM ====================
 final  List<PhaseResolutionSnapshot> _phaseHistory;
// ==================== PHASE HISTORY SYSTEM ====================
@override@JsonKey() List<PhaseResolutionSnapshot> get phaseHistory {
  if (_phaseHistory is EqualUnmodifiableListView) return _phaseHistory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_phaseHistory);
}

// ==================== EVENT SYSTEM ====================
 final  List<MatchEventCard> _eventCards;
// ==================== EVENT SYSTEM ====================
@override@JsonKey() List<MatchEventCard> get eventCards {
  if (_eventCards is EqualUnmodifiableListView) return _eventCards;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_eventCards);
}

// ==================== TACTICAL INTELLIGENCE SYSTEM ====================
 final  List<TacticalInsight> _tacticalInsights;
// ==================== TACTICAL INTELLIGENCE SYSTEM ====================
@override@JsonKey() List<TacticalInsight> get tacticalInsights {
  if (_tacticalInsights is EqualUnmodifiableListView) return _tacticalInsights;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tacticalInsights);
}

// ==================== INTERVENTION SYSTEM ====================
 final  List<SubstitutionRecord> _substitutions;
// ==================== INTERVENTION SYSTEM ====================
@override@JsonKey() List<SubstitutionRecord> get substitutions {
  if (_substitutions is EqualUnmodifiableListView) return _substitutions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_substitutions);
}

 final  List<ManagerIntervention> _interventions;
@override@JsonKey() List<ManagerIntervention> get interventions {
  if (_interventions is EqualUnmodifiableListView) return _interventions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_interventions);
}


/// Create a copy of MatchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchStateCopyWith<_MatchState> get copyWith => __$MatchStateCopyWithImpl<_MatchState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchState&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.clock, clock) || other.clock == clock)&&(identical(other.currentPhaseIndex, currentPhaseIndex) || other.currentPhaseIndex == currentPhaseIndex)&&(identical(other.currentPhaseType, currentPhaseType) || other.currentPhaseType == currentPhaseType)&&(identical(other.scoreline, scoreline) || other.scoreline == scoreline)&&(identical(other.shootoutScore, shootoutScore) || other.shootoutScore == shootoutScore)&&(identical(other.currentInitiative, currentInitiative) || other.currentInitiative == currentInitiative)&&(identical(other.currentPossession, currentPossession) || other.currentPossession == currentPossession)&&(identical(other.currentTerritoryControl, currentTerritoryControl) || other.currentTerritoryControl == currentTerritoryControl)&&(identical(other.homeStats, homeStats) || other.homeStats == homeStats)&&(identical(other.awayStats, awayStats) || other.awayStats == awayStats)&&(identical(other.dynamics, dynamics) || other.dynamics == dynamics)&&(identical(other.matchupState, matchupState) || other.matchupState == matchupState)&&const DeepCollectionEquality().equals(other._phaseHistory, _phaseHistory)&&const DeepCollectionEquality().equals(other._eventCards, _eventCards)&&const DeepCollectionEquality().equals(other._tacticalInsights, _tacticalInsights)&&const DeepCollectionEquality().equals(other._substitutions, _substitutions)&&const DeepCollectionEquality().equals(other._interventions, _interventions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,status,clock,currentPhaseIndex,currentPhaseType,scoreline,shootoutScore,currentInitiative,currentPossession,currentTerritoryControl,homeStats,awayStats,dynamics,matchupState,const DeepCollectionEquality().hash(_phaseHistory),const DeepCollectionEquality().hash(_eventCards),const DeepCollectionEquality().hash(_tacticalInsights),const DeepCollectionEquality().hash(_substitutions),const DeepCollectionEquality().hash(_interventions)]);

@override
String toString() {
  return 'MatchState(id: $id, status: $status, clock: $clock, currentPhaseIndex: $currentPhaseIndex, currentPhaseType: $currentPhaseType, scoreline: $scoreline, shootoutScore: $shootoutScore, currentInitiative: $currentInitiative, currentPossession: $currentPossession, currentTerritoryControl: $currentTerritoryControl, homeStats: $homeStats, awayStats: $awayStats, dynamics: $dynamics, matchupState: $matchupState, phaseHistory: $phaseHistory, eventCards: $eventCards, tacticalInsights: $tacticalInsights, substitutions: $substitutions, interventions: $interventions)';
}


}

/// @nodoc
abstract mixin class _$MatchStateCopyWith<$Res> implements $MatchStateCopyWith<$Res> {
  factory _$MatchStateCopyWith(_MatchState value, $Res Function(_MatchState) _then) = __$MatchStateCopyWithImpl;
@override @useResult
$Res call({
 int id, MatchStatus status, MatchClock clock, int currentPhaseIndex, MatchPhaseType currentPhaseType, Scoreline scoreline, ShootoutScore shootoutScore, TeamSide? currentInitiative, TeamSide? currentPossession, TeamSide? currentTerritoryControl, TeamMatchStats homeStats, TeamMatchStats awayStats, MatchDynamics dynamics, MatchupState matchupState, List<PhaseResolutionSnapshot> phaseHistory, List<MatchEventCard> eventCards, List<TacticalInsight> tacticalInsights, List<SubstitutionRecord> substitutions, List<ManagerIntervention> interventions
});


@override $MatchClockCopyWith<$Res> get clock;@override $ScorelineCopyWith<$Res> get scoreline;@override $ShootoutScoreCopyWith<$Res> get shootoutScore;@override $TeamMatchStatsCopyWith<$Res> get homeStats;@override $TeamMatchStatsCopyWith<$Res> get awayStats;@override $MatchDynamicsCopyWith<$Res> get dynamics;@override $MatchupStateCopyWith<$Res> get matchupState;

}
/// @nodoc
class __$MatchStateCopyWithImpl<$Res>
    implements _$MatchStateCopyWith<$Res> {
  __$MatchStateCopyWithImpl(this._self, this._then);

  final _MatchState _self;
  final $Res Function(_MatchState) _then;

/// Create a copy of MatchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? clock = null,Object? currentPhaseIndex = null,Object? currentPhaseType = null,Object? scoreline = null,Object? shootoutScore = null,Object? currentInitiative = freezed,Object? currentPossession = freezed,Object? currentTerritoryControl = freezed,Object? homeStats = null,Object? awayStats = null,Object? dynamics = null,Object? matchupState = null,Object? phaseHistory = null,Object? eventCards = null,Object? tacticalInsights = null,Object? substitutions = null,Object? interventions = null,}) {
  return _then(_MatchState(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MatchStatus,clock: null == clock ? _self.clock : clock // ignore: cast_nullable_to_non_nullable
as MatchClock,currentPhaseIndex: null == currentPhaseIndex ? _self.currentPhaseIndex : currentPhaseIndex // ignore: cast_nullable_to_non_nullable
as int,currentPhaseType: null == currentPhaseType ? _self.currentPhaseType : currentPhaseType // ignore: cast_nullable_to_non_nullable
as MatchPhaseType,scoreline: null == scoreline ? _self.scoreline : scoreline // ignore: cast_nullable_to_non_nullable
as Scoreline,shootoutScore: null == shootoutScore ? _self.shootoutScore : shootoutScore // ignore: cast_nullable_to_non_nullable
as ShootoutScore,currentInitiative: freezed == currentInitiative ? _self.currentInitiative : currentInitiative // ignore: cast_nullable_to_non_nullable
as TeamSide?,currentPossession: freezed == currentPossession ? _self.currentPossession : currentPossession // ignore: cast_nullable_to_non_nullable
as TeamSide?,currentTerritoryControl: freezed == currentTerritoryControl ? _self.currentTerritoryControl : currentTerritoryControl // ignore: cast_nullable_to_non_nullable
as TeamSide?,homeStats: null == homeStats ? _self.homeStats : homeStats // ignore: cast_nullable_to_non_nullable
as TeamMatchStats,awayStats: null == awayStats ? _self.awayStats : awayStats // ignore: cast_nullable_to_non_nullable
as TeamMatchStats,dynamics: null == dynamics ? _self.dynamics : dynamics // ignore: cast_nullable_to_non_nullable
as MatchDynamics,matchupState: null == matchupState ? _self.matchupState : matchupState // ignore: cast_nullable_to_non_nullable
as MatchupState,phaseHistory: null == phaseHistory ? _self._phaseHistory : phaseHistory // ignore: cast_nullable_to_non_nullable
as List<PhaseResolutionSnapshot>,eventCards: null == eventCards ? _self._eventCards : eventCards // ignore: cast_nullable_to_non_nullable
as List<MatchEventCard>,tacticalInsights: null == tacticalInsights ? _self._tacticalInsights : tacticalInsights // ignore: cast_nullable_to_non_nullable
as List<TacticalInsight>,substitutions: null == substitutions ? _self._substitutions : substitutions // ignore: cast_nullable_to_non_nullable
as List<SubstitutionRecord>,interventions: null == interventions ? _self._interventions : interventions // ignore: cast_nullable_to_non_nullable
as List<ManagerIntervention>,
  ));
}

/// Create a copy of MatchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchClockCopyWith<$Res> get clock {
  
  return $MatchClockCopyWith<$Res>(_self.clock, (value) {
    return _then(_self.copyWith(clock: value));
  });
}/// Create a copy of MatchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScorelineCopyWith<$Res> get scoreline {
  
  return $ScorelineCopyWith<$Res>(_self.scoreline, (value) {
    return _then(_self.copyWith(scoreline: value));
  });
}/// Create a copy of MatchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShootoutScoreCopyWith<$Res> get shootoutScore {
  
  return $ShootoutScoreCopyWith<$Res>(_self.shootoutScore, (value) {
    return _then(_self.copyWith(shootoutScore: value));
  });
}/// Create a copy of MatchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamMatchStatsCopyWith<$Res> get homeStats {
  
  return $TeamMatchStatsCopyWith<$Res>(_self.homeStats, (value) {
    return _then(_self.copyWith(homeStats: value));
  });
}/// Create a copy of MatchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamMatchStatsCopyWith<$Res> get awayStats {
  
  return $TeamMatchStatsCopyWith<$Res>(_self.awayStats, (value) {
    return _then(_self.copyWith(awayStats: value));
  });
}/// Create a copy of MatchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchDynamicsCopyWith<$Res> get dynamics {
  
  return $MatchDynamicsCopyWith<$Res>(_self.dynamics, (value) {
    return _then(_self.copyWith(dynamics: value));
  });
}/// Create a copy of MatchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchupStateCopyWith<$Res> get matchupState {
  
  return $MatchupStateCopyWith<$Res>(_self.matchupState, (value) {
    return _then(_self.copyWith(matchupState: value));
  });
}
}

// dart format on
