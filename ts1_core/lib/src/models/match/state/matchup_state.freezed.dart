// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'matchup_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MatchupState {

// Attack vs defense interaction per direction.
 double get homeAttackVsAwayDefense; double get awayAttackVsHomeDefense;// Midfield and territorial control.
 double get midfieldControlEdge;// Transition and route control.
 double get transitionControlEdge; double get wingControlEdge;// Set-piece confrontation outcome edge.
 double get setPieceControlEdge;
/// Create a copy of MatchupState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchupStateCopyWith<MatchupState> get copyWith => _$MatchupStateCopyWithImpl<MatchupState>(this as MatchupState, _$identity);

  /// Serializes this MatchupState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchupState&&(identical(other.homeAttackVsAwayDefense, homeAttackVsAwayDefense) || other.homeAttackVsAwayDefense == homeAttackVsAwayDefense)&&(identical(other.awayAttackVsHomeDefense, awayAttackVsHomeDefense) || other.awayAttackVsHomeDefense == awayAttackVsHomeDefense)&&(identical(other.midfieldControlEdge, midfieldControlEdge) || other.midfieldControlEdge == midfieldControlEdge)&&(identical(other.transitionControlEdge, transitionControlEdge) || other.transitionControlEdge == transitionControlEdge)&&(identical(other.wingControlEdge, wingControlEdge) || other.wingControlEdge == wingControlEdge)&&(identical(other.setPieceControlEdge, setPieceControlEdge) || other.setPieceControlEdge == setPieceControlEdge));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,homeAttackVsAwayDefense,awayAttackVsHomeDefense,midfieldControlEdge,transitionControlEdge,wingControlEdge,setPieceControlEdge);

@override
String toString() {
  return 'MatchupState(homeAttackVsAwayDefense: $homeAttackVsAwayDefense, awayAttackVsHomeDefense: $awayAttackVsHomeDefense, midfieldControlEdge: $midfieldControlEdge, transitionControlEdge: $transitionControlEdge, wingControlEdge: $wingControlEdge, setPieceControlEdge: $setPieceControlEdge)';
}


}

/// @nodoc
abstract mixin class $MatchupStateCopyWith<$Res>  {
  factory $MatchupStateCopyWith(MatchupState value, $Res Function(MatchupState) _then) = _$MatchupStateCopyWithImpl;
@useResult
$Res call({
 double homeAttackVsAwayDefense, double awayAttackVsHomeDefense, double midfieldControlEdge, double transitionControlEdge, double wingControlEdge, double setPieceControlEdge
});




}
/// @nodoc
class _$MatchupStateCopyWithImpl<$Res>
    implements $MatchupStateCopyWith<$Res> {
  _$MatchupStateCopyWithImpl(this._self, this._then);

  final MatchupState _self;
  final $Res Function(MatchupState) _then;

/// Create a copy of MatchupState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? homeAttackVsAwayDefense = null,Object? awayAttackVsHomeDefense = null,Object? midfieldControlEdge = null,Object? transitionControlEdge = null,Object? wingControlEdge = null,Object? setPieceControlEdge = null,}) {
  return _then(_self.copyWith(
homeAttackVsAwayDefense: null == homeAttackVsAwayDefense ? _self.homeAttackVsAwayDefense : homeAttackVsAwayDefense // ignore: cast_nullable_to_non_nullable
as double,awayAttackVsHomeDefense: null == awayAttackVsHomeDefense ? _self.awayAttackVsHomeDefense : awayAttackVsHomeDefense // ignore: cast_nullable_to_non_nullable
as double,midfieldControlEdge: null == midfieldControlEdge ? _self.midfieldControlEdge : midfieldControlEdge // ignore: cast_nullable_to_non_nullable
as double,transitionControlEdge: null == transitionControlEdge ? _self.transitionControlEdge : transitionControlEdge // ignore: cast_nullable_to_non_nullable
as double,wingControlEdge: null == wingControlEdge ? _self.wingControlEdge : wingControlEdge // ignore: cast_nullable_to_non_nullable
as double,setPieceControlEdge: null == setPieceControlEdge ? _self.setPieceControlEdge : setPieceControlEdge // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [MatchupState].
extension MatchupStatePatterns on MatchupState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchupState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchupState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchupState value)  $default,){
final _that = this;
switch (_that) {
case _MatchupState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchupState value)?  $default,){
final _that = this;
switch (_that) {
case _MatchupState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double homeAttackVsAwayDefense,  double awayAttackVsHomeDefense,  double midfieldControlEdge,  double transitionControlEdge,  double wingControlEdge,  double setPieceControlEdge)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchupState() when $default != null:
return $default(_that.homeAttackVsAwayDefense,_that.awayAttackVsHomeDefense,_that.midfieldControlEdge,_that.transitionControlEdge,_that.wingControlEdge,_that.setPieceControlEdge);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double homeAttackVsAwayDefense,  double awayAttackVsHomeDefense,  double midfieldControlEdge,  double transitionControlEdge,  double wingControlEdge,  double setPieceControlEdge)  $default,) {final _that = this;
switch (_that) {
case _MatchupState():
return $default(_that.homeAttackVsAwayDefense,_that.awayAttackVsHomeDefense,_that.midfieldControlEdge,_that.transitionControlEdge,_that.wingControlEdge,_that.setPieceControlEdge);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double homeAttackVsAwayDefense,  double awayAttackVsHomeDefense,  double midfieldControlEdge,  double transitionControlEdge,  double wingControlEdge,  double setPieceControlEdge)?  $default,) {final _that = this;
switch (_that) {
case _MatchupState() when $default != null:
return $default(_that.homeAttackVsAwayDefense,_that.awayAttackVsHomeDefense,_that.midfieldControlEdge,_that.transitionControlEdge,_that.wingControlEdge,_that.setPieceControlEdge);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MatchupState implements MatchupState {
  const _MatchupState({this.homeAttackVsAwayDefense = 0.0, this.awayAttackVsHomeDefense = 0.0, this.midfieldControlEdge = 0.0, this.transitionControlEdge = 0.0, this.wingControlEdge = 0.0, this.setPieceControlEdge = 0.0});
  factory _MatchupState.fromJson(Map<String, dynamic> json) => _$MatchupStateFromJson(json);

// Attack vs defense interaction per direction.
@override@JsonKey() final  double homeAttackVsAwayDefense;
@override@JsonKey() final  double awayAttackVsHomeDefense;
// Midfield and territorial control.
@override@JsonKey() final  double midfieldControlEdge;
// Transition and route control.
@override@JsonKey() final  double transitionControlEdge;
@override@JsonKey() final  double wingControlEdge;
// Set-piece confrontation outcome edge.
@override@JsonKey() final  double setPieceControlEdge;

/// Create a copy of MatchupState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchupStateCopyWith<_MatchupState> get copyWith => __$MatchupStateCopyWithImpl<_MatchupState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchupStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchupState&&(identical(other.homeAttackVsAwayDefense, homeAttackVsAwayDefense) || other.homeAttackVsAwayDefense == homeAttackVsAwayDefense)&&(identical(other.awayAttackVsHomeDefense, awayAttackVsHomeDefense) || other.awayAttackVsHomeDefense == awayAttackVsHomeDefense)&&(identical(other.midfieldControlEdge, midfieldControlEdge) || other.midfieldControlEdge == midfieldControlEdge)&&(identical(other.transitionControlEdge, transitionControlEdge) || other.transitionControlEdge == transitionControlEdge)&&(identical(other.wingControlEdge, wingControlEdge) || other.wingControlEdge == wingControlEdge)&&(identical(other.setPieceControlEdge, setPieceControlEdge) || other.setPieceControlEdge == setPieceControlEdge));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,homeAttackVsAwayDefense,awayAttackVsHomeDefense,midfieldControlEdge,transitionControlEdge,wingControlEdge,setPieceControlEdge);

@override
String toString() {
  return 'MatchupState(homeAttackVsAwayDefense: $homeAttackVsAwayDefense, awayAttackVsHomeDefense: $awayAttackVsHomeDefense, midfieldControlEdge: $midfieldControlEdge, transitionControlEdge: $transitionControlEdge, wingControlEdge: $wingControlEdge, setPieceControlEdge: $setPieceControlEdge)';
}


}

/// @nodoc
abstract mixin class _$MatchupStateCopyWith<$Res> implements $MatchupStateCopyWith<$Res> {
  factory _$MatchupStateCopyWith(_MatchupState value, $Res Function(_MatchupState) _then) = __$MatchupStateCopyWithImpl;
@override @useResult
$Res call({
 double homeAttackVsAwayDefense, double awayAttackVsHomeDefense, double midfieldControlEdge, double transitionControlEdge, double wingControlEdge, double setPieceControlEdge
});




}
/// @nodoc
class __$MatchupStateCopyWithImpl<$Res>
    implements _$MatchupStateCopyWith<$Res> {
  __$MatchupStateCopyWithImpl(this._self, this._then);

  final _MatchupState _self;
  final $Res Function(_MatchupState) _then;

/// Create a copy of MatchupState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? homeAttackVsAwayDefense = null,Object? awayAttackVsHomeDefense = null,Object? midfieldControlEdge = null,Object? transitionControlEdge = null,Object? wingControlEdge = null,Object? setPieceControlEdge = null,}) {
  return _then(_MatchupState(
homeAttackVsAwayDefense: null == homeAttackVsAwayDefense ? _self.homeAttackVsAwayDefense : homeAttackVsAwayDefense // ignore: cast_nullable_to_non_nullable
as double,awayAttackVsHomeDefense: null == awayAttackVsHomeDefense ? _self.awayAttackVsHomeDefense : awayAttackVsHomeDefense // ignore: cast_nullable_to_non_nullable
as double,midfieldControlEdge: null == midfieldControlEdge ? _self.midfieldControlEdge : midfieldControlEdge // ignore: cast_nullable_to_non_nullable
as double,transitionControlEdge: null == transitionControlEdge ? _self.transitionControlEdge : transitionControlEdge // ignore: cast_nullable_to_non_nullable
as double,wingControlEdge: null == wingControlEdge ? _self.wingControlEdge : wingControlEdge // ignore: cast_nullable_to_non_nullable
as double,setPieceControlEdge: null == setPieceControlEdge ? _self.setPieceControlEdge : setPieceControlEdge // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
