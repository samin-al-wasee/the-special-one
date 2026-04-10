// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tactical_insight.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TacticalInsight {

 int get minute; TacticalSignalLevel get level; String get message; String? get suggestedAction; TeamSide? get relatedTeam;
/// Create a copy of TacticalInsight
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TacticalInsightCopyWith<TacticalInsight> get copyWith => _$TacticalInsightCopyWithImpl<TacticalInsight>(this as TacticalInsight, _$identity);

  /// Serializes this TacticalInsight to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TacticalInsight&&(identical(other.minute, minute) || other.minute == minute)&&(identical(other.level, level) || other.level == level)&&(identical(other.message, message) || other.message == message)&&(identical(other.suggestedAction, suggestedAction) || other.suggestedAction == suggestedAction)&&(identical(other.relatedTeam, relatedTeam) || other.relatedTeam == relatedTeam));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,minute,level,message,suggestedAction,relatedTeam);

@override
String toString() {
  return 'TacticalInsight(minute: $minute, level: $level, message: $message, suggestedAction: $suggestedAction, relatedTeam: $relatedTeam)';
}


}

/// @nodoc
abstract mixin class $TacticalInsightCopyWith<$Res>  {
  factory $TacticalInsightCopyWith(TacticalInsight value, $Res Function(TacticalInsight) _then) = _$TacticalInsightCopyWithImpl;
@useResult
$Res call({
 int minute, TacticalSignalLevel level, String message, String? suggestedAction, TeamSide? relatedTeam
});




}
/// @nodoc
class _$TacticalInsightCopyWithImpl<$Res>
    implements $TacticalInsightCopyWith<$Res> {
  _$TacticalInsightCopyWithImpl(this._self, this._then);

  final TacticalInsight _self;
  final $Res Function(TacticalInsight) _then;

/// Create a copy of TacticalInsight
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? minute = null,Object? level = null,Object? message = null,Object? suggestedAction = freezed,Object? relatedTeam = freezed,}) {
  return _then(_self.copyWith(
minute: null == minute ? _self.minute : minute // ignore: cast_nullable_to_non_nullable
as int,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as TacticalSignalLevel,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,suggestedAction: freezed == suggestedAction ? _self.suggestedAction : suggestedAction // ignore: cast_nullable_to_non_nullable
as String?,relatedTeam: freezed == relatedTeam ? _self.relatedTeam : relatedTeam // ignore: cast_nullable_to_non_nullable
as TeamSide?,
  ));
}

}


/// Adds pattern-matching-related methods to [TacticalInsight].
extension TacticalInsightPatterns on TacticalInsight {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TacticalInsight value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TacticalInsight() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TacticalInsight value)  $default,){
final _that = this;
switch (_that) {
case _TacticalInsight():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TacticalInsight value)?  $default,){
final _that = this;
switch (_that) {
case _TacticalInsight() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int minute,  TacticalSignalLevel level,  String message,  String? suggestedAction,  TeamSide? relatedTeam)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TacticalInsight() when $default != null:
return $default(_that.minute,_that.level,_that.message,_that.suggestedAction,_that.relatedTeam);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int minute,  TacticalSignalLevel level,  String message,  String? suggestedAction,  TeamSide? relatedTeam)  $default,) {final _that = this;
switch (_that) {
case _TacticalInsight():
return $default(_that.minute,_that.level,_that.message,_that.suggestedAction,_that.relatedTeam);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int minute,  TacticalSignalLevel level,  String message,  String? suggestedAction,  TeamSide? relatedTeam)?  $default,) {final _that = this;
switch (_that) {
case _TacticalInsight() when $default != null:
return $default(_that.minute,_that.level,_that.message,_that.suggestedAction,_that.relatedTeam);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TacticalInsight extends TacticalInsight {
  const _TacticalInsight({required this.minute, required this.level, required this.message, this.suggestedAction, this.relatedTeam}): super._();
  factory _TacticalInsight.fromJson(Map<String, dynamic> json) => _$TacticalInsightFromJson(json);

@override final  int minute;
@override final  TacticalSignalLevel level;
@override final  String message;
@override final  String? suggestedAction;
@override final  TeamSide? relatedTeam;

/// Create a copy of TacticalInsight
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TacticalInsightCopyWith<_TacticalInsight> get copyWith => __$TacticalInsightCopyWithImpl<_TacticalInsight>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TacticalInsightToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TacticalInsight&&(identical(other.minute, minute) || other.minute == minute)&&(identical(other.level, level) || other.level == level)&&(identical(other.message, message) || other.message == message)&&(identical(other.suggestedAction, suggestedAction) || other.suggestedAction == suggestedAction)&&(identical(other.relatedTeam, relatedTeam) || other.relatedTeam == relatedTeam));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,minute,level,message,suggestedAction,relatedTeam);

@override
String toString() {
  return 'TacticalInsight(minute: $minute, level: $level, message: $message, suggestedAction: $suggestedAction, relatedTeam: $relatedTeam)';
}


}

/// @nodoc
abstract mixin class _$TacticalInsightCopyWith<$Res> implements $TacticalInsightCopyWith<$Res> {
  factory _$TacticalInsightCopyWith(_TacticalInsight value, $Res Function(_TacticalInsight) _then) = __$TacticalInsightCopyWithImpl;
@override @useResult
$Res call({
 int minute, TacticalSignalLevel level, String message, String? suggestedAction, TeamSide? relatedTeam
});




}
/// @nodoc
class __$TacticalInsightCopyWithImpl<$Res>
    implements _$TacticalInsightCopyWith<$Res> {
  __$TacticalInsightCopyWithImpl(this._self, this._then);

  final _TacticalInsight _self;
  final $Res Function(_TacticalInsight) _then;

/// Create a copy of TacticalInsight
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? minute = null,Object? level = null,Object? message = null,Object? suggestedAction = freezed,Object? relatedTeam = freezed,}) {
  return _then(_TacticalInsight(
minute: null == minute ? _self.minute : minute // ignore: cast_nullable_to_non_nullable
as int,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as TacticalSignalLevel,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,suggestedAction: freezed == suggestedAction ? _self.suggestedAction : suggestedAction // ignore: cast_nullable_to_non_nullable
as String?,relatedTeam: freezed == relatedTeam ? _self.relatedTeam : relatedTeam // ignore: cast_nullable_to_non_nullable
as TeamSide?,
  ));
}


}

// dart format on
