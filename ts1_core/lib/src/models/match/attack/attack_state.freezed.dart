// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attack_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AttackState {

 int get id;/// Where the ball is progressing spatially.
/// Determines pitch zones available for play.
 AttackRoute get route;/// How the attacking team is executing tactically.
/// Determines tempo, passing style, and risk appetite.
 AttackMode get mode;/// Why/where the attack originated from.
/// Determines defensive organization level and tactical expectations.
 AttackContext get context;/// Optional: How many phases has this attack sequence lasted?
/// Useful for tracking attack breakdown/continuation.
 int get phaseCount;/// Optional: Intensity/quality rating of the attack (0.0 to 1.0).
/// Higher means more dangerous, better positioned, higher shot probability.
 double get intensity;
/// Create a copy of AttackState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttackStateCopyWith<AttackState> get copyWith => _$AttackStateCopyWithImpl<AttackState>(this as AttackState, _$identity);

  /// Serializes this AttackState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttackState&&(identical(other.id, id) || other.id == id)&&(identical(other.route, route) || other.route == route)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.context, context) || other.context == context)&&(identical(other.phaseCount, phaseCount) || other.phaseCount == phaseCount)&&(identical(other.intensity, intensity) || other.intensity == intensity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,route,mode,context,phaseCount,intensity);

@override
String toString() {
  return 'AttackState(id: $id, route: $route, mode: $mode, context: $context, phaseCount: $phaseCount, intensity: $intensity)';
}


}

/// @nodoc
abstract mixin class $AttackStateCopyWith<$Res>  {
  factory $AttackStateCopyWith(AttackState value, $Res Function(AttackState) _then) = _$AttackStateCopyWithImpl;
@useResult
$Res call({
 int id, AttackRoute route, AttackMode mode, AttackContext context, int phaseCount, double intensity
});




}
/// @nodoc
class _$AttackStateCopyWithImpl<$Res>
    implements $AttackStateCopyWith<$Res> {
  _$AttackStateCopyWithImpl(this._self, this._then);

  final AttackState _self;
  final $Res Function(AttackState) _then;

/// Create a copy of AttackState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? route = null,Object? mode = null,Object? context = null,Object? phaseCount = null,Object? intensity = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,route: null == route ? _self.route : route // ignore: cast_nullable_to_non_nullable
as AttackRoute,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as AttackMode,context: null == context ? _self.context : context // ignore: cast_nullable_to_non_nullable
as AttackContext,phaseCount: null == phaseCount ? _self.phaseCount : phaseCount // ignore: cast_nullable_to_non_nullable
as int,intensity: null == intensity ? _self.intensity : intensity // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [AttackState].
extension AttackStatePatterns on AttackState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttackState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttackState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttackState value)  $default,){
final _that = this;
switch (_that) {
case _AttackState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttackState value)?  $default,){
final _that = this;
switch (_that) {
case _AttackState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  AttackRoute route,  AttackMode mode,  AttackContext context,  int phaseCount,  double intensity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttackState() when $default != null:
return $default(_that.id,_that.route,_that.mode,_that.context,_that.phaseCount,_that.intensity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  AttackRoute route,  AttackMode mode,  AttackContext context,  int phaseCount,  double intensity)  $default,) {final _that = this;
switch (_that) {
case _AttackState():
return $default(_that.id,_that.route,_that.mode,_that.context,_that.phaseCount,_that.intensity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  AttackRoute route,  AttackMode mode,  AttackContext context,  int phaseCount,  double intensity)?  $default,) {final _that = this;
switch (_that) {
case _AttackState() when $default != null:
return $default(_that.id,_that.route,_that.mode,_that.context,_that.phaseCount,_that.intensity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AttackState extends AttackState {
  const _AttackState({required this.id, required this.route, required this.mode, required this.context, this.phaseCount = 0, this.intensity = 0.5}): super._();
  factory _AttackState.fromJson(Map<String, dynamic> json) => _$AttackStateFromJson(json);

@override final  int id;
/// Where the ball is progressing spatially.
/// Determines pitch zones available for play.
@override final  AttackRoute route;
/// How the attacking team is executing tactically.
/// Determines tempo, passing style, and risk appetite.
@override final  AttackMode mode;
/// Why/where the attack originated from.
/// Determines defensive organization level and tactical expectations.
@override final  AttackContext context;
/// Optional: How many phases has this attack sequence lasted?
/// Useful for tracking attack breakdown/continuation.
@override@JsonKey() final  int phaseCount;
/// Optional: Intensity/quality rating of the attack (0.0 to 1.0).
/// Higher means more dangerous, better positioned, higher shot probability.
@override@JsonKey() final  double intensity;

/// Create a copy of AttackState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttackStateCopyWith<_AttackState> get copyWith => __$AttackStateCopyWithImpl<_AttackState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttackStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttackState&&(identical(other.id, id) || other.id == id)&&(identical(other.route, route) || other.route == route)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.context, context) || other.context == context)&&(identical(other.phaseCount, phaseCount) || other.phaseCount == phaseCount)&&(identical(other.intensity, intensity) || other.intensity == intensity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,route,mode,context,phaseCount,intensity);

@override
String toString() {
  return 'AttackState(id: $id, route: $route, mode: $mode, context: $context, phaseCount: $phaseCount, intensity: $intensity)';
}


}

/// @nodoc
abstract mixin class _$AttackStateCopyWith<$Res> implements $AttackStateCopyWith<$Res> {
  factory _$AttackStateCopyWith(_AttackState value, $Res Function(_AttackState) _then) = __$AttackStateCopyWithImpl;
@override @useResult
$Res call({
 int id, AttackRoute route, AttackMode mode, AttackContext context, int phaseCount, double intensity
});




}
/// @nodoc
class __$AttackStateCopyWithImpl<$Res>
    implements _$AttackStateCopyWith<$Res> {
  __$AttackStateCopyWithImpl(this._self, this._then);

  final _AttackState _self;
  final $Res Function(_AttackState) _then;

/// Create a copy of AttackState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? route = null,Object? mode = null,Object? context = null,Object? phaseCount = null,Object? intensity = null,}) {
  return _then(_AttackState(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,route: null == route ? _self.route : route // ignore: cast_nullable_to_non_nullable
as AttackRoute,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as AttackMode,context: null == context ? _self.context : context // ignore: cast_nullable_to_non_nullable
as AttackContext,phaseCount: null == phaseCount ? _self.phaseCount : phaseCount // ignore: cast_nullable_to_non_nullable
as int,intensity: null == intensity ? _self.intensity : intensity // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
