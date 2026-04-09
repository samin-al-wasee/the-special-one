// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lineup_slot_assignment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LineupSlotAssignment {

 int get id; FormationSlot get formationSlot; Player get player; RoleAssignment get roleAssignment;
/// Create a copy of LineupSlotAssignment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LineupSlotAssignmentCopyWith<LineupSlotAssignment> get copyWith => _$LineupSlotAssignmentCopyWithImpl<LineupSlotAssignment>(this as LineupSlotAssignment, _$identity);

  /// Serializes this LineupSlotAssignment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LineupSlotAssignment&&(identical(other.id, id) || other.id == id)&&(identical(other.formationSlot, formationSlot) || other.formationSlot == formationSlot)&&(identical(other.player, player) || other.player == player)&&(identical(other.roleAssignment, roleAssignment) || other.roleAssignment == roleAssignment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,formationSlot,player,roleAssignment);

@override
String toString() {
  return 'LineupSlotAssignment(id: $id, formationSlot: $formationSlot, player: $player, roleAssignment: $roleAssignment)';
}


}

/// @nodoc
abstract mixin class $LineupSlotAssignmentCopyWith<$Res>  {
  factory $LineupSlotAssignmentCopyWith(LineupSlotAssignment value, $Res Function(LineupSlotAssignment) _then) = _$LineupSlotAssignmentCopyWithImpl;
@useResult
$Res call({
 int id, FormationSlot formationSlot, Player player, RoleAssignment roleAssignment
});


$FormationSlotCopyWith<$Res> get formationSlot;$PlayerCopyWith<$Res> get player;$RoleAssignmentCopyWith<$Res> get roleAssignment;

}
/// @nodoc
class _$LineupSlotAssignmentCopyWithImpl<$Res>
    implements $LineupSlotAssignmentCopyWith<$Res> {
  _$LineupSlotAssignmentCopyWithImpl(this._self, this._then);

  final LineupSlotAssignment _self;
  final $Res Function(LineupSlotAssignment) _then;

/// Create a copy of LineupSlotAssignment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? formationSlot = null,Object? player = null,Object? roleAssignment = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,formationSlot: null == formationSlot ? _self.formationSlot : formationSlot // ignore: cast_nullable_to_non_nullable
as FormationSlot,player: null == player ? _self.player : player // ignore: cast_nullable_to_non_nullable
as Player,roleAssignment: null == roleAssignment ? _self.roleAssignment : roleAssignment // ignore: cast_nullable_to_non_nullable
as RoleAssignment,
  ));
}
/// Create a copy of LineupSlotAssignment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FormationSlotCopyWith<$Res> get formationSlot {
  
  return $FormationSlotCopyWith<$Res>(_self.formationSlot, (value) {
    return _then(_self.copyWith(formationSlot: value));
  });
}/// Create a copy of LineupSlotAssignment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerCopyWith<$Res> get player {
  
  return $PlayerCopyWith<$Res>(_self.player, (value) {
    return _then(_self.copyWith(player: value));
  });
}/// Create a copy of LineupSlotAssignment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoleAssignmentCopyWith<$Res> get roleAssignment {
  
  return $RoleAssignmentCopyWith<$Res>(_self.roleAssignment, (value) {
    return _then(_self.copyWith(roleAssignment: value));
  });
}
}


/// Adds pattern-matching-related methods to [LineupSlotAssignment].
extension LineupSlotAssignmentPatterns on LineupSlotAssignment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LineupSlotAssignment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LineupSlotAssignment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LineupSlotAssignment value)  $default,){
final _that = this;
switch (_that) {
case _LineupSlotAssignment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LineupSlotAssignment value)?  $default,){
final _that = this;
switch (_that) {
case _LineupSlotAssignment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  FormationSlot formationSlot,  Player player,  RoleAssignment roleAssignment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LineupSlotAssignment() when $default != null:
return $default(_that.id,_that.formationSlot,_that.player,_that.roleAssignment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  FormationSlot formationSlot,  Player player,  RoleAssignment roleAssignment)  $default,) {final _that = this;
switch (_that) {
case _LineupSlotAssignment():
return $default(_that.id,_that.formationSlot,_that.player,_that.roleAssignment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  FormationSlot formationSlot,  Player player,  RoleAssignment roleAssignment)?  $default,) {final _that = this;
switch (_that) {
case _LineupSlotAssignment() when $default != null:
return $default(_that.id,_that.formationSlot,_that.player,_that.roleAssignment);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LineupSlotAssignment implements LineupSlotAssignment {
  const _LineupSlotAssignment({required this.id, required this.formationSlot, required this.player, required this.roleAssignment});
  factory _LineupSlotAssignment.fromJson(Map<String, dynamic> json) => _$LineupSlotAssignmentFromJson(json);

@override final  int id;
@override final  FormationSlot formationSlot;
@override final  Player player;
@override final  RoleAssignment roleAssignment;

/// Create a copy of LineupSlotAssignment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LineupSlotAssignmentCopyWith<_LineupSlotAssignment> get copyWith => __$LineupSlotAssignmentCopyWithImpl<_LineupSlotAssignment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LineupSlotAssignmentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LineupSlotAssignment&&(identical(other.id, id) || other.id == id)&&(identical(other.formationSlot, formationSlot) || other.formationSlot == formationSlot)&&(identical(other.player, player) || other.player == player)&&(identical(other.roleAssignment, roleAssignment) || other.roleAssignment == roleAssignment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,formationSlot,player,roleAssignment);

@override
String toString() {
  return 'LineupSlotAssignment(id: $id, formationSlot: $formationSlot, player: $player, roleAssignment: $roleAssignment)';
}


}

/// @nodoc
abstract mixin class _$LineupSlotAssignmentCopyWith<$Res> implements $LineupSlotAssignmentCopyWith<$Res> {
  factory _$LineupSlotAssignmentCopyWith(_LineupSlotAssignment value, $Res Function(_LineupSlotAssignment) _then) = __$LineupSlotAssignmentCopyWithImpl;
@override @useResult
$Res call({
 int id, FormationSlot formationSlot, Player player, RoleAssignment roleAssignment
});


@override $FormationSlotCopyWith<$Res> get formationSlot;@override $PlayerCopyWith<$Res> get player;@override $RoleAssignmentCopyWith<$Res> get roleAssignment;

}
/// @nodoc
class __$LineupSlotAssignmentCopyWithImpl<$Res>
    implements _$LineupSlotAssignmentCopyWith<$Res> {
  __$LineupSlotAssignmentCopyWithImpl(this._self, this._then);

  final _LineupSlotAssignment _self;
  final $Res Function(_LineupSlotAssignment) _then;

/// Create a copy of LineupSlotAssignment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? formationSlot = null,Object? player = null,Object? roleAssignment = null,}) {
  return _then(_LineupSlotAssignment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,formationSlot: null == formationSlot ? _self.formationSlot : formationSlot // ignore: cast_nullable_to_non_nullable
as FormationSlot,player: null == player ? _self.player : player // ignore: cast_nullable_to_non_nullable
as Player,roleAssignment: null == roleAssignment ? _self.roleAssignment : roleAssignment // ignore: cast_nullable_to_non_nullable
as RoleAssignment,
  ));
}

/// Create a copy of LineupSlotAssignment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FormationSlotCopyWith<$Res> get formationSlot {
  
  return $FormationSlotCopyWith<$Res>(_self.formationSlot, (value) {
    return _then(_self.copyWith(formationSlot: value));
  });
}/// Create a copy of LineupSlotAssignment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerCopyWith<$Res> get player {
  
  return $PlayerCopyWith<$Res>(_self.player, (value) {
    return _then(_self.copyWith(player: value));
  });
}/// Create a copy of LineupSlotAssignment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoleAssignmentCopyWith<$Res> get roleAssignment {
  
  return $RoleAssignmentCopyWith<$Res>(_self.roleAssignment, (value) {
    return _then(_self.copyWith(roleAssignment: value));
  });
}
}

// dart format on
