// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'team.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Team {

 int get id; String get name; TeamTactic get tactic; TeamLineup get lineup;// Hex color values. All three colors are required.
 String get primaryColor; String get secondaryColor; String get tertiaryColor; List<Player> get squad;
/// Create a copy of Team
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeamCopyWith<Team> get copyWith => _$TeamCopyWithImpl<Team>(this as Team, _$identity);

  /// Serializes this Team to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Team&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.tactic, tactic) || other.tactic == tactic)&&(identical(other.lineup, lineup) || other.lineup == lineup)&&(identical(other.primaryColor, primaryColor) || other.primaryColor == primaryColor)&&(identical(other.secondaryColor, secondaryColor) || other.secondaryColor == secondaryColor)&&(identical(other.tertiaryColor, tertiaryColor) || other.tertiaryColor == tertiaryColor)&&const DeepCollectionEquality().equals(other.squad, squad));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,tactic,lineup,primaryColor,secondaryColor,tertiaryColor,const DeepCollectionEquality().hash(squad));

@override
String toString() {
  return 'Team(id: $id, name: $name, tactic: $tactic, lineup: $lineup, primaryColor: $primaryColor, secondaryColor: $secondaryColor, tertiaryColor: $tertiaryColor, squad: $squad)';
}


}

/// @nodoc
abstract mixin class $TeamCopyWith<$Res>  {
  factory $TeamCopyWith(Team value, $Res Function(Team) _then) = _$TeamCopyWithImpl;
@useResult
$Res call({
 int id, String name, TeamTactic tactic, TeamLineup lineup, String primaryColor, String secondaryColor, String tertiaryColor, List<Player> squad
});


$TeamTacticCopyWith<$Res> get tactic;$TeamLineupCopyWith<$Res> get lineup;

}
/// @nodoc
class _$TeamCopyWithImpl<$Res>
    implements $TeamCopyWith<$Res> {
  _$TeamCopyWithImpl(this._self, this._then);

  final Team _self;
  final $Res Function(Team) _then;

/// Create a copy of Team
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? tactic = null,Object? lineup = null,Object? primaryColor = null,Object? secondaryColor = null,Object? tertiaryColor = null,Object? squad = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,tactic: null == tactic ? _self.tactic : tactic // ignore: cast_nullable_to_non_nullable
as TeamTactic,lineup: null == lineup ? _self.lineup : lineup // ignore: cast_nullable_to_non_nullable
as TeamLineup,primaryColor: null == primaryColor ? _self.primaryColor : primaryColor // ignore: cast_nullable_to_non_nullable
as String,secondaryColor: null == secondaryColor ? _self.secondaryColor : secondaryColor // ignore: cast_nullable_to_non_nullable
as String,tertiaryColor: null == tertiaryColor ? _self.tertiaryColor : tertiaryColor // ignore: cast_nullable_to_non_nullable
as String,squad: null == squad ? _self.squad : squad // ignore: cast_nullable_to_non_nullable
as List<Player>,
  ));
}
/// Create a copy of Team
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamTacticCopyWith<$Res> get tactic {
  
  return $TeamTacticCopyWith<$Res>(_self.tactic, (value) {
    return _then(_self.copyWith(tactic: value));
  });
}/// Create a copy of Team
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamLineupCopyWith<$Res> get lineup {
  
  return $TeamLineupCopyWith<$Res>(_self.lineup, (value) {
    return _then(_self.copyWith(lineup: value));
  });
}
}


/// Adds pattern-matching-related methods to [Team].
extension TeamPatterns on Team {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Team value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Team() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Team value)  $default,){
final _that = this;
switch (_that) {
case _Team():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Team value)?  $default,){
final _that = this;
switch (_that) {
case _Team() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  TeamTactic tactic,  TeamLineup lineup,  String primaryColor,  String secondaryColor,  String tertiaryColor,  List<Player> squad)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Team() when $default != null:
return $default(_that.id,_that.name,_that.tactic,_that.lineup,_that.primaryColor,_that.secondaryColor,_that.tertiaryColor,_that.squad);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  TeamTactic tactic,  TeamLineup lineup,  String primaryColor,  String secondaryColor,  String tertiaryColor,  List<Player> squad)  $default,) {final _that = this;
switch (_that) {
case _Team():
return $default(_that.id,_that.name,_that.tactic,_that.lineup,_that.primaryColor,_that.secondaryColor,_that.tertiaryColor,_that.squad);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  TeamTactic tactic,  TeamLineup lineup,  String primaryColor,  String secondaryColor,  String tertiaryColor,  List<Player> squad)?  $default,) {final _that = this;
switch (_that) {
case _Team() when $default != null:
return $default(_that.id,_that.name,_that.tactic,_that.lineup,_that.primaryColor,_that.secondaryColor,_that.tertiaryColor,_that.squad);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Team extends Team {
  const _Team({required this.id, required this.name, required this.tactic, required this.lineup, required this.primaryColor, required this.secondaryColor, required this.tertiaryColor, final  List<Player> squad = const []}): _squad = squad,super._();
  factory _Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);

@override final  int id;
@override final  String name;
@override final  TeamTactic tactic;
@override final  TeamLineup lineup;
// Hex color values. All three colors are required.
@override final  String primaryColor;
@override final  String secondaryColor;
@override final  String tertiaryColor;
 final  List<Player> _squad;
@override@JsonKey() List<Player> get squad {
  if (_squad is EqualUnmodifiableListView) return _squad;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_squad);
}


/// Create a copy of Team
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeamCopyWith<_Team> get copyWith => __$TeamCopyWithImpl<_Team>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeamToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Team&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.tactic, tactic) || other.tactic == tactic)&&(identical(other.lineup, lineup) || other.lineup == lineup)&&(identical(other.primaryColor, primaryColor) || other.primaryColor == primaryColor)&&(identical(other.secondaryColor, secondaryColor) || other.secondaryColor == secondaryColor)&&(identical(other.tertiaryColor, tertiaryColor) || other.tertiaryColor == tertiaryColor)&&const DeepCollectionEquality().equals(other._squad, _squad));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,tactic,lineup,primaryColor,secondaryColor,tertiaryColor,const DeepCollectionEquality().hash(_squad));

@override
String toString() {
  return 'Team(id: $id, name: $name, tactic: $tactic, lineup: $lineup, primaryColor: $primaryColor, secondaryColor: $secondaryColor, tertiaryColor: $tertiaryColor, squad: $squad)';
}


}

/// @nodoc
abstract mixin class _$TeamCopyWith<$Res> implements $TeamCopyWith<$Res> {
  factory _$TeamCopyWith(_Team value, $Res Function(_Team) _then) = __$TeamCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, TeamTactic tactic, TeamLineup lineup, String primaryColor, String secondaryColor, String tertiaryColor, List<Player> squad
});


@override $TeamTacticCopyWith<$Res> get tactic;@override $TeamLineupCopyWith<$Res> get lineup;

}
/// @nodoc
class __$TeamCopyWithImpl<$Res>
    implements _$TeamCopyWith<$Res> {
  __$TeamCopyWithImpl(this._self, this._then);

  final _Team _self;
  final $Res Function(_Team) _then;

/// Create a copy of Team
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? tactic = null,Object? lineup = null,Object? primaryColor = null,Object? secondaryColor = null,Object? tertiaryColor = null,Object? squad = null,}) {
  return _then(_Team(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,tactic: null == tactic ? _self.tactic : tactic // ignore: cast_nullable_to_non_nullable
as TeamTactic,lineup: null == lineup ? _self.lineup : lineup // ignore: cast_nullable_to_non_nullable
as TeamLineup,primaryColor: null == primaryColor ? _self.primaryColor : primaryColor // ignore: cast_nullable_to_non_nullable
as String,secondaryColor: null == secondaryColor ? _self.secondaryColor : secondaryColor // ignore: cast_nullable_to_non_nullable
as String,tertiaryColor: null == tertiaryColor ? _self.tertiaryColor : tertiaryColor // ignore: cast_nullable_to_non_nullable
as String,squad: null == squad ? _self._squad : squad // ignore: cast_nullable_to_non_nullable
as List<Player>,
  ));
}

/// Create a copy of Team
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamTacticCopyWith<$Res> get tactic {
  
  return $TeamTacticCopyWith<$Res>(_self.tactic, (value) {
    return _then(_self.copyWith(tactic: value));
  });
}/// Create a copy of Team
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamLineupCopyWith<$Res> get lineup {
  
  return $TeamLineupCopyWith<$Res>(_self.lineup, (value) {
    return _then(_self.copyWith(lineup: value));
  });
}
}

// dart format on
