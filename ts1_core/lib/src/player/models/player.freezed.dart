// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Player {

 int get id; String get name; DateTime get dateOfBirth; String get country; double get heightCm; double get weightKg; Position get position; Footedness get footedness; Map<TechnicalAttr, int> get technical; Map<MentalAttr, int> get mental; Map<PhysicalAttr, int> get physical; Map<HiddenAttr, int> get hidden; Map<ConditionAttr, int> get condition;
/// Create a copy of Player
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerCopyWith<Player> get copyWith => _$PlayerCopyWithImpl<Player>(this as Player, _$identity);

  /// Serializes this Player to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Player&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.country, country) || other.country == country)&&(identical(other.heightCm, heightCm) || other.heightCm == heightCm)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.position, position) || other.position == position)&&(identical(other.footedness, footedness) || other.footedness == footedness)&&const DeepCollectionEquality().equals(other.technical, technical)&&const DeepCollectionEquality().equals(other.mental, mental)&&const DeepCollectionEquality().equals(other.physical, physical)&&const DeepCollectionEquality().equals(other.hidden, hidden)&&const DeepCollectionEquality().equals(other.condition, condition));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,dateOfBirth,country,heightCm,weightKg,position,footedness,const DeepCollectionEquality().hash(technical),const DeepCollectionEquality().hash(mental),const DeepCollectionEquality().hash(physical),const DeepCollectionEquality().hash(hidden),const DeepCollectionEquality().hash(condition));

@override
String toString() {
  return 'Player(id: $id, name: $name, dateOfBirth: $dateOfBirth, country: $country, heightCm: $heightCm, weightKg: $weightKg, position: $position, footedness: $footedness, technical: $technical, mental: $mental, physical: $physical, hidden: $hidden, condition: $condition)';
}


}

/// @nodoc
abstract mixin class $PlayerCopyWith<$Res>  {
  factory $PlayerCopyWith(Player value, $Res Function(Player) _then) = _$PlayerCopyWithImpl;
@useResult
$Res call({
 int id, String name, DateTime dateOfBirth, String country, double heightCm, double weightKg, Position position, Footedness footedness, Map<TechnicalAttr, int> technical, Map<MentalAttr, int> mental, Map<PhysicalAttr, int> physical, Map<HiddenAttr, int> hidden, Map<ConditionAttr, int> condition
});




}
/// @nodoc
class _$PlayerCopyWithImpl<$Res>
    implements $PlayerCopyWith<$Res> {
  _$PlayerCopyWithImpl(this._self, this._then);

  final Player _self;
  final $Res Function(Player) _then;

/// Create a copy of Player
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? dateOfBirth = null,Object? country = null,Object? heightCm = null,Object? weightKg = null,Object? position = null,Object? footedness = null,Object? technical = null,Object? mental = null,Object? physical = null,Object? hidden = null,Object? condition = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,heightCm: null == heightCm ? _self.heightCm : heightCm // ignore: cast_nullable_to_non_nullable
as double,weightKg: null == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Position,footedness: null == footedness ? _self.footedness : footedness // ignore: cast_nullable_to_non_nullable
as Footedness,technical: null == technical ? _self.technical : technical // ignore: cast_nullable_to_non_nullable
as Map<TechnicalAttr, int>,mental: null == mental ? _self.mental : mental // ignore: cast_nullable_to_non_nullable
as Map<MentalAttr, int>,physical: null == physical ? _self.physical : physical // ignore: cast_nullable_to_non_nullable
as Map<PhysicalAttr, int>,hidden: null == hidden ? _self.hidden : hidden // ignore: cast_nullable_to_non_nullable
as Map<HiddenAttr, int>,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as Map<ConditionAttr, int>,
  ));
}

}


/// Adds pattern-matching-related methods to [Player].
extension PlayerPatterns on Player {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Player value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Player() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Player value)  $default,){
final _that = this;
switch (_that) {
case _Player():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Player value)?  $default,){
final _that = this;
switch (_that) {
case _Player() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  DateTime dateOfBirth,  String country,  double heightCm,  double weightKg,  Position position,  Footedness footedness,  Map<TechnicalAttr, int> technical,  Map<MentalAttr, int> mental,  Map<PhysicalAttr, int> physical,  Map<HiddenAttr, int> hidden,  Map<ConditionAttr, int> condition)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Player() when $default != null:
return $default(_that.id,_that.name,_that.dateOfBirth,_that.country,_that.heightCm,_that.weightKg,_that.position,_that.footedness,_that.technical,_that.mental,_that.physical,_that.hidden,_that.condition);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  DateTime dateOfBirth,  String country,  double heightCm,  double weightKg,  Position position,  Footedness footedness,  Map<TechnicalAttr, int> technical,  Map<MentalAttr, int> mental,  Map<PhysicalAttr, int> physical,  Map<HiddenAttr, int> hidden,  Map<ConditionAttr, int> condition)  $default,) {final _that = this;
switch (_that) {
case _Player():
return $default(_that.id,_that.name,_that.dateOfBirth,_that.country,_that.heightCm,_that.weightKg,_that.position,_that.footedness,_that.technical,_that.mental,_that.physical,_that.hidden,_that.condition);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  DateTime dateOfBirth,  String country,  double heightCm,  double weightKg,  Position position,  Footedness footedness,  Map<TechnicalAttr, int> technical,  Map<MentalAttr, int> mental,  Map<PhysicalAttr, int> physical,  Map<HiddenAttr, int> hidden,  Map<ConditionAttr, int> condition)?  $default,) {final _that = this;
switch (_that) {
case _Player() when $default != null:
return $default(_that.id,_that.name,_that.dateOfBirth,_that.country,_that.heightCm,_that.weightKg,_that.position,_that.footedness,_that.technical,_that.mental,_that.physical,_that.hidden,_that.condition);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Player implements Player {
  const _Player({required this.id, required this.name, required this.dateOfBirth, required this.country, required this.heightCm, required this.weightKg, required this.position, required this.footedness, final  Map<TechnicalAttr, int> technical = const {}, final  Map<MentalAttr, int> mental = const {}, final  Map<PhysicalAttr, int> physical = const {}, final  Map<HiddenAttr, int> hidden = const {}, final  Map<ConditionAttr, int> condition = const {}}): _technical = technical,_mental = mental,_physical = physical,_hidden = hidden,_condition = condition;
  factory _Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);

@override final  int id;
@override final  String name;
@override final  DateTime dateOfBirth;
@override final  String country;
@override final  double heightCm;
@override final  double weightKg;
@override final  Position position;
@override final  Footedness footedness;
 final  Map<TechnicalAttr, int> _technical;
@override@JsonKey() Map<TechnicalAttr, int> get technical {
  if (_technical is EqualUnmodifiableMapView) return _technical;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_technical);
}

 final  Map<MentalAttr, int> _mental;
@override@JsonKey() Map<MentalAttr, int> get mental {
  if (_mental is EqualUnmodifiableMapView) return _mental;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_mental);
}

 final  Map<PhysicalAttr, int> _physical;
@override@JsonKey() Map<PhysicalAttr, int> get physical {
  if (_physical is EqualUnmodifiableMapView) return _physical;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_physical);
}

 final  Map<HiddenAttr, int> _hidden;
@override@JsonKey() Map<HiddenAttr, int> get hidden {
  if (_hidden is EqualUnmodifiableMapView) return _hidden;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_hidden);
}

 final  Map<ConditionAttr, int> _condition;
@override@JsonKey() Map<ConditionAttr, int> get condition {
  if (_condition is EqualUnmodifiableMapView) return _condition;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_condition);
}


/// Create a copy of Player
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlayerCopyWith<_Player> get copyWith => __$PlayerCopyWithImpl<_Player>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlayerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Player&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.country, country) || other.country == country)&&(identical(other.heightCm, heightCm) || other.heightCm == heightCm)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.position, position) || other.position == position)&&(identical(other.footedness, footedness) || other.footedness == footedness)&&const DeepCollectionEquality().equals(other._technical, _technical)&&const DeepCollectionEquality().equals(other._mental, _mental)&&const DeepCollectionEquality().equals(other._physical, _physical)&&const DeepCollectionEquality().equals(other._hidden, _hidden)&&const DeepCollectionEquality().equals(other._condition, _condition));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,dateOfBirth,country,heightCm,weightKg,position,footedness,const DeepCollectionEquality().hash(_technical),const DeepCollectionEquality().hash(_mental),const DeepCollectionEquality().hash(_physical),const DeepCollectionEquality().hash(_hidden),const DeepCollectionEquality().hash(_condition));

@override
String toString() {
  return 'Player(id: $id, name: $name, dateOfBirth: $dateOfBirth, country: $country, heightCm: $heightCm, weightKg: $weightKg, position: $position, footedness: $footedness, technical: $technical, mental: $mental, physical: $physical, hidden: $hidden, condition: $condition)';
}


}

/// @nodoc
abstract mixin class _$PlayerCopyWith<$Res> implements $PlayerCopyWith<$Res> {
  factory _$PlayerCopyWith(_Player value, $Res Function(_Player) _then) = __$PlayerCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, DateTime dateOfBirth, String country, double heightCm, double weightKg, Position position, Footedness footedness, Map<TechnicalAttr, int> technical, Map<MentalAttr, int> mental, Map<PhysicalAttr, int> physical, Map<HiddenAttr, int> hidden, Map<ConditionAttr, int> condition
});




}
/// @nodoc
class __$PlayerCopyWithImpl<$Res>
    implements _$PlayerCopyWith<$Res> {
  __$PlayerCopyWithImpl(this._self, this._then);

  final _Player _self;
  final $Res Function(_Player) _then;

/// Create a copy of Player
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? dateOfBirth = null,Object? country = null,Object? heightCm = null,Object? weightKg = null,Object? position = null,Object? footedness = null,Object? technical = null,Object? mental = null,Object? physical = null,Object? hidden = null,Object? condition = null,}) {
  return _then(_Player(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,heightCm: null == heightCm ? _self.heightCm : heightCm // ignore: cast_nullable_to_non_nullable
as double,weightKg: null == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Position,footedness: null == footedness ? _self.footedness : footedness // ignore: cast_nullable_to_non_nullable
as Footedness,technical: null == technical ? _self._technical : technical // ignore: cast_nullable_to_non_nullable
as Map<TechnicalAttr, int>,mental: null == mental ? _self._mental : mental // ignore: cast_nullable_to_non_nullable
as Map<MentalAttr, int>,physical: null == physical ? _self._physical : physical // ignore: cast_nullable_to_non_nullable
as Map<PhysicalAttr, int>,hidden: null == hidden ? _self._hidden : hidden // ignore: cast_nullable_to_non_nullable
as Map<HiddenAttr, int>,condition: null == condition ? _self._condition : condition // ignore: cast_nullable_to_non_nullable
as Map<ConditionAttr, int>,
  ));
}


}

// dart format on
