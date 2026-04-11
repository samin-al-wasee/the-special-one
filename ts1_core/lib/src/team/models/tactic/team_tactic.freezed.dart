// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'team_tactic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TeamTactic {

 int get id;// Team Tactics: Attacking Tactics (SPEC Part 2.A)
 BuildUpStyle get buildUpStyle; Tempo get tempo; Width get width; FinalThirdFocus get finalThirdFocus; AttackingFocus get attackingFocus;// Team Tactics: Defensive Tactics (SPEC Part 2.B)
 DefensiveLine get defensiveLine; LineOfEngagement get lineOfEngagement; PressingIntensity get pressingIntensity; DefensiveWidth get defensiveWidth; MarkingStyle get markingStyle; TacklingAggression get tacklingAggression;// Team Tactics: Transition Tactics (SPEC Part 2.C)
 TransitionOnWin get transitionOnWin; TransitionOnLoss get transitionOnLoss;// Team Tactics: Mentality / Match Approach (SPEC Part 2.D)
 TeamMentality get teamMentality;// Team Tactics: Risk Management (SPEC Part 2.E)
 PassingRisk get passingRisk; DribblingRisk get dribblingRisk; ShootingPolicy get shootingPolicy;// Team Tactics: Space Control (SPEC Part 2.F)
 Compactness get compactness; VerticalStretch get verticalStretch; OverloadFocus get overloadFocus;// Set Piece Control System (SPEC Part 5)
 SetPieceAttack get setPieceAttack; SetPieceDefense get setPieceDefense; FreeKickStrategy get freeKickStrategy;
/// Create a copy of TeamTactic
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeamTacticCopyWith<TeamTactic> get copyWith => _$TeamTacticCopyWithImpl<TeamTactic>(this as TeamTactic, _$identity);

  /// Serializes this TeamTactic to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamTactic&&(identical(other.id, id) || other.id == id)&&(identical(other.buildUpStyle, buildUpStyle) || other.buildUpStyle == buildUpStyle)&&(identical(other.tempo, tempo) || other.tempo == tempo)&&(identical(other.width, width) || other.width == width)&&(identical(other.finalThirdFocus, finalThirdFocus) || other.finalThirdFocus == finalThirdFocus)&&(identical(other.attackingFocus, attackingFocus) || other.attackingFocus == attackingFocus)&&(identical(other.defensiveLine, defensiveLine) || other.defensiveLine == defensiveLine)&&(identical(other.lineOfEngagement, lineOfEngagement) || other.lineOfEngagement == lineOfEngagement)&&(identical(other.pressingIntensity, pressingIntensity) || other.pressingIntensity == pressingIntensity)&&(identical(other.defensiveWidth, defensiveWidth) || other.defensiveWidth == defensiveWidth)&&(identical(other.markingStyle, markingStyle) || other.markingStyle == markingStyle)&&(identical(other.tacklingAggression, tacklingAggression) || other.tacklingAggression == tacklingAggression)&&(identical(other.transitionOnWin, transitionOnWin) || other.transitionOnWin == transitionOnWin)&&(identical(other.transitionOnLoss, transitionOnLoss) || other.transitionOnLoss == transitionOnLoss)&&(identical(other.teamMentality, teamMentality) || other.teamMentality == teamMentality)&&(identical(other.passingRisk, passingRisk) || other.passingRisk == passingRisk)&&(identical(other.dribblingRisk, dribblingRisk) || other.dribblingRisk == dribblingRisk)&&(identical(other.shootingPolicy, shootingPolicy) || other.shootingPolicy == shootingPolicy)&&(identical(other.compactness, compactness) || other.compactness == compactness)&&(identical(other.verticalStretch, verticalStretch) || other.verticalStretch == verticalStretch)&&(identical(other.overloadFocus, overloadFocus) || other.overloadFocus == overloadFocus)&&(identical(other.setPieceAttack, setPieceAttack) || other.setPieceAttack == setPieceAttack)&&(identical(other.setPieceDefense, setPieceDefense) || other.setPieceDefense == setPieceDefense)&&(identical(other.freeKickStrategy, freeKickStrategy) || other.freeKickStrategy == freeKickStrategy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,buildUpStyle,tempo,width,finalThirdFocus,attackingFocus,defensiveLine,lineOfEngagement,pressingIntensity,defensiveWidth,markingStyle,tacklingAggression,transitionOnWin,transitionOnLoss,teamMentality,passingRisk,dribblingRisk,shootingPolicy,compactness,verticalStretch,overloadFocus,setPieceAttack,setPieceDefense,freeKickStrategy]);

@override
String toString() {
  return 'TeamTactic(id: $id, buildUpStyle: $buildUpStyle, tempo: $tempo, width: $width, finalThirdFocus: $finalThirdFocus, attackingFocus: $attackingFocus, defensiveLine: $defensiveLine, lineOfEngagement: $lineOfEngagement, pressingIntensity: $pressingIntensity, defensiveWidth: $defensiveWidth, markingStyle: $markingStyle, tacklingAggression: $tacklingAggression, transitionOnWin: $transitionOnWin, transitionOnLoss: $transitionOnLoss, teamMentality: $teamMentality, passingRisk: $passingRisk, dribblingRisk: $dribblingRisk, shootingPolicy: $shootingPolicy, compactness: $compactness, verticalStretch: $verticalStretch, overloadFocus: $overloadFocus, setPieceAttack: $setPieceAttack, setPieceDefense: $setPieceDefense, freeKickStrategy: $freeKickStrategy)';
}


}

/// @nodoc
abstract mixin class $TeamTacticCopyWith<$Res>  {
  factory $TeamTacticCopyWith(TeamTactic value, $Res Function(TeamTactic) _then) = _$TeamTacticCopyWithImpl;
@useResult
$Res call({
 int id, BuildUpStyle buildUpStyle, Tempo tempo, Width width, FinalThirdFocus finalThirdFocus, AttackingFocus attackingFocus, DefensiveLine defensiveLine, LineOfEngagement lineOfEngagement, PressingIntensity pressingIntensity, DefensiveWidth defensiveWidth, MarkingStyle markingStyle, TacklingAggression tacklingAggression, TransitionOnWin transitionOnWin, TransitionOnLoss transitionOnLoss, TeamMentality teamMentality, PassingRisk passingRisk, DribblingRisk dribblingRisk, ShootingPolicy shootingPolicy, Compactness compactness, VerticalStretch verticalStretch, OverloadFocus overloadFocus, SetPieceAttack setPieceAttack, SetPieceDefense setPieceDefense, FreeKickStrategy freeKickStrategy
});




}
/// @nodoc
class _$TeamTacticCopyWithImpl<$Res>
    implements $TeamTacticCopyWith<$Res> {
  _$TeamTacticCopyWithImpl(this._self, this._then);

  final TeamTactic _self;
  final $Res Function(TeamTactic) _then;

/// Create a copy of TeamTactic
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? buildUpStyle = null,Object? tempo = null,Object? width = null,Object? finalThirdFocus = null,Object? attackingFocus = null,Object? defensiveLine = null,Object? lineOfEngagement = null,Object? pressingIntensity = null,Object? defensiveWidth = null,Object? markingStyle = null,Object? tacklingAggression = null,Object? transitionOnWin = null,Object? transitionOnLoss = null,Object? teamMentality = null,Object? passingRisk = null,Object? dribblingRisk = null,Object? shootingPolicy = null,Object? compactness = null,Object? verticalStretch = null,Object? overloadFocus = null,Object? setPieceAttack = null,Object? setPieceDefense = null,Object? freeKickStrategy = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,buildUpStyle: null == buildUpStyle ? _self.buildUpStyle : buildUpStyle // ignore: cast_nullable_to_non_nullable
as BuildUpStyle,tempo: null == tempo ? _self.tempo : tempo // ignore: cast_nullable_to_non_nullable
as Tempo,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as Width,finalThirdFocus: null == finalThirdFocus ? _self.finalThirdFocus : finalThirdFocus // ignore: cast_nullable_to_non_nullable
as FinalThirdFocus,attackingFocus: null == attackingFocus ? _self.attackingFocus : attackingFocus // ignore: cast_nullable_to_non_nullable
as AttackingFocus,defensiveLine: null == defensiveLine ? _self.defensiveLine : defensiveLine // ignore: cast_nullable_to_non_nullable
as DefensiveLine,lineOfEngagement: null == lineOfEngagement ? _self.lineOfEngagement : lineOfEngagement // ignore: cast_nullable_to_non_nullable
as LineOfEngagement,pressingIntensity: null == pressingIntensity ? _self.pressingIntensity : pressingIntensity // ignore: cast_nullable_to_non_nullable
as PressingIntensity,defensiveWidth: null == defensiveWidth ? _self.defensiveWidth : defensiveWidth // ignore: cast_nullable_to_non_nullable
as DefensiveWidth,markingStyle: null == markingStyle ? _self.markingStyle : markingStyle // ignore: cast_nullable_to_non_nullable
as MarkingStyle,tacklingAggression: null == tacklingAggression ? _self.tacklingAggression : tacklingAggression // ignore: cast_nullable_to_non_nullable
as TacklingAggression,transitionOnWin: null == transitionOnWin ? _self.transitionOnWin : transitionOnWin // ignore: cast_nullable_to_non_nullable
as TransitionOnWin,transitionOnLoss: null == transitionOnLoss ? _self.transitionOnLoss : transitionOnLoss // ignore: cast_nullable_to_non_nullable
as TransitionOnLoss,teamMentality: null == teamMentality ? _self.teamMentality : teamMentality // ignore: cast_nullable_to_non_nullable
as TeamMentality,passingRisk: null == passingRisk ? _self.passingRisk : passingRisk // ignore: cast_nullable_to_non_nullable
as PassingRisk,dribblingRisk: null == dribblingRisk ? _self.dribblingRisk : dribblingRisk // ignore: cast_nullable_to_non_nullable
as DribblingRisk,shootingPolicy: null == shootingPolicy ? _self.shootingPolicy : shootingPolicy // ignore: cast_nullable_to_non_nullable
as ShootingPolicy,compactness: null == compactness ? _self.compactness : compactness // ignore: cast_nullable_to_non_nullable
as Compactness,verticalStretch: null == verticalStretch ? _self.verticalStretch : verticalStretch // ignore: cast_nullable_to_non_nullable
as VerticalStretch,overloadFocus: null == overloadFocus ? _self.overloadFocus : overloadFocus // ignore: cast_nullable_to_non_nullable
as OverloadFocus,setPieceAttack: null == setPieceAttack ? _self.setPieceAttack : setPieceAttack // ignore: cast_nullable_to_non_nullable
as SetPieceAttack,setPieceDefense: null == setPieceDefense ? _self.setPieceDefense : setPieceDefense // ignore: cast_nullable_to_non_nullable
as SetPieceDefense,freeKickStrategy: null == freeKickStrategy ? _self.freeKickStrategy : freeKickStrategy // ignore: cast_nullable_to_non_nullable
as FreeKickStrategy,
  ));
}

}


/// Adds pattern-matching-related methods to [TeamTactic].
extension TeamTacticPatterns on TeamTactic {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeamTactic value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeamTactic() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeamTactic value)  $default,){
final _that = this;
switch (_that) {
case _TeamTactic():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeamTactic value)?  $default,){
final _that = this;
switch (_that) {
case _TeamTactic() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  BuildUpStyle buildUpStyle,  Tempo tempo,  Width width,  FinalThirdFocus finalThirdFocus,  AttackingFocus attackingFocus,  DefensiveLine defensiveLine,  LineOfEngagement lineOfEngagement,  PressingIntensity pressingIntensity,  DefensiveWidth defensiveWidth,  MarkingStyle markingStyle,  TacklingAggression tacklingAggression,  TransitionOnWin transitionOnWin,  TransitionOnLoss transitionOnLoss,  TeamMentality teamMentality,  PassingRisk passingRisk,  DribblingRisk dribblingRisk,  ShootingPolicy shootingPolicy,  Compactness compactness,  VerticalStretch verticalStretch,  OverloadFocus overloadFocus,  SetPieceAttack setPieceAttack,  SetPieceDefense setPieceDefense,  FreeKickStrategy freeKickStrategy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeamTactic() when $default != null:
return $default(_that.id,_that.buildUpStyle,_that.tempo,_that.width,_that.finalThirdFocus,_that.attackingFocus,_that.defensiveLine,_that.lineOfEngagement,_that.pressingIntensity,_that.defensiveWidth,_that.markingStyle,_that.tacklingAggression,_that.transitionOnWin,_that.transitionOnLoss,_that.teamMentality,_that.passingRisk,_that.dribblingRisk,_that.shootingPolicy,_that.compactness,_that.verticalStretch,_that.overloadFocus,_that.setPieceAttack,_that.setPieceDefense,_that.freeKickStrategy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  BuildUpStyle buildUpStyle,  Tempo tempo,  Width width,  FinalThirdFocus finalThirdFocus,  AttackingFocus attackingFocus,  DefensiveLine defensiveLine,  LineOfEngagement lineOfEngagement,  PressingIntensity pressingIntensity,  DefensiveWidth defensiveWidth,  MarkingStyle markingStyle,  TacklingAggression tacklingAggression,  TransitionOnWin transitionOnWin,  TransitionOnLoss transitionOnLoss,  TeamMentality teamMentality,  PassingRisk passingRisk,  DribblingRisk dribblingRisk,  ShootingPolicy shootingPolicy,  Compactness compactness,  VerticalStretch verticalStretch,  OverloadFocus overloadFocus,  SetPieceAttack setPieceAttack,  SetPieceDefense setPieceDefense,  FreeKickStrategy freeKickStrategy)  $default,) {final _that = this;
switch (_that) {
case _TeamTactic():
return $default(_that.id,_that.buildUpStyle,_that.tempo,_that.width,_that.finalThirdFocus,_that.attackingFocus,_that.defensiveLine,_that.lineOfEngagement,_that.pressingIntensity,_that.defensiveWidth,_that.markingStyle,_that.tacklingAggression,_that.transitionOnWin,_that.transitionOnLoss,_that.teamMentality,_that.passingRisk,_that.dribblingRisk,_that.shootingPolicy,_that.compactness,_that.verticalStretch,_that.overloadFocus,_that.setPieceAttack,_that.setPieceDefense,_that.freeKickStrategy);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  BuildUpStyle buildUpStyle,  Tempo tempo,  Width width,  FinalThirdFocus finalThirdFocus,  AttackingFocus attackingFocus,  DefensiveLine defensiveLine,  LineOfEngagement lineOfEngagement,  PressingIntensity pressingIntensity,  DefensiveWidth defensiveWidth,  MarkingStyle markingStyle,  TacklingAggression tacklingAggression,  TransitionOnWin transitionOnWin,  TransitionOnLoss transitionOnLoss,  TeamMentality teamMentality,  PassingRisk passingRisk,  DribblingRisk dribblingRisk,  ShootingPolicy shootingPolicy,  Compactness compactness,  VerticalStretch verticalStretch,  OverloadFocus overloadFocus,  SetPieceAttack setPieceAttack,  SetPieceDefense setPieceDefense,  FreeKickStrategy freeKickStrategy)?  $default,) {final _that = this;
switch (_that) {
case _TeamTactic() when $default != null:
return $default(_that.id,_that.buildUpStyle,_that.tempo,_that.width,_that.finalThirdFocus,_that.attackingFocus,_that.defensiveLine,_that.lineOfEngagement,_that.pressingIntensity,_that.defensiveWidth,_that.markingStyle,_that.tacklingAggression,_that.transitionOnWin,_that.transitionOnLoss,_that.teamMentality,_that.passingRisk,_that.dribblingRisk,_that.shootingPolicy,_that.compactness,_that.verticalStretch,_that.overloadFocus,_that.setPieceAttack,_that.setPieceDefense,_that.freeKickStrategy);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeamTactic extends TeamTactic {
  const _TeamTactic({required this.id, required this.buildUpStyle, required this.tempo, required this.width, required this.finalThirdFocus, required this.attackingFocus, required this.defensiveLine, required this.lineOfEngagement, required this.pressingIntensity, required this.defensiveWidth, required this.markingStyle, required this.tacklingAggression, required this.transitionOnWin, required this.transitionOnLoss, required this.teamMentality, required this.passingRisk, required this.dribblingRisk, required this.shootingPolicy, required this.compactness, required this.verticalStretch, required this.overloadFocus, required this.setPieceAttack, required this.setPieceDefense, required this.freeKickStrategy}): super._();
  factory _TeamTactic.fromJson(Map<String, dynamic> json) => _$TeamTacticFromJson(json);

@override final  int id;
// Team Tactics: Attacking Tactics (SPEC Part 2.A)
@override final  BuildUpStyle buildUpStyle;
@override final  Tempo tempo;
@override final  Width width;
@override final  FinalThirdFocus finalThirdFocus;
@override final  AttackingFocus attackingFocus;
// Team Tactics: Defensive Tactics (SPEC Part 2.B)
@override final  DefensiveLine defensiveLine;
@override final  LineOfEngagement lineOfEngagement;
@override final  PressingIntensity pressingIntensity;
@override final  DefensiveWidth defensiveWidth;
@override final  MarkingStyle markingStyle;
@override final  TacklingAggression tacklingAggression;
// Team Tactics: Transition Tactics (SPEC Part 2.C)
@override final  TransitionOnWin transitionOnWin;
@override final  TransitionOnLoss transitionOnLoss;
// Team Tactics: Mentality / Match Approach (SPEC Part 2.D)
@override final  TeamMentality teamMentality;
// Team Tactics: Risk Management (SPEC Part 2.E)
@override final  PassingRisk passingRisk;
@override final  DribblingRisk dribblingRisk;
@override final  ShootingPolicy shootingPolicy;
// Team Tactics: Space Control (SPEC Part 2.F)
@override final  Compactness compactness;
@override final  VerticalStretch verticalStretch;
@override final  OverloadFocus overloadFocus;
// Set Piece Control System (SPEC Part 5)
@override final  SetPieceAttack setPieceAttack;
@override final  SetPieceDefense setPieceDefense;
@override final  FreeKickStrategy freeKickStrategy;

/// Create a copy of TeamTactic
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeamTacticCopyWith<_TeamTactic> get copyWith => __$TeamTacticCopyWithImpl<_TeamTactic>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeamTacticToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeamTactic&&(identical(other.id, id) || other.id == id)&&(identical(other.buildUpStyle, buildUpStyle) || other.buildUpStyle == buildUpStyle)&&(identical(other.tempo, tempo) || other.tempo == tempo)&&(identical(other.width, width) || other.width == width)&&(identical(other.finalThirdFocus, finalThirdFocus) || other.finalThirdFocus == finalThirdFocus)&&(identical(other.attackingFocus, attackingFocus) || other.attackingFocus == attackingFocus)&&(identical(other.defensiveLine, defensiveLine) || other.defensiveLine == defensiveLine)&&(identical(other.lineOfEngagement, lineOfEngagement) || other.lineOfEngagement == lineOfEngagement)&&(identical(other.pressingIntensity, pressingIntensity) || other.pressingIntensity == pressingIntensity)&&(identical(other.defensiveWidth, defensiveWidth) || other.defensiveWidth == defensiveWidth)&&(identical(other.markingStyle, markingStyle) || other.markingStyle == markingStyle)&&(identical(other.tacklingAggression, tacklingAggression) || other.tacklingAggression == tacklingAggression)&&(identical(other.transitionOnWin, transitionOnWin) || other.transitionOnWin == transitionOnWin)&&(identical(other.transitionOnLoss, transitionOnLoss) || other.transitionOnLoss == transitionOnLoss)&&(identical(other.teamMentality, teamMentality) || other.teamMentality == teamMentality)&&(identical(other.passingRisk, passingRisk) || other.passingRisk == passingRisk)&&(identical(other.dribblingRisk, dribblingRisk) || other.dribblingRisk == dribblingRisk)&&(identical(other.shootingPolicy, shootingPolicy) || other.shootingPolicy == shootingPolicy)&&(identical(other.compactness, compactness) || other.compactness == compactness)&&(identical(other.verticalStretch, verticalStretch) || other.verticalStretch == verticalStretch)&&(identical(other.overloadFocus, overloadFocus) || other.overloadFocus == overloadFocus)&&(identical(other.setPieceAttack, setPieceAttack) || other.setPieceAttack == setPieceAttack)&&(identical(other.setPieceDefense, setPieceDefense) || other.setPieceDefense == setPieceDefense)&&(identical(other.freeKickStrategy, freeKickStrategy) || other.freeKickStrategy == freeKickStrategy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,buildUpStyle,tempo,width,finalThirdFocus,attackingFocus,defensiveLine,lineOfEngagement,pressingIntensity,defensiveWidth,markingStyle,tacklingAggression,transitionOnWin,transitionOnLoss,teamMentality,passingRisk,dribblingRisk,shootingPolicy,compactness,verticalStretch,overloadFocus,setPieceAttack,setPieceDefense,freeKickStrategy]);

@override
String toString() {
  return 'TeamTactic(id: $id, buildUpStyle: $buildUpStyle, tempo: $tempo, width: $width, finalThirdFocus: $finalThirdFocus, attackingFocus: $attackingFocus, defensiveLine: $defensiveLine, lineOfEngagement: $lineOfEngagement, pressingIntensity: $pressingIntensity, defensiveWidth: $defensiveWidth, markingStyle: $markingStyle, tacklingAggression: $tacklingAggression, transitionOnWin: $transitionOnWin, transitionOnLoss: $transitionOnLoss, teamMentality: $teamMentality, passingRisk: $passingRisk, dribblingRisk: $dribblingRisk, shootingPolicy: $shootingPolicy, compactness: $compactness, verticalStretch: $verticalStretch, overloadFocus: $overloadFocus, setPieceAttack: $setPieceAttack, setPieceDefense: $setPieceDefense, freeKickStrategy: $freeKickStrategy)';
}


}

/// @nodoc
abstract mixin class _$TeamTacticCopyWith<$Res> implements $TeamTacticCopyWith<$Res> {
  factory _$TeamTacticCopyWith(_TeamTactic value, $Res Function(_TeamTactic) _then) = __$TeamTacticCopyWithImpl;
@override @useResult
$Res call({
 int id, BuildUpStyle buildUpStyle, Tempo tempo, Width width, FinalThirdFocus finalThirdFocus, AttackingFocus attackingFocus, DefensiveLine defensiveLine, LineOfEngagement lineOfEngagement, PressingIntensity pressingIntensity, DefensiveWidth defensiveWidth, MarkingStyle markingStyle, TacklingAggression tacklingAggression, TransitionOnWin transitionOnWin, TransitionOnLoss transitionOnLoss, TeamMentality teamMentality, PassingRisk passingRisk, DribblingRisk dribblingRisk, ShootingPolicy shootingPolicy, Compactness compactness, VerticalStretch verticalStretch, OverloadFocus overloadFocus, SetPieceAttack setPieceAttack, SetPieceDefense setPieceDefense, FreeKickStrategy freeKickStrategy
});




}
/// @nodoc
class __$TeamTacticCopyWithImpl<$Res>
    implements _$TeamTacticCopyWith<$Res> {
  __$TeamTacticCopyWithImpl(this._self, this._then);

  final _TeamTactic _self;
  final $Res Function(_TeamTactic) _then;

/// Create a copy of TeamTactic
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? buildUpStyle = null,Object? tempo = null,Object? width = null,Object? finalThirdFocus = null,Object? attackingFocus = null,Object? defensiveLine = null,Object? lineOfEngagement = null,Object? pressingIntensity = null,Object? defensiveWidth = null,Object? markingStyle = null,Object? tacklingAggression = null,Object? transitionOnWin = null,Object? transitionOnLoss = null,Object? teamMentality = null,Object? passingRisk = null,Object? dribblingRisk = null,Object? shootingPolicy = null,Object? compactness = null,Object? verticalStretch = null,Object? overloadFocus = null,Object? setPieceAttack = null,Object? setPieceDefense = null,Object? freeKickStrategy = null,}) {
  return _then(_TeamTactic(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,buildUpStyle: null == buildUpStyle ? _self.buildUpStyle : buildUpStyle // ignore: cast_nullable_to_non_nullable
as BuildUpStyle,tempo: null == tempo ? _self.tempo : tempo // ignore: cast_nullable_to_non_nullable
as Tempo,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as Width,finalThirdFocus: null == finalThirdFocus ? _self.finalThirdFocus : finalThirdFocus // ignore: cast_nullable_to_non_nullable
as FinalThirdFocus,attackingFocus: null == attackingFocus ? _self.attackingFocus : attackingFocus // ignore: cast_nullable_to_non_nullable
as AttackingFocus,defensiveLine: null == defensiveLine ? _self.defensiveLine : defensiveLine // ignore: cast_nullable_to_non_nullable
as DefensiveLine,lineOfEngagement: null == lineOfEngagement ? _self.lineOfEngagement : lineOfEngagement // ignore: cast_nullable_to_non_nullable
as LineOfEngagement,pressingIntensity: null == pressingIntensity ? _self.pressingIntensity : pressingIntensity // ignore: cast_nullable_to_non_nullable
as PressingIntensity,defensiveWidth: null == defensiveWidth ? _self.defensiveWidth : defensiveWidth // ignore: cast_nullable_to_non_nullable
as DefensiveWidth,markingStyle: null == markingStyle ? _self.markingStyle : markingStyle // ignore: cast_nullable_to_non_nullable
as MarkingStyle,tacklingAggression: null == tacklingAggression ? _self.tacklingAggression : tacklingAggression // ignore: cast_nullable_to_non_nullable
as TacklingAggression,transitionOnWin: null == transitionOnWin ? _self.transitionOnWin : transitionOnWin // ignore: cast_nullable_to_non_nullable
as TransitionOnWin,transitionOnLoss: null == transitionOnLoss ? _self.transitionOnLoss : transitionOnLoss // ignore: cast_nullable_to_non_nullable
as TransitionOnLoss,teamMentality: null == teamMentality ? _self.teamMentality : teamMentality // ignore: cast_nullable_to_non_nullable
as TeamMentality,passingRisk: null == passingRisk ? _self.passingRisk : passingRisk // ignore: cast_nullable_to_non_nullable
as PassingRisk,dribblingRisk: null == dribblingRisk ? _self.dribblingRisk : dribblingRisk // ignore: cast_nullable_to_non_nullable
as DribblingRisk,shootingPolicy: null == shootingPolicy ? _self.shootingPolicy : shootingPolicy // ignore: cast_nullable_to_non_nullable
as ShootingPolicy,compactness: null == compactness ? _self.compactness : compactness // ignore: cast_nullable_to_non_nullable
as Compactness,verticalStretch: null == verticalStretch ? _self.verticalStretch : verticalStretch // ignore: cast_nullable_to_non_nullable
as VerticalStretch,overloadFocus: null == overloadFocus ? _self.overloadFocus : overloadFocus // ignore: cast_nullable_to_non_nullable
as OverloadFocus,setPieceAttack: null == setPieceAttack ? _self.setPieceAttack : setPieceAttack // ignore: cast_nullable_to_non_nullable
as SetPieceAttack,setPieceDefense: null == setPieceDefense ? _self.setPieceDefense : setPieceDefense // ignore: cast_nullable_to_non_nullable
as SetPieceDefense,freeKickStrategy: null == freeKickStrategy ? _self.freeKickStrategy : freeKickStrategy // ignore: cast_nullable_to_non_nullable
as FreeKickStrategy,
  ));
}


}

// dart format on
