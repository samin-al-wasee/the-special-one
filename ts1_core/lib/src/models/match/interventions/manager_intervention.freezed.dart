// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manager_intervention.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ManagerIntervention {

 int get minute; TeamSide get teamSide; MatchCommandType get command; String? get note; int? get expiresAtMinute;
/// Create a copy of ManagerIntervention
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManagerInterventionCopyWith<ManagerIntervention> get copyWith => _$ManagerInterventionCopyWithImpl<ManagerIntervention>(this as ManagerIntervention, _$identity);

  /// Serializes this ManagerIntervention to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManagerIntervention&&(identical(other.minute, minute) || other.minute == minute)&&(identical(other.teamSide, teamSide) || other.teamSide == teamSide)&&(identical(other.command, command) || other.command == command)&&(identical(other.note, note) || other.note == note)&&(identical(other.expiresAtMinute, expiresAtMinute) || other.expiresAtMinute == expiresAtMinute));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,minute,teamSide,command,note,expiresAtMinute);

@override
String toString() {
  return 'ManagerIntervention(minute: $minute, teamSide: $teamSide, command: $command, note: $note, expiresAtMinute: $expiresAtMinute)';
}


}

/// @nodoc
abstract mixin class $ManagerInterventionCopyWith<$Res>  {
  factory $ManagerInterventionCopyWith(ManagerIntervention value, $Res Function(ManagerIntervention) _then) = _$ManagerInterventionCopyWithImpl;
@useResult
$Res call({
 int minute, TeamSide teamSide, MatchCommandType command, String? note, int? expiresAtMinute
});




}
/// @nodoc
class _$ManagerInterventionCopyWithImpl<$Res>
    implements $ManagerInterventionCopyWith<$Res> {
  _$ManagerInterventionCopyWithImpl(this._self, this._then);

  final ManagerIntervention _self;
  final $Res Function(ManagerIntervention) _then;

/// Create a copy of ManagerIntervention
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? minute = null,Object? teamSide = null,Object? command = null,Object? note = freezed,Object? expiresAtMinute = freezed,}) {
  return _then(_self.copyWith(
minute: null == minute ? _self.minute : minute // ignore: cast_nullable_to_non_nullable
as int,teamSide: null == teamSide ? _self.teamSide : teamSide // ignore: cast_nullable_to_non_nullable
as TeamSide,command: null == command ? _self.command : command // ignore: cast_nullable_to_non_nullable
as MatchCommandType,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,expiresAtMinute: freezed == expiresAtMinute ? _self.expiresAtMinute : expiresAtMinute // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ManagerIntervention].
extension ManagerInterventionPatterns on ManagerIntervention {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ManagerIntervention value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ManagerIntervention() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ManagerIntervention value)  $default,){
final _that = this;
switch (_that) {
case _ManagerIntervention():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ManagerIntervention value)?  $default,){
final _that = this;
switch (_that) {
case _ManagerIntervention() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int minute,  TeamSide teamSide,  MatchCommandType command,  String? note,  int? expiresAtMinute)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ManagerIntervention() when $default != null:
return $default(_that.minute,_that.teamSide,_that.command,_that.note,_that.expiresAtMinute);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int minute,  TeamSide teamSide,  MatchCommandType command,  String? note,  int? expiresAtMinute)  $default,) {final _that = this;
switch (_that) {
case _ManagerIntervention():
return $default(_that.minute,_that.teamSide,_that.command,_that.note,_that.expiresAtMinute);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int minute,  TeamSide teamSide,  MatchCommandType command,  String? note,  int? expiresAtMinute)?  $default,) {final _that = this;
switch (_that) {
case _ManagerIntervention() when $default != null:
return $default(_that.minute,_that.teamSide,_that.command,_that.note,_that.expiresAtMinute);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ManagerIntervention extends ManagerIntervention {
  const _ManagerIntervention({required this.minute, required this.teamSide, required this.command, this.note, this.expiresAtMinute}): super._();
  factory _ManagerIntervention.fromJson(Map<String, dynamic> json) => _$ManagerInterventionFromJson(json);

@override final  int minute;
@override final  TeamSide teamSide;
@override final  MatchCommandType command;
@override final  String? note;
@override final  int? expiresAtMinute;

/// Create a copy of ManagerIntervention
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManagerInterventionCopyWith<_ManagerIntervention> get copyWith => __$ManagerInterventionCopyWithImpl<_ManagerIntervention>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ManagerInterventionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ManagerIntervention&&(identical(other.minute, minute) || other.minute == minute)&&(identical(other.teamSide, teamSide) || other.teamSide == teamSide)&&(identical(other.command, command) || other.command == command)&&(identical(other.note, note) || other.note == note)&&(identical(other.expiresAtMinute, expiresAtMinute) || other.expiresAtMinute == expiresAtMinute));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,minute,teamSide,command,note,expiresAtMinute);

@override
String toString() {
  return 'ManagerIntervention(minute: $minute, teamSide: $teamSide, command: $command, note: $note, expiresAtMinute: $expiresAtMinute)';
}


}

/// @nodoc
abstract mixin class _$ManagerInterventionCopyWith<$Res> implements $ManagerInterventionCopyWith<$Res> {
  factory _$ManagerInterventionCopyWith(_ManagerIntervention value, $Res Function(_ManagerIntervention) _then) = __$ManagerInterventionCopyWithImpl;
@override @useResult
$Res call({
 int minute, TeamSide teamSide, MatchCommandType command, String? note, int? expiresAtMinute
});




}
/// @nodoc
class __$ManagerInterventionCopyWithImpl<$Res>
    implements _$ManagerInterventionCopyWith<$Res> {
  __$ManagerInterventionCopyWithImpl(this._self, this._then);

  final _ManagerIntervention _self;
  final $Res Function(_ManagerIntervention) _then;

/// Create a copy of ManagerIntervention
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? minute = null,Object? teamSide = null,Object? command = null,Object? note = freezed,Object? expiresAtMinute = freezed,}) {
  return _then(_ManagerIntervention(
minute: null == minute ? _self.minute : minute // ignore: cast_nullable_to_non_nullable
as int,teamSide: null == teamSide ? _self.teamSide : teamSide // ignore: cast_nullable_to_non_nullable
as TeamSide,command: null == command ? _self.command : command // ignore: cast_nullable_to_non_nullable
as MatchCommandType,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,expiresAtMinute: freezed == expiresAtMinute ? _self.expiresAtMinute : expiresAtMinute // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
