// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'formation_slot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FormationSlot {

 int get id; String get slotId; String get baseZone; String get line; String get lateralBand; String get verticalBand; List<Position> get preferredPositions; List<String> get adjacencySlots; List<String> get supportLinks; List<String> get attackingLaneAccess; List<String> get defensiveResponsibility;
/// Create a copy of FormationSlot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FormationSlotCopyWith<FormationSlot> get copyWith => _$FormationSlotCopyWithImpl<FormationSlot>(this as FormationSlot, _$identity);

  /// Serializes this FormationSlot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FormationSlot&&(identical(other.id, id) || other.id == id)&&(identical(other.slotId, slotId) || other.slotId == slotId)&&(identical(other.baseZone, baseZone) || other.baseZone == baseZone)&&(identical(other.line, line) || other.line == line)&&(identical(other.lateralBand, lateralBand) || other.lateralBand == lateralBand)&&(identical(other.verticalBand, verticalBand) || other.verticalBand == verticalBand)&&const DeepCollectionEquality().equals(other.preferredPositions, preferredPositions)&&const DeepCollectionEquality().equals(other.adjacencySlots, adjacencySlots)&&const DeepCollectionEquality().equals(other.supportLinks, supportLinks)&&const DeepCollectionEquality().equals(other.attackingLaneAccess, attackingLaneAccess)&&const DeepCollectionEquality().equals(other.defensiveResponsibility, defensiveResponsibility));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slotId,baseZone,line,lateralBand,verticalBand,const DeepCollectionEquality().hash(preferredPositions),const DeepCollectionEquality().hash(adjacencySlots),const DeepCollectionEquality().hash(supportLinks),const DeepCollectionEquality().hash(attackingLaneAccess),const DeepCollectionEquality().hash(defensiveResponsibility));

@override
String toString() {
  return 'FormationSlot(id: $id, slotId: $slotId, baseZone: $baseZone, line: $line, lateralBand: $lateralBand, verticalBand: $verticalBand, preferredPositions: $preferredPositions, adjacencySlots: $adjacencySlots, supportLinks: $supportLinks, attackingLaneAccess: $attackingLaneAccess, defensiveResponsibility: $defensiveResponsibility)';
}


}

/// @nodoc
abstract mixin class $FormationSlotCopyWith<$Res>  {
  factory $FormationSlotCopyWith(FormationSlot value, $Res Function(FormationSlot) _then) = _$FormationSlotCopyWithImpl;
@useResult
$Res call({
 int id, String slotId, String baseZone, String line, String lateralBand, String verticalBand, List<Position> preferredPositions, List<String> adjacencySlots, List<String> supportLinks, List<String> attackingLaneAccess, List<String> defensiveResponsibility
});




}
/// @nodoc
class _$FormationSlotCopyWithImpl<$Res>
    implements $FormationSlotCopyWith<$Res> {
  _$FormationSlotCopyWithImpl(this._self, this._then);

  final FormationSlot _self;
  final $Res Function(FormationSlot) _then;

/// Create a copy of FormationSlot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? slotId = null,Object? baseZone = null,Object? line = null,Object? lateralBand = null,Object? verticalBand = null,Object? preferredPositions = null,Object? adjacencySlots = null,Object? supportLinks = null,Object? attackingLaneAccess = null,Object? defensiveResponsibility = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,slotId: null == slotId ? _self.slotId : slotId // ignore: cast_nullable_to_non_nullable
as String,baseZone: null == baseZone ? _self.baseZone : baseZone // ignore: cast_nullable_to_non_nullable
as String,line: null == line ? _self.line : line // ignore: cast_nullable_to_non_nullable
as String,lateralBand: null == lateralBand ? _self.lateralBand : lateralBand // ignore: cast_nullable_to_non_nullable
as String,verticalBand: null == verticalBand ? _self.verticalBand : verticalBand // ignore: cast_nullable_to_non_nullable
as String,preferredPositions: null == preferredPositions ? _self.preferredPositions : preferredPositions // ignore: cast_nullable_to_non_nullable
as List<Position>,adjacencySlots: null == adjacencySlots ? _self.adjacencySlots : adjacencySlots // ignore: cast_nullable_to_non_nullable
as List<String>,supportLinks: null == supportLinks ? _self.supportLinks : supportLinks // ignore: cast_nullable_to_non_nullable
as List<String>,attackingLaneAccess: null == attackingLaneAccess ? _self.attackingLaneAccess : attackingLaneAccess // ignore: cast_nullable_to_non_nullable
as List<String>,defensiveResponsibility: null == defensiveResponsibility ? _self.defensiveResponsibility : defensiveResponsibility // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [FormationSlot].
extension FormationSlotPatterns on FormationSlot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FormationSlot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FormationSlot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FormationSlot value)  $default,){
final _that = this;
switch (_that) {
case _FormationSlot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FormationSlot value)?  $default,){
final _that = this;
switch (_that) {
case _FormationSlot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String slotId,  String baseZone,  String line,  String lateralBand,  String verticalBand,  List<Position> preferredPositions,  List<String> adjacencySlots,  List<String> supportLinks,  List<String> attackingLaneAccess,  List<String> defensiveResponsibility)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FormationSlot() when $default != null:
return $default(_that.id,_that.slotId,_that.baseZone,_that.line,_that.lateralBand,_that.verticalBand,_that.preferredPositions,_that.adjacencySlots,_that.supportLinks,_that.attackingLaneAccess,_that.defensiveResponsibility);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String slotId,  String baseZone,  String line,  String lateralBand,  String verticalBand,  List<Position> preferredPositions,  List<String> adjacencySlots,  List<String> supportLinks,  List<String> attackingLaneAccess,  List<String> defensiveResponsibility)  $default,) {final _that = this;
switch (_that) {
case _FormationSlot():
return $default(_that.id,_that.slotId,_that.baseZone,_that.line,_that.lateralBand,_that.verticalBand,_that.preferredPositions,_that.adjacencySlots,_that.supportLinks,_that.attackingLaneAccess,_that.defensiveResponsibility);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String slotId,  String baseZone,  String line,  String lateralBand,  String verticalBand,  List<Position> preferredPositions,  List<String> adjacencySlots,  List<String> supportLinks,  List<String> attackingLaneAccess,  List<String> defensiveResponsibility)?  $default,) {final _that = this;
switch (_that) {
case _FormationSlot() when $default != null:
return $default(_that.id,_that.slotId,_that.baseZone,_that.line,_that.lateralBand,_that.verticalBand,_that.preferredPositions,_that.adjacencySlots,_that.supportLinks,_that.attackingLaneAccess,_that.defensiveResponsibility);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FormationSlot implements FormationSlot {
  const _FormationSlot({required this.id, required this.slotId, required this.baseZone, required this.line, required this.lateralBand, required this.verticalBand, final  List<Position> preferredPositions = const [], final  List<String> adjacencySlots = const [], final  List<String> supportLinks = const [], final  List<String> attackingLaneAccess = const [], final  List<String> defensiveResponsibility = const []}): _preferredPositions = preferredPositions,_adjacencySlots = adjacencySlots,_supportLinks = supportLinks,_attackingLaneAccess = attackingLaneAccess,_defensiveResponsibility = defensiveResponsibility;
  factory _FormationSlot.fromJson(Map<String, dynamic> json) => _$FormationSlotFromJson(json);

@override final  int id;
@override final  String slotId;
@override final  String baseZone;
@override final  String line;
@override final  String lateralBand;
@override final  String verticalBand;
 final  List<Position> _preferredPositions;
@override@JsonKey() List<Position> get preferredPositions {
  if (_preferredPositions is EqualUnmodifiableListView) return _preferredPositions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_preferredPositions);
}

 final  List<String> _adjacencySlots;
@override@JsonKey() List<String> get adjacencySlots {
  if (_adjacencySlots is EqualUnmodifiableListView) return _adjacencySlots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_adjacencySlots);
}

 final  List<String> _supportLinks;
@override@JsonKey() List<String> get supportLinks {
  if (_supportLinks is EqualUnmodifiableListView) return _supportLinks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_supportLinks);
}

 final  List<String> _attackingLaneAccess;
@override@JsonKey() List<String> get attackingLaneAccess {
  if (_attackingLaneAccess is EqualUnmodifiableListView) return _attackingLaneAccess;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attackingLaneAccess);
}

 final  List<String> _defensiveResponsibility;
@override@JsonKey() List<String> get defensiveResponsibility {
  if (_defensiveResponsibility is EqualUnmodifiableListView) return _defensiveResponsibility;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_defensiveResponsibility);
}


/// Create a copy of FormationSlot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FormationSlotCopyWith<_FormationSlot> get copyWith => __$FormationSlotCopyWithImpl<_FormationSlot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FormationSlotToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FormationSlot&&(identical(other.id, id) || other.id == id)&&(identical(other.slotId, slotId) || other.slotId == slotId)&&(identical(other.baseZone, baseZone) || other.baseZone == baseZone)&&(identical(other.line, line) || other.line == line)&&(identical(other.lateralBand, lateralBand) || other.lateralBand == lateralBand)&&(identical(other.verticalBand, verticalBand) || other.verticalBand == verticalBand)&&const DeepCollectionEquality().equals(other._preferredPositions, _preferredPositions)&&const DeepCollectionEquality().equals(other._adjacencySlots, _adjacencySlots)&&const DeepCollectionEquality().equals(other._supportLinks, _supportLinks)&&const DeepCollectionEquality().equals(other._attackingLaneAccess, _attackingLaneAccess)&&const DeepCollectionEquality().equals(other._defensiveResponsibility, _defensiveResponsibility));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slotId,baseZone,line,lateralBand,verticalBand,const DeepCollectionEquality().hash(_preferredPositions),const DeepCollectionEquality().hash(_adjacencySlots),const DeepCollectionEquality().hash(_supportLinks),const DeepCollectionEquality().hash(_attackingLaneAccess),const DeepCollectionEquality().hash(_defensiveResponsibility));

@override
String toString() {
  return 'FormationSlot(id: $id, slotId: $slotId, baseZone: $baseZone, line: $line, lateralBand: $lateralBand, verticalBand: $verticalBand, preferredPositions: $preferredPositions, adjacencySlots: $adjacencySlots, supportLinks: $supportLinks, attackingLaneAccess: $attackingLaneAccess, defensiveResponsibility: $defensiveResponsibility)';
}


}

/// @nodoc
abstract mixin class _$FormationSlotCopyWith<$Res> implements $FormationSlotCopyWith<$Res> {
  factory _$FormationSlotCopyWith(_FormationSlot value, $Res Function(_FormationSlot) _then) = __$FormationSlotCopyWithImpl;
@override @useResult
$Res call({
 int id, String slotId, String baseZone, String line, String lateralBand, String verticalBand, List<Position> preferredPositions, List<String> adjacencySlots, List<String> supportLinks, List<String> attackingLaneAccess, List<String> defensiveResponsibility
});




}
/// @nodoc
class __$FormationSlotCopyWithImpl<$Res>
    implements _$FormationSlotCopyWith<$Res> {
  __$FormationSlotCopyWithImpl(this._self, this._then);

  final _FormationSlot _self;
  final $Res Function(_FormationSlot) _then;

/// Create a copy of FormationSlot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? slotId = null,Object? baseZone = null,Object? line = null,Object? lateralBand = null,Object? verticalBand = null,Object? preferredPositions = null,Object? adjacencySlots = null,Object? supportLinks = null,Object? attackingLaneAccess = null,Object? defensiveResponsibility = null,}) {
  return _then(_FormationSlot(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,slotId: null == slotId ? _self.slotId : slotId // ignore: cast_nullable_to_non_nullable
as String,baseZone: null == baseZone ? _self.baseZone : baseZone // ignore: cast_nullable_to_non_nullable
as String,line: null == line ? _self.line : line // ignore: cast_nullable_to_non_nullable
as String,lateralBand: null == lateralBand ? _self.lateralBand : lateralBand // ignore: cast_nullable_to_non_nullable
as String,verticalBand: null == verticalBand ? _self.verticalBand : verticalBand // ignore: cast_nullable_to_non_nullable
as String,preferredPositions: null == preferredPositions ? _self._preferredPositions : preferredPositions // ignore: cast_nullable_to_non_nullable
as List<Position>,adjacencySlots: null == adjacencySlots ? _self._adjacencySlots : adjacencySlots // ignore: cast_nullable_to_non_nullable
as List<String>,supportLinks: null == supportLinks ? _self._supportLinks : supportLinks // ignore: cast_nullable_to_non_nullable
as List<String>,attackingLaneAccess: null == attackingLaneAccess ? _self._attackingLaneAccess : attackingLaneAccess // ignore: cast_nullable_to_non_nullable
as List<String>,defensiveResponsibility: null == defensiveResponsibility ? _self._defensiveResponsibility : defensiveResponsibility // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
