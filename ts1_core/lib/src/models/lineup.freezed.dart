// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lineup.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Lineup {

 int get id; FormationShape get formation; List<LineupSlotAssignment> get slotAssignments; List<Player> get bench; List<Player> get reserves; Player? get captain;
/// Create a copy of Lineup
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LineupCopyWith<Lineup> get copyWith => _$LineupCopyWithImpl<Lineup>(this as Lineup, _$identity);

  /// Serializes this Lineup to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Lineup&&(identical(other.id, id) || other.id == id)&&(identical(other.formation, formation) || other.formation == formation)&&const DeepCollectionEquality().equals(other.slotAssignments, slotAssignments)&&const DeepCollectionEquality().equals(other.bench, bench)&&const DeepCollectionEquality().equals(other.reserves, reserves)&&(identical(other.captain, captain) || other.captain == captain));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,formation,const DeepCollectionEquality().hash(slotAssignments),const DeepCollectionEquality().hash(bench),const DeepCollectionEquality().hash(reserves),captain);

@override
String toString() {
  return 'Lineup(id: $id, formation: $formation, slotAssignments: $slotAssignments, bench: $bench, reserves: $reserves, captain: $captain)';
}


}

/// @nodoc
abstract mixin class $LineupCopyWith<$Res>  {
  factory $LineupCopyWith(Lineup value, $Res Function(Lineup) _then) = _$LineupCopyWithImpl;
@useResult
$Res call({
 int id, FormationShape formation, List<LineupSlotAssignment> slotAssignments, List<Player> bench, List<Player> reserves, Player? captain
});


$FormationShapeCopyWith<$Res> get formation;$PlayerCopyWith<$Res>? get captain;

}
/// @nodoc
class _$LineupCopyWithImpl<$Res>
    implements $LineupCopyWith<$Res> {
  _$LineupCopyWithImpl(this._self, this._then);

  final Lineup _self;
  final $Res Function(Lineup) _then;

/// Create a copy of Lineup
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? formation = null,Object? slotAssignments = null,Object? bench = null,Object? reserves = null,Object? captain = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,formation: null == formation ? _self.formation : formation // ignore: cast_nullable_to_non_nullable
as FormationShape,slotAssignments: null == slotAssignments ? _self.slotAssignments : slotAssignments // ignore: cast_nullable_to_non_nullable
as List<LineupSlotAssignment>,bench: null == bench ? _self.bench : bench // ignore: cast_nullable_to_non_nullable
as List<Player>,reserves: null == reserves ? _self.reserves : reserves // ignore: cast_nullable_to_non_nullable
as List<Player>,captain: freezed == captain ? _self.captain : captain // ignore: cast_nullable_to_non_nullable
as Player?,
  ));
}
/// Create a copy of Lineup
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FormationShapeCopyWith<$Res> get formation {
  
  return $FormationShapeCopyWith<$Res>(_self.formation, (value) {
    return _then(_self.copyWith(formation: value));
  });
}/// Create a copy of Lineup
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerCopyWith<$Res>? get captain {
    if (_self.captain == null) {
    return null;
  }

  return $PlayerCopyWith<$Res>(_self.captain!, (value) {
    return _then(_self.copyWith(captain: value));
  });
}
}


/// Adds pattern-matching-related methods to [Lineup].
extension LineupPatterns on Lineup {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Lineup value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Lineup() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Lineup value)  $default,){
final _that = this;
switch (_that) {
case _Lineup():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Lineup value)?  $default,){
final _that = this;
switch (_that) {
case _Lineup() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  FormationShape formation,  List<LineupSlotAssignment> slotAssignments,  List<Player> bench,  List<Player> reserves,  Player? captain)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Lineup() when $default != null:
return $default(_that.id,_that.formation,_that.slotAssignments,_that.bench,_that.reserves,_that.captain);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  FormationShape formation,  List<LineupSlotAssignment> slotAssignments,  List<Player> bench,  List<Player> reserves,  Player? captain)  $default,) {final _that = this;
switch (_that) {
case _Lineup():
return $default(_that.id,_that.formation,_that.slotAssignments,_that.bench,_that.reserves,_that.captain);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  FormationShape formation,  List<LineupSlotAssignment> slotAssignments,  List<Player> bench,  List<Player> reserves,  Player? captain)?  $default,) {final _that = this;
switch (_that) {
case _Lineup() when $default != null:
return $default(_that.id,_that.formation,_that.slotAssignments,_that.bench,_that.reserves,_that.captain);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Lineup extends Lineup {
  const _Lineup({required this.id, required this.formation, final  List<LineupSlotAssignment> slotAssignments = const [], final  List<Player> bench = const [], final  List<Player> reserves = const [], this.captain}): _slotAssignments = slotAssignments,_bench = bench,_reserves = reserves,super._();
  factory _Lineup.fromJson(Map<String, dynamic> json) => _$LineupFromJson(json);

@override final  int id;
@override final  FormationShape formation;
 final  List<LineupSlotAssignment> _slotAssignments;
@override@JsonKey() List<LineupSlotAssignment> get slotAssignments {
  if (_slotAssignments is EqualUnmodifiableListView) return _slotAssignments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_slotAssignments);
}

 final  List<Player> _bench;
@override@JsonKey() List<Player> get bench {
  if (_bench is EqualUnmodifiableListView) return _bench;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bench);
}

 final  List<Player> _reserves;
@override@JsonKey() List<Player> get reserves {
  if (_reserves is EqualUnmodifiableListView) return _reserves;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reserves);
}

@override final  Player? captain;

/// Create a copy of Lineup
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LineupCopyWith<_Lineup> get copyWith => __$LineupCopyWithImpl<_Lineup>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LineupToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Lineup&&(identical(other.id, id) || other.id == id)&&(identical(other.formation, formation) || other.formation == formation)&&const DeepCollectionEquality().equals(other._slotAssignments, _slotAssignments)&&const DeepCollectionEquality().equals(other._bench, _bench)&&const DeepCollectionEquality().equals(other._reserves, _reserves)&&(identical(other.captain, captain) || other.captain == captain));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,formation,const DeepCollectionEquality().hash(_slotAssignments),const DeepCollectionEquality().hash(_bench),const DeepCollectionEquality().hash(_reserves),captain);

@override
String toString() {
  return 'Lineup(id: $id, formation: $formation, slotAssignments: $slotAssignments, bench: $bench, reserves: $reserves, captain: $captain)';
}


}

/// @nodoc
abstract mixin class _$LineupCopyWith<$Res> implements $LineupCopyWith<$Res> {
  factory _$LineupCopyWith(_Lineup value, $Res Function(_Lineup) _then) = __$LineupCopyWithImpl;
@override @useResult
$Res call({
 int id, FormationShape formation, List<LineupSlotAssignment> slotAssignments, List<Player> bench, List<Player> reserves, Player? captain
});


@override $FormationShapeCopyWith<$Res> get formation;@override $PlayerCopyWith<$Res>? get captain;

}
/// @nodoc
class __$LineupCopyWithImpl<$Res>
    implements _$LineupCopyWith<$Res> {
  __$LineupCopyWithImpl(this._self, this._then);

  final _Lineup _self;
  final $Res Function(_Lineup) _then;

/// Create a copy of Lineup
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? formation = null,Object? slotAssignments = null,Object? bench = null,Object? reserves = null,Object? captain = freezed,}) {
  return _then(_Lineup(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,formation: null == formation ? _self.formation : formation // ignore: cast_nullable_to_non_nullable
as FormationShape,slotAssignments: null == slotAssignments ? _self._slotAssignments : slotAssignments // ignore: cast_nullable_to_non_nullable
as List<LineupSlotAssignment>,bench: null == bench ? _self._bench : bench // ignore: cast_nullable_to_non_nullable
as List<Player>,reserves: null == reserves ? _self._reserves : reserves // ignore: cast_nullable_to_non_nullable
as List<Player>,captain: freezed == captain ? _self.captain : captain // ignore: cast_nullable_to_non_nullable
as Player?,
  ));
}

/// Create a copy of Lineup
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FormationShapeCopyWith<$Res> get formation {
  
  return $FormationShapeCopyWith<$Res>(_self.formation, (value) {
    return _then(_self.copyWith(formation: value));
  });
}/// Create a copy of Lineup
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerCopyWith<$Res>? get captain {
    if (_self.captain == null) {
    return null;
  }

  return $PlayerCopyWith<$Res>(_self.captain!, (value) {
    return _then(_self.copyWith(captain: value));
  });
}
}

// dart format on
