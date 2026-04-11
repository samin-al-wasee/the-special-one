// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'team_match_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TeamMatchStats {

 int get id; double get possession; int get shots; int get shotsOnTarget; int get chancesCreated; double get expectedGoals; int get passesCompleted; int get passesAttempted; int get turnovers; int get fouls; int get yellowCards; int get redCards; int get corners; int get offsides;
/// Create a copy of TeamMatchStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeamMatchStatsCopyWith<TeamMatchStats> get copyWith => _$TeamMatchStatsCopyWithImpl<TeamMatchStats>(this as TeamMatchStats, _$identity);

  /// Serializes this TeamMatchStats to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamMatchStats&&(identical(other.id, id) || other.id == id)&&(identical(other.possession, possession) || other.possession == possession)&&(identical(other.shots, shots) || other.shots == shots)&&(identical(other.shotsOnTarget, shotsOnTarget) || other.shotsOnTarget == shotsOnTarget)&&(identical(other.chancesCreated, chancesCreated) || other.chancesCreated == chancesCreated)&&(identical(other.expectedGoals, expectedGoals) || other.expectedGoals == expectedGoals)&&(identical(other.passesCompleted, passesCompleted) || other.passesCompleted == passesCompleted)&&(identical(other.passesAttempted, passesAttempted) || other.passesAttempted == passesAttempted)&&(identical(other.turnovers, turnovers) || other.turnovers == turnovers)&&(identical(other.fouls, fouls) || other.fouls == fouls)&&(identical(other.yellowCards, yellowCards) || other.yellowCards == yellowCards)&&(identical(other.redCards, redCards) || other.redCards == redCards)&&(identical(other.corners, corners) || other.corners == corners)&&(identical(other.offsides, offsides) || other.offsides == offsides));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,possession,shots,shotsOnTarget,chancesCreated,expectedGoals,passesCompleted,passesAttempted,turnovers,fouls,yellowCards,redCards,corners,offsides);

@override
String toString() {
  return 'TeamMatchStats(id: $id, possession: $possession, shots: $shots, shotsOnTarget: $shotsOnTarget, chancesCreated: $chancesCreated, expectedGoals: $expectedGoals, passesCompleted: $passesCompleted, passesAttempted: $passesAttempted, turnovers: $turnovers, fouls: $fouls, yellowCards: $yellowCards, redCards: $redCards, corners: $corners, offsides: $offsides)';
}


}

/// @nodoc
abstract mixin class $TeamMatchStatsCopyWith<$Res>  {
  factory $TeamMatchStatsCopyWith(TeamMatchStats value, $Res Function(TeamMatchStats) _then) = _$TeamMatchStatsCopyWithImpl;
@useResult
$Res call({
 int id, double possession, int shots, int shotsOnTarget, int chancesCreated, double expectedGoals, int passesCompleted, int passesAttempted, int turnovers, int fouls, int yellowCards, int redCards, int corners, int offsides
});




}
/// @nodoc
class _$TeamMatchStatsCopyWithImpl<$Res>
    implements $TeamMatchStatsCopyWith<$Res> {
  _$TeamMatchStatsCopyWithImpl(this._self, this._then);

  final TeamMatchStats _self;
  final $Res Function(TeamMatchStats) _then;

/// Create a copy of TeamMatchStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? possession = null,Object? shots = null,Object? shotsOnTarget = null,Object? chancesCreated = null,Object? expectedGoals = null,Object? passesCompleted = null,Object? passesAttempted = null,Object? turnovers = null,Object? fouls = null,Object? yellowCards = null,Object? redCards = null,Object? corners = null,Object? offsides = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,possession: null == possession ? _self.possession : possession // ignore: cast_nullable_to_non_nullable
as double,shots: null == shots ? _self.shots : shots // ignore: cast_nullable_to_non_nullable
as int,shotsOnTarget: null == shotsOnTarget ? _self.shotsOnTarget : shotsOnTarget // ignore: cast_nullable_to_non_nullable
as int,chancesCreated: null == chancesCreated ? _self.chancesCreated : chancesCreated // ignore: cast_nullable_to_non_nullable
as int,expectedGoals: null == expectedGoals ? _self.expectedGoals : expectedGoals // ignore: cast_nullable_to_non_nullable
as double,passesCompleted: null == passesCompleted ? _self.passesCompleted : passesCompleted // ignore: cast_nullable_to_non_nullable
as int,passesAttempted: null == passesAttempted ? _self.passesAttempted : passesAttempted // ignore: cast_nullable_to_non_nullable
as int,turnovers: null == turnovers ? _self.turnovers : turnovers // ignore: cast_nullable_to_non_nullable
as int,fouls: null == fouls ? _self.fouls : fouls // ignore: cast_nullable_to_non_nullable
as int,yellowCards: null == yellowCards ? _self.yellowCards : yellowCards // ignore: cast_nullable_to_non_nullable
as int,redCards: null == redCards ? _self.redCards : redCards // ignore: cast_nullable_to_non_nullable
as int,corners: null == corners ? _self.corners : corners // ignore: cast_nullable_to_non_nullable
as int,offsides: null == offsides ? _self.offsides : offsides // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TeamMatchStats].
extension TeamMatchStatsPatterns on TeamMatchStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeamMatchStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeamMatchStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeamMatchStats value)  $default,){
final _that = this;
switch (_that) {
case _TeamMatchStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeamMatchStats value)?  $default,){
final _that = this;
switch (_that) {
case _TeamMatchStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  double possession,  int shots,  int shotsOnTarget,  int chancesCreated,  double expectedGoals,  int passesCompleted,  int passesAttempted,  int turnovers,  int fouls,  int yellowCards,  int redCards,  int corners,  int offsides)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeamMatchStats() when $default != null:
return $default(_that.id,_that.possession,_that.shots,_that.shotsOnTarget,_that.chancesCreated,_that.expectedGoals,_that.passesCompleted,_that.passesAttempted,_that.turnovers,_that.fouls,_that.yellowCards,_that.redCards,_that.corners,_that.offsides);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  double possession,  int shots,  int shotsOnTarget,  int chancesCreated,  double expectedGoals,  int passesCompleted,  int passesAttempted,  int turnovers,  int fouls,  int yellowCards,  int redCards,  int corners,  int offsides)  $default,) {final _that = this;
switch (_that) {
case _TeamMatchStats():
return $default(_that.id,_that.possession,_that.shots,_that.shotsOnTarget,_that.chancesCreated,_that.expectedGoals,_that.passesCompleted,_that.passesAttempted,_that.turnovers,_that.fouls,_that.yellowCards,_that.redCards,_that.corners,_that.offsides);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  double possession,  int shots,  int shotsOnTarget,  int chancesCreated,  double expectedGoals,  int passesCompleted,  int passesAttempted,  int turnovers,  int fouls,  int yellowCards,  int redCards,  int corners,  int offsides)?  $default,) {final _that = this;
switch (_that) {
case _TeamMatchStats() when $default != null:
return $default(_that.id,_that.possession,_that.shots,_that.shotsOnTarget,_that.chancesCreated,_that.expectedGoals,_that.passesCompleted,_that.passesAttempted,_that.turnovers,_that.fouls,_that.yellowCards,_that.redCards,_that.corners,_that.offsides);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeamMatchStats extends TeamMatchStats {
  const _TeamMatchStats({required this.id, this.possession = 50.0, this.shots = 0, this.shotsOnTarget = 0, this.chancesCreated = 0, this.expectedGoals = 0.0, this.passesCompleted = 0, this.passesAttempted = 0, this.turnovers = 0, this.fouls = 0, this.yellowCards = 0, this.redCards = 0, this.corners = 0, this.offsides = 0}): super._();
  factory _TeamMatchStats.fromJson(Map<String, dynamic> json) => _$TeamMatchStatsFromJson(json);

@override final  int id;
@override@JsonKey() final  double possession;
@override@JsonKey() final  int shots;
@override@JsonKey() final  int shotsOnTarget;
@override@JsonKey() final  int chancesCreated;
@override@JsonKey() final  double expectedGoals;
@override@JsonKey() final  int passesCompleted;
@override@JsonKey() final  int passesAttempted;
@override@JsonKey() final  int turnovers;
@override@JsonKey() final  int fouls;
@override@JsonKey() final  int yellowCards;
@override@JsonKey() final  int redCards;
@override@JsonKey() final  int corners;
@override@JsonKey() final  int offsides;

/// Create a copy of TeamMatchStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeamMatchStatsCopyWith<_TeamMatchStats> get copyWith => __$TeamMatchStatsCopyWithImpl<_TeamMatchStats>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeamMatchStatsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeamMatchStats&&(identical(other.id, id) || other.id == id)&&(identical(other.possession, possession) || other.possession == possession)&&(identical(other.shots, shots) || other.shots == shots)&&(identical(other.shotsOnTarget, shotsOnTarget) || other.shotsOnTarget == shotsOnTarget)&&(identical(other.chancesCreated, chancesCreated) || other.chancesCreated == chancesCreated)&&(identical(other.expectedGoals, expectedGoals) || other.expectedGoals == expectedGoals)&&(identical(other.passesCompleted, passesCompleted) || other.passesCompleted == passesCompleted)&&(identical(other.passesAttempted, passesAttempted) || other.passesAttempted == passesAttempted)&&(identical(other.turnovers, turnovers) || other.turnovers == turnovers)&&(identical(other.fouls, fouls) || other.fouls == fouls)&&(identical(other.yellowCards, yellowCards) || other.yellowCards == yellowCards)&&(identical(other.redCards, redCards) || other.redCards == redCards)&&(identical(other.corners, corners) || other.corners == corners)&&(identical(other.offsides, offsides) || other.offsides == offsides));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,possession,shots,shotsOnTarget,chancesCreated,expectedGoals,passesCompleted,passesAttempted,turnovers,fouls,yellowCards,redCards,corners,offsides);

@override
String toString() {
  return 'TeamMatchStats(id: $id, possession: $possession, shots: $shots, shotsOnTarget: $shotsOnTarget, chancesCreated: $chancesCreated, expectedGoals: $expectedGoals, passesCompleted: $passesCompleted, passesAttempted: $passesAttempted, turnovers: $turnovers, fouls: $fouls, yellowCards: $yellowCards, redCards: $redCards, corners: $corners, offsides: $offsides)';
}


}

/// @nodoc
abstract mixin class _$TeamMatchStatsCopyWith<$Res> implements $TeamMatchStatsCopyWith<$Res> {
  factory _$TeamMatchStatsCopyWith(_TeamMatchStats value, $Res Function(_TeamMatchStats) _then) = __$TeamMatchStatsCopyWithImpl;
@override @useResult
$Res call({
 int id, double possession, int shots, int shotsOnTarget, int chancesCreated, double expectedGoals, int passesCompleted, int passesAttempted, int turnovers, int fouls, int yellowCards, int redCards, int corners, int offsides
});




}
/// @nodoc
class __$TeamMatchStatsCopyWithImpl<$Res>
    implements _$TeamMatchStatsCopyWith<$Res> {
  __$TeamMatchStatsCopyWithImpl(this._self, this._then);

  final _TeamMatchStats _self;
  final $Res Function(_TeamMatchStats) _then;

/// Create a copy of TeamMatchStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? possession = null,Object? shots = null,Object? shotsOnTarget = null,Object? chancesCreated = null,Object? expectedGoals = null,Object? passesCompleted = null,Object? passesAttempted = null,Object? turnovers = null,Object? fouls = null,Object? yellowCards = null,Object? redCards = null,Object? corners = null,Object? offsides = null,}) {
  return _then(_TeamMatchStats(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,possession: null == possession ? _self.possession : possession // ignore: cast_nullable_to_non_nullable
as double,shots: null == shots ? _self.shots : shots // ignore: cast_nullable_to_non_nullable
as int,shotsOnTarget: null == shotsOnTarget ? _self.shotsOnTarget : shotsOnTarget // ignore: cast_nullable_to_non_nullable
as int,chancesCreated: null == chancesCreated ? _self.chancesCreated : chancesCreated // ignore: cast_nullable_to_non_nullable
as int,expectedGoals: null == expectedGoals ? _self.expectedGoals : expectedGoals // ignore: cast_nullable_to_non_nullable
as double,passesCompleted: null == passesCompleted ? _self.passesCompleted : passesCompleted // ignore: cast_nullable_to_non_nullable
as int,passesAttempted: null == passesAttempted ? _self.passesAttempted : passesAttempted // ignore: cast_nullable_to_non_nullable
as int,turnovers: null == turnovers ? _self.turnovers : turnovers // ignore: cast_nullable_to_non_nullable
as int,fouls: null == fouls ? _self.fouls : fouls // ignore: cast_nullable_to_non_nullable
as int,yellowCards: null == yellowCards ? _self.yellowCards : yellowCards // ignore: cast_nullable_to_non_nullable
as int,redCards: null == redCards ? _self.redCards : redCards // ignore: cast_nullable_to_non_nullable
as int,corners: null == corners ? _self.corners : corners // ignore: cast_nullable_to_non_nullable
as int,offsides: null == offsides ? _self.offsides : offsides // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
