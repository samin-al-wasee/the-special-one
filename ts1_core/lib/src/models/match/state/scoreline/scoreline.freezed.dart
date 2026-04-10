// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scoreline.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Scoreline {

 int get home; int get away;
/// Create a copy of Scoreline
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScorelineCopyWith<Scoreline> get copyWith => _$ScorelineCopyWithImpl<Scoreline>(this as Scoreline, _$identity);

  /// Serializes this Scoreline to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Scoreline&&(identical(other.home, home) || other.home == home)&&(identical(other.away, away) || other.away == away));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,home,away);



}

/// @nodoc
abstract mixin class $ScorelineCopyWith<$Res>  {
  factory $ScorelineCopyWith(Scoreline value, $Res Function(Scoreline) _then) = _$ScorelineCopyWithImpl;
@useResult
$Res call({
 int home, int away
});




}
/// @nodoc
class _$ScorelineCopyWithImpl<$Res>
    implements $ScorelineCopyWith<$Res> {
  _$ScorelineCopyWithImpl(this._self, this._then);

  final Scoreline _self;
  final $Res Function(Scoreline) _then;

/// Create a copy of Scoreline
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? home = null,Object? away = null,}) {
  return _then(_self.copyWith(
home: null == home ? _self.home : home // ignore: cast_nullable_to_non_nullable
as int,away: null == away ? _self.away : away // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Scoreline].
extension ScorelinePatterns on Scoreline {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Scoreline value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Scoreline() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Scoreline value)  $default,){
final _that = this;
switch (_that) {
case _Scoreline():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Scoreline value)?  $default,){
final _that = this;
switch (_that) {
case _Scoreline() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int home,  int away)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Scoreline() when $default != null:
return $default(_that.home,_that.away);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int home,  int away)  $default,) {final _that = this;
switch (_that) {
case _Scoreline():
return $default(_that.home,_that.away);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int home,  int away)?  $default,) {final _that = this;
switch (_that) {
case _Scoreline() when $default != null:
return $default(_that.home,_that.away);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Scoreline extends Scoreline {
  const _Scoreline({this.home = 0, this.away = 0}): super._();
  factory _Scoreline.fromJson(Map<String, dynamic> json) => _$ScorelineFromJson(json);

@override@JsonKey() final  int home;
@override@JsonKey() final  int away;

/// Create a copy of Scoreline
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScorelineCopyWith<_Scoreline> get copyWith => __$ScorelineCopyWithImpl<_Scoreline>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScorelineToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Scoreline&&(identical(other.home, home) || other.home == home)&&(identical(other.away, away) || other.away == away));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,home,away);



}

/// @nodoc
abstract mixin class _$ScorelineCopyWith<$Res> implements $ScorelineCopyWith<$Res> {
  factory _$ScorelineCopyWith(_Scoreline value, $Res Function(_Scoreline) _then) = __$ScorelineCopyWithImpl;
@override @useResult
$Res call({
 int home, int away
});




}
/// @nodoc
class __$ScorelineCopyWithImpl<$Res>
    implements _$ScorelineCopyWith<$Res> {
  __$ScorelineCopyWithImpl(this._self, this._then);

  final _Scoreline _self;
  final $Res Function(_Scoreline) _then;

/// Create a copy of Scoreline
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? home = null,Object? away = null,}) {
  return _then(_Scoreline(
home: null == home ? _self.home : home // ignore: cast_nullable_to_non_nullable
as int,away: null == away ? _self.away : away // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
