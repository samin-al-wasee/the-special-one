// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_dynamics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MatchDynamics {

 int get id; double get homeMomentum; double get awayMomentum; double get homeConfidence; double get awayConfidence; double get homeFatigue; double get awayFatigue; double get homeDisciplinePressure; double get awayDisciplinePressure; Map<PitchZone, double> get homeZoneDominance; Map<PitchZone, double> get awayZoneDominance; Map<String, int> get exploitationCounters;
/// Create a copy of MatchDynamics
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchDynamicsCopyWith<MatchDynamics> get copyWith => _$MatchDynamicsCopyWithImpl<MatchDynamics>(this as MatchDynamics, _$identity);

  /// Serializes this MatchDynamics to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchDynamics&&(identical(other.id, id) || other.id == id)&&(identical(other.homeMomentum, homeMomentum) || other.homeMomentum == homeMomentum)&&(identical(other.awayMomentum, awayMomentum) || other.awayMomentum == awayMomentum)&&(identical(other.homeConfidence, homeConfidence) || other.homeConfidence == homeConfidence)&&(identical(other.awayConfidence, awayConfidence) || other.awayConfidence == awayConfidence)&&(identical(other.homeFatigue, homeFatigue) || other.homeFatigue == homeFatigue)&&(identical(other.awayFatigue, awayFatigue) || other.awayFatigue == awayFatigue)&&(identical(other.homeDisciplinePressure, homeDisciplinePressure) || other.homeDisciplinePressure == homeDisciplinePressure)&&(identical(other.awayDisciplinePressure, awayDisciplinePressure) || other.awayDisciplinePressure == awayDisciplinePressure)&&const DeepCollectionEquality().equals(other.homeZoneDominance, homeZoneDominance)&&const DeepCollectionEquality().equals(other.awayZoneDominance, awayZoneDominance)&&const DeepCollectionEquality().equals(other.exploitationCounters, exploitationCounters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,homeMomentum,awayMomentum,homeConfidence,awayConfidence,homeFatigue,awayFatigue,homeDisciplinePressure,awayDisciplinePressure,const DeepCollectionEquality().hash(homeZoneDominance),const DeepCollectionEquality().hash(awayZoneDominance),const DeepCollectionEquality().hash(exploitationCounters));

@override
String toString() {
  return 'MatchDynamics(id: $id, homeMomentum: $homeMomentum, awayMomentum: $awayMomentum, homeConfidence: $homeConfidence, awayConfidence: $awayConfidence, homeFatigue: $homeFatigue, awayFatigue: $awayFatigue, homeDisciplinePressure: $homeDisciplinePressure, awayDisciplinePressure: $awayDisciplinePressure, homeZoneDominance: $homeZoneDominance, awayZoneDominance: $awayZoneDominance, exploitationCounters: $exploitationCounters)';
}


}

/// @nodoc
abstract mixin class $MatchDynamicsCopyWith<$Res>  {
  factory $MatchDynamicsCopyWith(MatchDynamics value, $Res Function(MatchDynamics) _then) = _$MatchDynamicsCopyWithImpl;
@useResult
$Res call({
 int id, double homeMomentum, double awayMomentum, double homeConfidence, double awayConfidence, double homeFatigue, double awayFatigue, double homeDisciplinePressure, double awayDisciplinePressure, Map<PitchZone, double> homeZoneDominance, Map<PitchZone, double> awayZoneDominance, Map<String, int> exploitationCounters
});




}
/// @nodoc
class _$MatchDynamicsCopyWithImpl<$Res>
    implements $MatchDynamicsCopyWith<$Res> {
  _$MatchDynamicsCopyWithImpl(this._self, this._then);

  final MatchDynamics _self;
  final $Res Function(MatchDynamics) _then;

/// Create a copy of MatchDynamics
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? homeMomentum = null,Object? awayMomentum = null,Object? homeConfidence = null,Object? awayConfidence = null,Object? homeFatigue = null,Object? awayFatigue = null,Object? homeDisciplinePressure = null,Object? awayDisciplinePressure = null,Object? homeZoneDominance = null,Object? awayZoneDominance = null,Object? exploitationCounters = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,homeMomentum: null == homeMomentum ? _self.homeMomentum : homeMomentum // ignore: cast_nullable_to_non_nullable
as double,awayMomentum: null == awayMomentum ? _self.awayMomentum : awayMomentum // ignore: cast_nullable_to_non_nullable
as double,homeConfidence: null == homeConfidence ? _self.homeConfidence : homeConfidence // ignore: cast_nullable_to_non_nullable
as double,awayConfidence: null == awayConfidence ? _self.awayConfidence : awayConfidence // ignore: cast_nullable_to_non_nullable
as double,homeFatigue: null == homeFatigue ? _self.homeFatigue : homeFatigue // ignore: cast_nullable_to_non_nullable
as double,awayFatigue: null == awayFatigue ? _self.awayFatigue : awayFatigue // ignore: cast_nullable_to_non_nullable
as double,homeDisciplinePressure: null == homeDisciplinePressure ? _self.homeDisciplinePressure : homeDisciplinePressure // ignore: cast_nullable_to_non_nullable
as double,awayDisciplinePressure: null == awayDisciplinePressure ? _self.awayDisciplinePressure : awayDisciplinePressure // ignore: cast_nullable_to_non_nullable
as double,homeZoneDominance: null == homeZoneDominance ? _self.homeZoneDominance : homeZoneDominance // ignore: cast_nullable_to_non_nullable
as Map<PitchZone, double>,awayZoneDominance: null == awayZoneDominance ? _self.awayZoneDominance : awayZoneDominance // ignore: cast_nullable_to_non_nullable
as Map<PitchZone, double>,exploitationCounters: null == exploitationCounters ? _self.exploitationCounters : exploitationCounters // ignore: cast_nullable_to_non_nullable
as Map<String, int>,
  ));
}

}


/// Adds pattern-matching-related methods to [MatchDynamics].
extension MatchDynamicsPatterns on MatchDynamics {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchDynamics value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchDynamics() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchDynamics value)  $default,){
final _that = this;
switch (_that) {
case _MatchDynamics():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchDynamics value)?  $default,){
final _that = this;
switch (_that) {
case _MatchDynamics() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  double homeMomentum,  double awayMomentum,  double homeConfidence,  double awayConfidence,  double homeFatigue,  double awayFatigue,  double homeDisciplinePressure,  double awayDisciplinePressure,  Map<PitchZone, double> homeZoneDominance,  Map<PitchZone, double> awayZoneDominance,  Map<String, int> exploitationCounters)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchDynamics() when $default != null:
return $default(_that.id,_that.homeMomentum,_that.awayMomentum,_that.homeConfidence,_that.awayConfidence,_that.homeFatigue,_that.awayFatigue,_that.homeDisciplinePressure,_that.awayDisciplinePressure,_that.homeZoneDominance,_that.awayZoneDominance,_that.exploitationCounters);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  double homeMomentum,  double awayMomentum,  double homeConfidence,  double awayConfidence,  double homeFatigue,  double awayFatigue,  double homeDisciplinePressure,  double awayDisciplinePressure,  Map<PitchZone, double> homeZoneDominance,  Map<PitchZone, double> awayZoneDominance,  Map<String, int> exploitationCounters)  $default,) {final _that = this;
switch (_that) {
case _MatchDynamics():
return $default(_that.id,_that.homeMomentum,_that.awayMomentum,_that.homeConfidence,_that.awayConfidence,_that.homeFatigue,_that.awayFatigue,_that.homeDisciplinePressure,_that.awayDisciplinePressure,_that.homeZoneDominance,_that.awayZoneDominance,_that.exploitationCounters);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  double homeMomentum,  double awayMomentum,  double homeConfidence,  double awayConfidence,  double homeFatigue,  double awayFatigue,  double homeDisciplinePressure,  double awayDisciplinePressure,  Map<PitchZone, double> homeZoneDominance,  Map<PitchZone, double> awayZoneDominance,  Map<String, int> exploitationCounters)?  $default,) {final _that = this;
switch (_that) {
case _MatchDynamics() when $default != null:
return $default(_that.id,_that.homeMomentum,_that.awayMomentum,_that.homeConfidence,_that.awayConfidence,_that.homeFatigue,_that.awayFatigue,_that.homeDisciplinePressure,_that.awayDisciplinePressure,_that.homeZoneDominance,_that.awayZoneDominance,_that.exploitationCounters);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MatchDynamics extends MatchDynamics {
  const _MatchDynamics({required this.id, this.homeMomentum = 0.0, this.awayMomentum = 0.0, this.homeConfidence = 0.5, this.awayConfidence = 0.5, this.homeFatigue = 0.0, this.awayFatigue = 0.0, this.homeDisciplinePressure = 0.0, this.awayDisciplinePressure = 0.0, final  Map<PitchZone, double> homeZoneDominance = const <PitchZone, double>{}, final  Map<PitchZone, double> awayZoneDominance = const <PitchZone, double>{}, final  Map<String, int> exploitationCounters = const <String, int>{}}): _homeZoneDominance = homeZoneDominance,_awayZoneDominance = awayZoneDominance,_exploitationCounters = exploitationCounters,super._();
  factory _MatchDynamics.fromJson(Map<String, dynamic> json) => _$MatchDynamicsFromJson(json);

@override final  int id;
@override@JsonKey() final  double homeMomentum;
@override@JsonKey() final  double awayMomentum;
@override@JsonKey() final  double homeConfidence;
@override@JsonKey() final  double awayConfidence;
@override@JsonKey() final  double homeFatigue;
@override@JsonKey() final  double awayFatigue;
@override@JsonKey() final  double homeDisciplinePressure;
@override@JsonKey() final  double awayDisciplinePressure;
 final  Map<PitchZone, double> _homeZoneDominance;
@override@JsonKey() Map<PitchZone, double> get homeZoneDominance {
  if (_homeZoneDominance is EqualUnmodifiableMapView) return _homeZoneDominance;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_homeZoneDominance);
}

 final  Map<PitchZone, double> _awayZoneDominance;
@override@JsonKey() Map<PitchZone, double> get awayZoneDominance {
  if (_awayZoneDominance is EqualUnmodifiableMapView) return _awayZoneDominance;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_awayZoneDominance);
}

 final  Map<String, int> _exploitationCounters;
@override@JsonKey() Map<String, int> get exploitationCounters {
  if (_exploitationCounters is EqualUnmodifiableMapView) return _exploitationCounters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_exploitationCounters);
}


/// Create a copy of MatchDynamics
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchDynamicsCopyWith<_MatchDynamics> get copyWith => __$MatchDynamicsCopyWithImpl<_MatchDynamics>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchDynamicsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchDynamics&&(identical(other.id, id) || other.id == id)&&(identical(other.homeMomentum, homeMomentum) || other.homeMomentum == homeMomentum)&&(identical(other.awayMomentum, awayMomentum) || other.awayMomentum == awayMomentum)&&(identical(other.homeConfidence, homeConfidence) || other.homeConfidence == homeConfidence)&&(identical(other.awayConfidence, awayConfidence) || other.awayConfidence == awayConfidence)&&(identical(other.homeFatigue, homeFatigue) || other.homeFatigue == homeFatigue)&&(identical(other.awayFatigue, awayFatigue) || other.awayFatigue == awayFatigue)&&(identical(other.homeDisciplinePressure, homeDisciplinePressure) || other.homeDisciplinePressure == homeDisciplinePressure)&&(identical(other.awayDisciplinePressure, awayDisciplinePressure) || other.awayDisciplinePressure == awayDisciplinePressure)&&const DeepCollectionEquality().equals(other._homeZoneDominance, _homeZoneDominance)&&const DeepCollectionEquality().equals(other._awayZoneDominance, _awayZoneDominance)&&const DeepCollectionEquality().equals(other._exploitationCounters, _exploitationCounters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,homeMomentum,awayMomentum,homeConfidence,awayConfidence,homeFatigue,awayFatigue,homeDisciplinePressure,awayDisciplinePressure,const DeepCollectionEquality().hash(_homeZoneDominance),const DeepCollectionEquality().hash(_awayZoneDominance),const DeepCollectionEquality().hash(_exploitationCounters));

@override
String toString() {
  return 'MatchDynamics(id: $id, homeMomentum: $homeMomentum, awayMomentum: $awayMomentum, homeConfidence: $homeConfidence, awayConfidence: $awayConfidence, homeFatigue: $homeFatigue, awayFatigue: $awayFatigue, homeDisciplinePressure: $homeDisciplinePressure, awayDisciplinePressure: $awayDisciplinePressure, homeZoneDominance: $homeZoneDominance, awayZoneDominance: $awayZoneDominance, exploitationCounters: $exploitationCounters)';
}


}

/// @nodoc
abstract mixin class _$MatchDynamicsCopyWith<$Res> implements $MatchDynamicsCopyWith<$Res> {
  factory _$MatchDynamicsCopyWith(_MatchDynamics value, $Res Function(_MatchDynamics) _then) = __$MatchDynamicsCopyWithImpl;
@override @useResult
$Res call({
 int id, double homeMomentum, double awayMomentum, double homeConfidence, double awayConfidence, double homeFatigue, double awayFatigue, double homeDisciplinePressure, double awayDisciplinePressure, Map<PitchZone, double> homeZoneDominance, Map<PitchZone, double> awayZoneDominance, Map<String, int> exploitationCounters
});




}
/// @nodoc
class __$MatchDynamicsCopyWithImpl<$Res>
    implements _$MatchDynamicsCopyWith<$Res> {
  __$MatchDynamicsCopyWithImpl(this._self, this._then);

  final _MatchDynamics _self;
  final $Res Function(_MatchDynamics) _then;

/// Create a copy of MatchDynamics
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? homeMomentum = null,Object? awayMomentum = null,Object? homeConfidence = null,Object? awayConfidence = null,Object? homeFatigue = null,Object? awayFatigue = null,Object? homeDisciplinePressure = null,Object? awayDisciplinePressure = null,Object? homeZoneDominance = null,Object? awayZoneDominance = null,Object? exploitationCounters = null,}) {
  return _then(_MatchDynamics(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,homeMomentum: null == homeMomentum ? _self.homeMomentum : homeMomentum // ignore: cast_nullable_to_non_nullable
as double,awayMomentum: null == awayMomentum ? _self.awayMomentum : awayMomentum // ignore: cast_nullable_to_non_nullable
as double,homeConfidence: null == homeConfidence ? _self.homeConfidence : homeConfidence // ignore: cast_nullable_to_non_nullable
as double,awayConfidence: null == awayConfidence ? _self.awayConfidence : awayConfidence // ignore: cast_nullable_to_non_nullable
as double,homeFatigue: null == homeFatigue ? _self.homeFatigue : homeFatigue // ignore: cast_nullable_to_non_nullable
as double,awayFatigue: null == awayFatigue ? _self.awayFatigue : awayFatigue // ignore: cast_nullable_to_non_nullable
as double,homeDisciplinePressure: null == homeDisciplinePressure ? _self.homeDisciplinePressure : homeDisciplinePressure // ignore: cast_nullable_to_non_nullable
as double,awayDisciplinePressure: null == awayDisciplinePressure ? _self.awayDisciplinePressure : awayDisciplinePressure // ignore: cast_nullable_to_non_nullable
as double,homeZoneDominance: null == homeZoneDominance ? _self._homeZoneDominance : homeZoneDominance // ignore: cast_nullable_to_non_nullable
as Map<PitchZone, double>,awayZoneDominance: null == awayZoneDominance ? _self._awayZoneDominance : awayZoneDominance // ignore: cast_nullable_to_non_nullable
as Map<PitchZone, double>,exploitationCounters: null == exploitationCounters ? _self._exploitationCounters : exploitationCounters // ignore: cast_nullable_to_non_nullable
as Map<String, int>,
  ));
}


}

// dart format on
