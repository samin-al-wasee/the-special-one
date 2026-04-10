// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_clock.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MatchClock {

 int get minute; int get second; int get extraTimeFirstHalf; int get extraTimeSecondHalf;
/// Create a copy of MatchClock
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchClockCopyWith<MatchClock> get copyWith => _$MatchClockCopyWithImpl<MatchClock>(this as MatchClock, _$identity);

  /// Serializes this MatchClock to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchClock&&(identical(other.minute, minute) || other.minute == minute)&&(identical(other.second, second) || other.second == second)&&(identical(other.extraTimeFirstHalf, extraTimeFirstHalf) || other.extraTimeFirstHalf == extraTimeFirstHalf)&&(identical(other.extraTimeSecondHalf, extraTimeSecondHalf) || other.extraTimeSecondHalf == extraTimeSecondHalf));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,minute,second,extraTimeFirstHalf,extraTimeSecondHalf);



}

/// @nodoc
abstract mixin class $MatchClockCopyWith<$Res>  {
  factory $MatchClockCopyWith(MatchClock value, $Res Function(MatchClock) _then) = _$MatchClockCopyWithImpl;
@useResult
$Res call({
 int minute, int second, int extraTimeFirstHalf, int extraTimeSecondHalf
});




}
/// @nodoc
class _$MatchClockCopyWithImpl<$Res>
    implements $MatchClockCopyWith<$Res> {
  _$MatchClockCopyWithImpl(this._self, this._then);

  final MatchClock _self;
  final $Res Function(MatchClock) _then;

/// Create a copy of MatchClock
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? minute = null,Object? second = null,Object? extraTimeFirstHalf = null,Object? extraTimeSecondHalf = null,}) {
  return _then(_self.copyWith(
minute: null == minute ? _self.minute : minute // ignore: cast_nullable_to_non_nullable
as int,second: null == second ? _self.second : second // ignore: cast_nullable_to_non_nullable
as int,extraTimeFirstHalf: null == extraTimeFirstHalf ? _self.extraTimeFirstHalf : extraTimeFirstHalf // ignore: cast_nullable_to_non_nullable
as int,extraTimeSecondHalf: null == extraTimeSecondHalf ? _self.extraTimeSecondHalf : extraTimeSecondHalf // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MatchClock].
extension MatchClockPatterns on MatchClock {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchClock value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchClock() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchClock value)  $default,){
final _that = this;
switch (_that) {
case _MatchClock():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchClock value)?  $default,){
final _that = this;
switch (_that) {
case _MatchClock() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int minute,  int second,  int extraTimeFirstHalf,  int extraTimeSecondHalf)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchClock() when $default != null:
return $default(_that.minute,_that.second,_that.extraTimeFirstHalf,_that.extraTimeSecondHalf);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int minute,  int second,  int extraTimeFirstHalf,  int extraTimeSecondHalf)  $default,) {final _that = this;
switch (_that) {
case _MatchClock():
return $default(_that.minute,_that.second,_that.extraTimeFirstHalf,_that.extraTimeSecondHalf);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int minute,  int second,  int extraTimeFirstHalf,  int extraTimeSecondHalf)?  $default,) {final _that = this;
switch (_that) {
case _MatchClock() when $default != null:
return $default(_that.minute,_that.second,_that.extraTimeFirstHalf,_that.extraTimeSecondHalf);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MatchClock extends MatchClock {
  const _MatchClock({this.minute = 0, this.second = 0, this.extraTimeFirstHalf = 0, this.extraTimeSecondHalf = 0}): super._();
  factory _MatchClock.fromJson(Map<String, dynamic> json) => _$MatchClockFromJson(json);

@override@JsonKey() final  int minute;
@override@JsonKey() final  int second;
@override@JsonKey() final  int extraTimeFirstHalf;
@override@JsonKey() final  int extraTimeSecondHalf;

/// Create a copy of MatchClock
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchClockCopyWith<_MatchClock> get copyWith => __$MatchClockCopyWithImpl<_MatchClock>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchClockToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchClock&&(identical(other.minute, minute) || other.minute == minute)&&(identical(other.second, second) || other.second == second)&&(identical(other.extraTimeFirstHalf, extraTimeFirstHalf) || other.extraTimeFirstHalf == extraTimeFirstHalf)&&(identical(other.extraTimeSecondHalf, extraTimeSecondHalf) || other.extraTimeSecondHalf == extraTimeSecondHalf));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,minute,second,extraTimeFirstHalf,extraTimeSecondHalf);



}

/// @nodoc
abstract mixin class _$MatchClockCopyWith<$Res> implements $MatchClockCopyWith<$Res> {
  factory _$MatchClockCopyWith(_MatchClock value, $Res Function(_MatchClock) _then) = __$MatchClockCopyWithImpl;
@override @useResult
$Res call({
 int minute, int second, int extraTimeFirstHalf, int extraTimeSecondHalf
});




}
/// @nodoc
class __$MatchClockCopyWithImpl<$Res>
    implements _$MatchClockCopyWith<$Res> {
  __$MatchClockCopyWithImpl(this._self, this._then);

  final _MatchClock _self;
  final $Res Function(_MatchClock) _then;

/// Create a copy of MatchClock
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? minute = null,Object? second = null,Object? extraTimeFirstHalf = null,Object? extraTimeSecondHalf = null,}) {
  return _then(_MatchClock(
minute: null == minute ? _self.minute : minute // ignore: cast_nullable_to_non_nullable
as int,second: null == second ? _self.second : second // ignore: cast_nullable_to_non_nullable
as int,extraTimeFirstHalf: null == extraTimeFirstHalf ? _self.extraTimeFirstHalf : extraTimeFirstHalf // ignore: cast_nullable_to_non_nullable
as int,extraTimeSecondHalf: null == extraTimeSecondHalf ? _self.extraTimeSecondHalf : extraTimeSecondHalf // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
