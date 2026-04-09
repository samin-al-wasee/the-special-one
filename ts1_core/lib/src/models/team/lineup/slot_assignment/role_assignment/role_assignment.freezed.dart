// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'role_assignment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RoleAssignment {

 int get id; Role get roleName; Duty get duty;
/// Create a copy of RoleAssignment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoleAssignmentCopyWith<RoleAssignment> get copyWith => _$RoleAssignmentCopyWithImpl<RoleAssignment>(this as RoleAssignment, _$identity);

  /// Serializes this RoleAssignment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoleAssignment&&(identical(other.id, id) || other.id == id)&&(identical(other.roleName, roleName) || other.roleName == roleName)&&(identical(other.duty, duty) || other.duty == duty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,roleName,duty);

@override
String toString() {
  return 'RoleAssignment(id: $id, roleName: $roleName, duty: $duty)';
}


}

/// @nodoc
abstract mixin class $RoleAssignmentCopyWith<$Res>  {
  factory $RoleAssignmentCopyWith(RoleAssignment value, $Res Function(RoleAssignment) _then) = _$RoleAssignmentCopyWithImpl;
@useResult
$Res call({
 int id, Role roleName, Duty duty
});




}
/// @nodoc
class _$RoleAssignmentCopyWithImpl<$Res>
    implements $RoleAssignmentCopyWith<$Res> {
  _$RoleAssignmentCopyWithImpl(this._self, this._then);

  final RoleAssignment _self;
  final $Res Function(RoleAssignment) _then;

/// Create a copy of RoleAssignment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? roleName = null,Object? duty = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,roleName: null == roleName ? _self.roleName : roleName // ignore: cast_nullable_to_non_nullable
as Role,duty: null == duty ? _self.duty : duty // ignore: cast_nullable_to_non_nullable
as Duty,
  ));
}

}


/// Adds pattern-matching-related methods to [RoleAssignment].
extension RoleAssignmentPatterns on RoleAssignment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoleAssignment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoleAssignment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoleAssignment value)  $default,){
final _that = this;
switch (_that) {
case _RoleAssignment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoleAssignment value)?  $default,){
final _that = this;
switch (_that) {
case _RoleAssignment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  Role roleName,  Duty duty)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoleAssignment() when $default != null:
return $default(_that.id,_that.roleName,_that.duty);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  Role roleName,  Duty duty)  $default,) {final _that = this;
switch (_that) {
case _RoleAssignment():
return $default(_that.id,_that.roleName,_that.duty);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  Role roleName,  Duty duty)?  $default,) {final _that = this;
switch (_that) {
case _RoleAssignment() when $default != null:
return $default(_that.id,_that.roleName,_that.duty);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoleAssignment implements RoleAssignment {
  const _RoleAssignment({required this.id, required this.roleName, required this.duty});
  factory _RoleAssignment.fromJson(Map<String, dynamic> json) => _$RoleAssignmentFromJson(json);

@override final  int id;
@override final  Role roleName;
@override final  Duty duty;

/// Create a copy of RoleAssignment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoleAssignmentCopyWith<_RoleAssignment> get copyWith => __$RoleAssignmentCopyWithImpl<_RoleAssignment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoleAssignmentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoleAssignment&&(identical(other.id, id) || other.id == id)&&(identical(other.roleName, roleName) || other.roleName == roleName)&&(identical(other.duty, duty) || other.duty == duty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,roleName,duty);

@override
String toString() {
  return 'RoleAssignment(id: $id, roleName: $roleName, duty: $duty)';
}


}

/// @nodoc
abstract mixin class _$RoleAssignmentCopyWith<$Res> implements $RoleAssignmentCopyWith<$Res> {
  factory _$RoleAssignmentCopyWith(_RoleAssignment value, $Res Function(_RoleAssignment) _then) = __$RoleAssignmentCopyWithImpl;
@override @useResult
$Res call({
 int id, Role roleName, Duty duty
});




}
/// @nodoc
class __$RoleAssignmentCopyWithImpl<$Res>
    implements _$RoleAssignmentCopyWith<$Res> {
  __$RoleAssignmentCopyWithImpl(this._self, this._then);

  final _RoleAssignment _self;
  final $Res Function(_RoleAssignment) _then;

/// Create a copy of RoleAssignment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? roleName = null,Object? duty = null,}) {
  return _then(_RoleAssignment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,roleName: null == roleName ? _self.roleName : roleName // ignore: cast_nullable_to_non_nullable
as Role,duty: null == duty ? _self.duty : duty // ignore: cast_nullable_to_non_nullable
as Duty,
  ));
}


}

// dart format on
