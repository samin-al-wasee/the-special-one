// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'substitution_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubstitutionRecord {

 int get minute; TeamSide get teamSide; int get playerOutId; int get playerInId; SubstitutionType get type; String? get reason;
/// Create a copy of SubstitutionRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubstitutionRecordCopyWith<SubstitutionRecord> get copyWith => _$SubstitutionRecordCopyWithImpl<SubstitutionRecord>(this as SubstitutionRecord, _$identity);

  /// Serializes this SubstitutionRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubstitutionRecord&&(identical(other.minute, minute) || other.minute == minute)&&(identical(other.teamSide, teamSide) || other.teamSide == teamSide)&&(identical(other.playerOutId, playerOutId) || other.playerOutId == playerOutId)&&(identical(other.playerInId, playerInId) || other.playerInId == playerInId)&&(identical(other.type, type) || other.type == type)&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,minute,teamSide,playerOutId,playerInId,type,reason);

@override
String toString() {
  return 'SubstitutionRecord(minute: $minute, teamSide: $teamSide, playerOutId: $playerOutId, playerInId: $playerInId, type: $type, reason: $reason)';
}


}

/// @nodoc
abstract mixin class $SubstitutionRecordCopyWith<$Res>  {
  factory $SubstitutionRecordCopyWith(SubstitutionRecord value, $Res Function(SubstitutionRecord) _then) = _$SubstitutionRecordCopyWithImpl;
@useResult
$Res call({
 int minute, TeamSide teamSide, int playerOutId, int playerInId, SubstitutionType type, String? reason
});




}
/// @nodoc
class _$SubstitutionRecordCopyWithImpl<$Res>
    implements $SubstitutionRecordCopyWith<$Res> {
  _$SubstitutionRecordCopyWithImpl(this._self, this._then);

  final SubstitutionRecord _self;
  final $Res Function(SubstitutionRecord) _then;

/// Create a copy of SubstitutionRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? minute = null,Object? teamSide = null,Object? playerOutId = null,Object? playerInId = null,Object? type = null,Object? reason = freezed,}) {
  return _then(_self.copyWith(
minute: null == minute ? _self.minute : minute // ignore: cast_nullable_to_non_nullable
as int,teamSide: null == teamSide ? _self.teamSide : teamSide // ignore: cast_nullable_to_non_nullable
as TeamSide,playerOutId: null == playerOutId ? _self.playerOutId : playerOutId // ignore: cast_nullable_to_non_nullable
as int,playerInId: null == playerInId ? _self.playerInId : playerInId // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as SubstitutionType,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SubstitutionRecord].
extension SubstitutionRecordPatterns on SubstitutionRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubstitutionRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubstitutionRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubstitutionRecord value)  $default,){
final _that = this;
switch (_that) {
case _SubstitutionRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubstitutionRecord value)?  $default,){
final _that = this;
switch (_that) {
case _SubstitutionRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int minute,  TeamSide teamSide,  int playerOutId,  int playerInId,  SubstitutionType type,  String? reason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubstitutionRecord() when $default != null:
return $default(_that.minute,_that.teamSide,_that.playerOutId,_that.playerInId,_that.type,_that.reason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int minute,  TeamSide teamSide,  int playerOutId,  int playerInId,  SubstitutionType type,  String? reason)  $default,) {final _that = this;
switch (_that) {
case _SubstitutionRecord():
return $default(_that.minute,_that.teamSide,_that.playerOutId,_that.playerInId,_that.type,_that.reason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int minute,  TeamSide teamSide,  int playerOutId,  int playerInId,  SubstitutionType type,  String? reason)?  $default,) {final _that = this;
switch (_that) {
case _SubstitutionRecord() when $default != null:
return $default(_that.minute,_that.teamSide,_that.playerOutId,_that.playerInId,_that.type,_that.reason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubstitutionRecord extends SubstitutionRecord {
  const _SubstitutionRecord({required this.minute, required this.teamSide, required this.playerOutId, required this.playerInId, required this.type, this.reason}): super._();
  factory _SubstitutionRecord.fromJson(Map<String, dynamic> json) => _$SubstitutionRecordFromJson(json);

@override final  int minute;
@override final  TeamSide teamSide;
@override final  int playerOutId;
@override final  int playerInId;
@override final  SubstitutionType type;
@override final  String? reason;

/// Create a copy of SubstitutionRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubstitutionRecordCopyWith<_SubstitutionRecord> get copyWith => __$SubstitutionRecordCopyWithImpl<_SubstitutionRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubstitutionRecordToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubstitutionRecord&&(identical(other.minute, minute) || other.minute == minute)&&(identical(other.teamSide, teamSide) || other.teamSide == teamSide)&&(identical(other.playerOutId, playerOutId) || other.playerOutId == playerOutId)&&(identical(other.playerInId, playerInId) || other.playerInId == playerInId)&&(identical(other.type, type) || other.type == type)&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,minute,teamSide,playerOutId,playerInId,type,reason);

@override
String toString() {
  return 'SubstitutionRecord(minute: $minute, teamSide: $teamSide, playerOutId: $playerOutId, playerInId: $playerInId, type: $type, reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$SubstitutionRecordCopyWith<$Res> implements $SubstitutionRecordCopyWith<$Res> {
  factory _$SubstitutionRecordCopyWith(_SubstitutionRecord value, $Res Function(_SubstitutionRecord) _then) = __$SubstitutionRecordCopyWithImpl;
@override @useResult
$Res call({
 int minute, TeamSide teamSide, int playerOutId, int playerInId, SubstitutionType type, String? reason
});




}
/// @nodoc
class __$SubstitutionRecordCopyWithImpl<$Res>
    implements _$SubstitutionRecordCopyWith<$Res> {
  __$SubstitutionRecordCopyWithImpl(this._self, this._then);

  final _SubstitutionRecord _self;
  final $Res Function(_SubstitutionRecord) _then;

/// Create a copy of SubstitutionRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? minute = null,Object? teamSide = null,Object? playerOutId = null,Object? playerInId = null,Object? type = null,Object? reason = freezed,}) {
  return _then(_SubstitutionRecord(
minute: null == minute ? _self.minute : minute // ignore: cast_nullable_to_non_nullable
as int,teamSide: null == teamSide ? _self.teamSide : teamSide // ignore: cast_nullable_to_non_nullable
as TeamSide,playerOutId: null == playerOutId ? _self.playerOutId : playerOutId // ignore: cast_nullable_to_non_nullable
as int,playerInId: null == playerInId ? _self.playerInId : playerInId // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as SubstitutionType,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
