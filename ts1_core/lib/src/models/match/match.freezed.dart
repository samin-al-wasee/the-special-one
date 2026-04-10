// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Match {

 int get id; Team get homeTeam; Team get awayTeam; DateTime get kickoffAt; MatchContext get context; MatchState get matchState; String get venue; String get weather; int get totalRegulationMinutes; int get microPhaseSeconds;
/// Create a copy of Match
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchCopyWith<Match> get copyWith => _$MatchCopyWithImpl<Match>(this as Match, _$identity);

  /// Serializes this Match to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Match&&(identical(other.id, id) || other.id == id)&&(identical(other.homeTeam, homeTeam) || other.homeTeam == homeTeam)&&(identical(other.awayTeam, awayTeam) || other.awayTeam == awayTeam)&&(identical(other.kickoffAt, kickoffAt) || other.kickoffAt == kickoffAt)&&(identical(other.context, context) || other.context == context)&&(identical(other.matchState, matchState) || other.matchState == matchState)&&(identical(other.venue, venue) || other.venue == venue)&&(identical(other.weather, weather) || other.weather == weather)&&(identical(other.totalRegulationMinutes, totalRegulationMinutes) || other.totalRegulationMinutes == totalRegulationMinutes)&&(identical(other.microPhaseSeconds, microPhaseSeconds) || other.microPhaseSeconds == microPhaseSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,homeTeam,awayTeam,kickoffAt,context,matchState,venue,weather,totalRegulationMinutes,microPhaseSeconds);

@override
String toString() {
  return 'Match(id: $id, homeTeam: $homeTeam, awayTeam: $awayTeam, kickoffAt: $kickoffAt, context: $context, matchState: $matchState, venue: $venue, weather: $weather, totalRegulationMinutes: $totalRegulationMinutes, microPhaseSeconds: $microPhaseSeconds)';
}


}

/// @nodoc
abstract mixin class $MatchCopyWith<$Res>  {
  factory $MatchCopyWith(Match value, $Res Function(Match) _then) = _$MatchCopyWithImpl;
@useResult
$Res call({
 int id, Team homeTeam, Team awayTeam, DateTime kickoffAt, MatchContext context, MatchState matchState, String venue, String weather, int totalRegulationMinutes, int microPhaseSeconds
});


$TeamCopyWith<$Res> get homeTeam;$TeamCopyWith<$Res> get awayTeam;$MatchContextCopyWith<$Res> get context;$MatchStateCopyWith<$Res> get matchState;

}
/// @nodoc
class _$MatchCopyWithImpl<$Res>
    implements $MatchCopyWith<$Res> {
  _$MatchCopyWithImpl(this._self, this._then);

  final Match _self;
  final $Res Function(Match) _then;

/// Create a copy of Match
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? homeTeam = null,Object? awayTeam = null,Object? kickoffAt = null,Object? context = null,Object? matchState = null,Object? venue = null,Object? weather = null,Object? totalRegulationMinutes = null,Object? microPhaseSeconds = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,homeTeam: null == homeTeam ? _self.homeTeam : homeTeam // ignore: cast_nullable_to_non_nullable
as Team,awayTeam: null == awayTeam ? _self.awayTeam : awayTeam // ignore: cast_nullable_to_non_nullable
as Team,kickoffAt: null == kickoffAt ? _self.kickoffAt : kickoffAt // ignore: cast_nullable_to_non_nullable
as DateTime,context: null == context ? _self.context : context // ignore: cast_nullable_to_non_nullable
as MatchContext,matchState: null == matchState ? _self.matchState : matchState // ignore: cast_nullable_to_non_nullable
as MatchState,venue: null == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as String,weather: null == weather ? _self.weather : weather // ignore: cast_nullable_to_non_nullable
as String,totalRegulationMinutes: null == totalRegulationMinutes ? _self.totalRegulationMinutes : totalRegulationMinutes // ignore: cast_nullable_to_non_nullable
as int,microPhaseSeconds: null == microPhaseSeconds ? _self.microPhaseSeconds : microPhaseSeconds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of Match
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamCopyWith<$Res> get homeTeam {
  
  return $TeamCopyWith<$Res>(_self.homeTeam, (value) {
    return _then(_self.copyWith(homeTeam: value));
  });
}/// Create a copy of Match
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamCopyWith<$Res> get awayTeam {
  
  return $TeamCopyWith<$Res>(_self.awayTeam, (value) {
    return _then(_self.copyWith(awayTeam: value));
  });
}/// Create a copy of Match
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchContextCopyWith<$Res> get context {
  
  return $MatchContextCopyWith<$Res>(_self.context, (value) {
    return _then(_self.copyWith(context: value));
  });
}/// Create a copy of Match
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchStateCopyWith<$Res> get matchState {
  
  return $MatchStateCopyWith<$Res>(_self.matchState, (value) {
    return _then(_self.copyWith(matchState: value));
  });
}
}


/// Adds pattern-matching-related methods to [Match].
extension MatchPatterns on Match {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Match value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Match() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Match value)  $default,){
final _that = this;
switch (_that) {
case _Match():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Match value)?  $default,){
final _that = this;
switch (_that) {
case _Match() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  Team homeTeam,  Team awayTeam,  DateTime kickoffAt,  MatchContext context,  MatchState matchState,  String venue,  String weather,  int totalRegulationMinutes,  int microPhaseSeconds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Match() when $default != null:
return $default(_that.id,_that.homeTeam,_that.awayTeam,_that.kickoffAt,_that.context,_that.matchState,_that.venue,_that.weather,_that.totalRegulationMinutes,_that.microPhaseSeconds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  Team homeTeam,  Team awayTeam,  DateTime kickoffAt,  MatchContext context,  MatchState matchState,  String venue,  String weather,  int totalRegulationMinutes,  int microPhaseSeconds)  $default,) {final _that = this;
switch (_that) {
case _Match():
return $default(_that.id,_that.homeTeam,_that.awayTeam,_that.kickoffAt,_that.context,_that.matchState,_that.venue,_that.weather,_that.totalRegulationMinutes,_that.microPhaseSeconds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  Team homeTeam,  Team awayTeam,  DateTime kickoffAt,  MatchContext context,  MatchState matchState,  String venue,  String weather,  int totalRegulationMinutes,  int microPhaseSeconds)?  $default,) {final _that = this;
switch (_that) {
case _Match() when $default != null:
return $default(_that.id,_that.homeTeam,_that.awayTeam,_that.kickoffAt,_that.context,_that.matchState,_that.venue,_that.weather,_that.totalRegulationMinutes,_that.microPhaseSeconds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Match extends Match {
  const _Match({required this.id, required this.homeTeam, required this.awayTeam, required this.kickoffAt, required this.context, required this.matchState, this.venue = 'Unknown', this.weather = 'Unknown', this.totalRegulationMinutes = 90, this.microPhaseSeconds = 30}): super._();
  factory _Match.fromJson(Map<String, dynamic> json) => _$MatchFromJson(json);

@override final  int id;
@override final  Team homeTeam;
@override final  Team awayTeam;
@override final  DateTime kickoffAt;
@override final  MatchContext context;
@override final  MatchState matchState;
@override@JsonKey() final  String venue;
@override@JsonKey() final  String weather;
@override@JsonKey() final  int totalRegulationMinutes;
@override@JsonKey() final  int microPhaseSeconds;

/// Create a copy of Match
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchCopyWith<_Match> get copyWith => __$MatchCopyWithImpl<_Match>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Match&&(identical(other.id, id) || other.id == id)&&(identical(other.homeTeam, homeTeam) || other.homeTeam == homeTeam)&&(identical(other.awayTeam, awayTeam) || other.awayTeam == awayTeam)&&(identical(other.kickoffAt, kickoffAt) || other.kickoffAt == kickoffAt)&&(identical(other.context, context) || other.context == context)&&(identical(other.matchState, matchState) || other.matchState == matchState)&&(identical(other.venue, venue) || other.venue == venue)&&(identical(other.weather, weather) || other.weather == weather)&&(identical(other.totalRegulationMinutes, totalRegulationMinutes) || other.totalRegulationMinutes == totalRegulationMinutes)&&(identical(other.microPhaseSeconds, microPhaseSeconds) || other.microPhaseSeconds == microPhaseSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,homeTeam,awayTeam,kickoffAt,context,matchState,venue,weather,totalRegulationMinutes,microPhaseSeconds);

@override
String toString() {
  return 'Match(id: $id, homeTeam: $homeTeam, awayTeam: $awayTeam, kickoffAt: $kickoffAt, context: $context, matchState: $matchState, venue: $venue, weather: $weather, totalRegulationMinutes: $totalRegulationMinutes, microPhaseSeconds: $microPhaseSeconds)';
}


}

/// @nodoc
abstract mixin class _$MatchCopyWith<$Res> implements $MatchCopyWith<$Res> {
  factory _$MatchCopyWith(_Match value, $Res Function(_Match) _then) = __$MatchCopyWithImpl;
@override @useResult
$Res call({
 int id, Team homeTeam, Team awayTeam, DateTime kickoffAt, MatchContext context, MatchState matchState, String venue, String weather, int totalRegulationMinutes, int microPhaseSeconds
});


@override $TeamCopyWith<$Res> get homeTeam;@override $TeamCopyWith<$Res> get awayTeam;@override $MatchContextCopyWith<$Res> get context;@override $MatchStateCopyWith<$Res> get matchState;

}
/// @nodoc
class __$MatchCopyWithImpl<$Res>
    implements _$MatchCopyWith<$Res> {
  __$MatchCopyWithImpl(this._self, this._then);

  final _Match _self;
  final $Res Function(_Match) _then;

/// Create a copy of Match
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? homeTeam = null,Object? awayTeam = null,Object? kickoffAt = null,Object? context = null,Object? matchState = null,Object? venue = null,Object? weather = null,Object? totalRegulationMinutes = null,Object? microPhaseSeconds = null,}) {
  return _then(_Match(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,homeTeam: null == homeTeam ? _self.homeTeam : homeTeam // ignore: cast_nullable_to_non_nullable
as Team,awayTeam: null == awayTeam ? _self.awayTeam : awayTeam // ignore: cast_nullable_to_non_nullable
as Team,kickoffAt: null == kickoffAt ? _self.kickoffAt : kickoffAt // ignore: cast_nullable_to_non_nullable
as DateTime,context: null == context ? _self.context : context // ignore: cast_nullable_to_non_nullable
as MatchContext,matchState: null == matchState ? _self.matchState : matchState // ignore: cast_nullable_to_non_nullable
as MatchState,venue: null == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as String,weather: null == weather ? _self.weather : weather // ignore: cast_nullable_to_non_nullable
as String,totalRegulationMinutes: null == totalRegulationMinutes ? _self.totalRegulationMinutes : totalRegulationMinutes // ignore: cast_nullable_to_non_nullable
as int,microPhaseSeconds: null == microPhaseSeconds ? _self.microPhaseSeconds : microPhaseSeconds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of Match
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamCopyWith<$Res> get homeTeam {
  
  return $TeamCopyWith<$Res>(_self.homeTeam, (value) {
    return _then(_self.copyWith(homeTeam: value));
  });
}/// Create a copy of Match
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamCopyWith<$Res> get awayTeam {
  
  return $TeamCopyWith<$Res>(_self.awayTeam, (value) {
    return _then(_self.copyWith(awayTeam: value));
  });
}/// Create a copy of Match
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchContextCopyWith<$Res> get context {
  
  return $MatchContextCopyWith<$Res>(_self.context, (value) {
    return _then(_self.copyWith(context: value));
  });
}/// Create a copy of Match
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchStateCopyWith<$Res> get matchState {
  
  return $MatchStateCopyWith<$Res>(_self.matchState, (value) {
    return _then(_self.copyWith(matchState: value));
  });
}
}

// dart format on
