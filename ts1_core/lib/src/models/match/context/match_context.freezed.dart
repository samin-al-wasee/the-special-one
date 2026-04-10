// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_context.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MatchContext {

 TacticalIdentity get homeTacticalIdentity; TacticalIdentity get awayTacticalIdentity; TeamStrengthProfile get homeStrengthProfile; TeamStrengthProfile get awayStrengthProfile; StructuralProfile get homeStructuralProfile; StructuralProfile get awayStructuralProfile; MatchupProfile get homeToAwayMatchupProfile; MatchupProfile get awayToHomeMatchupProfile;
/// Create a copy of MatchContext
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchContextCopyWith<MatchContext> get copyWith => _$MatchContextCopyWithImpl<MatchContext>(this as MatchContext, _$identity);

  /// Serializes this MatchContext to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchContext&&(identical(other.homeTacticalIdentity, homeTacticalIdentity) || other.homeTacticalIdentity == homeTacticalIdentity)&&(identical(other.awayTacticalIdentity, awayTacticalIdentity) || other.awayTacticalIdentity == awayTacticalIdentity)&&(identical(other.homeStrengthProfile, homeStrengthProfile) || other.homeStrengthProfile == homeStrengthProfile)&&(identical(other.awayStrengthProfile, awayStrengthProfile) || other.awayStrengthProfile == awayStrengthProfile)&&(identical(other.homeStructuralProfile, homeStructuralProfile) || other.homeStructuralProfile == homeStructuralProfile)&&(identical(other.awayStructuralProfile, awayStructuralProfile) || other.awayStructuralProfile == awayStructuralProfile)&&(identical(other.homeToAwayMatchupProfile, homeToAwayMatchupProfile) || other.homeToAwayMatchupProfile == homeToAwayMatchupProfile)&&(identical(other.awayToHomeMatchupProfile, awayToHomeMatchupProfile) || other.awayToHomeMatchupProfile == awayToHomeMatchupProfile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,homeTacticalIdentity,awayTacticalIdentity,homeStrengthProfile,awayStrengthProfile,homeStructuralProfile,awayStructuralProfile,homeToAwayMatchupProfile,awayToHomeMatchupProfile);

@override
String toString() {
  return 'MatchContext(homeTacticalIdentity: $homeTacticalIdentity, awayTacticalIdentity: $awayTacticalIdentity, homeStrengthProfile: $homeStrengthProfile, awayStrengthProfile: $awayStrengthProfile, homeStructuralProfile: $homeStructuralProfile, awayStructuralProfile: $awayStructuralProfile, homeToAwayMatchupProfile: $homeToAwayMatchupProfile, awayToHomeMatchupProfile: $awayToHomeMatchupProfile)';
}


}

/// @nodoc
abstract mixin class $MatchContextCopyWith<$Res>  {
  factory $MatchContextCopyWith(MatchContext value, $Res Function(MatchContext) _then) = _$MatchContextCopyWithImpl;
@useResult
$Res call({
 TacticalIdentity homeTacticalIdentity, TacticalIdentity awayTacticalIdentity, TeamStrengthProfile homeStrengthProfile, TeamStrengthProfile awayStrengthProfile, StructuralProfile homeStructuralProfile, StructuralProfile awayStructuralProfile, MatchupProfile homeToAwayMatchupProfile, MatchupProfile awayToHomeMatchupProfile
});


$TacticalIdentityCopyWith<$Res> get homeTacticalIdentity;$TacticalIdentityCopyWith<$Res> get awayTacticalIdentity;$TeamStrengthProfileCopyWith<$Res> get homeStrengthProfile;$TeamStrengthProfileCopyWith<$Res> get awayStrengthProfile;$StructuralProfileCopyWith<$Res> get homeStructuralProfile;$StructuralProfileCopyWith<$Res> get awayStructuralProfile;$MatchupProfileCopyWith<$Res> get homeToAwayMatchupProfile;$MatchupProfileCopyWith<$Res> get awayToHomeMatchupProfile;

}
/// @nodoc
class _$MatchContextCopyWithImpl<$Res>
    implements $MatchContextCopyWith<$Res> {
  _$MatchContextCopyWithImpl(this._self, this._then);

  final MatchContext _self;
  final $Res Function(MatchContext) _then;

/// Create a copy of MatchContext
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? homeTacticalIdentity = null,Object? awayTacticalIdentity = null,Object? homeStrengthProfile = null,Object? awayStrengthProfile = null,Object? homeStructuralProfile = null,Object? awayStructuralProfile = null,Object? homeToAwayMatchupProfile = null,Object? awayToHomeMatchupProfile = null,}) {
  return _then(_self.copyWith(
homeTacticalIdentity: null == homeTacticalIdentity ? _self.homeTacticalIdentity : homeTacticalIdentity // ignore: cast_nullable_to_non_nullable
as TacticalIdentity,awayTacticalIdentity: null == awayTacticalIdentity ? _self.awayTacticalIdentity : awayTacticalIdentity // ignore: cast_nullable_to_non_nullable
as TacticalIdentity,homeStrengthProfile: null == homeStrengthProfile ? _self.homeStrengthProfile : homeStrengthProfile // ignore: cast_nullable_to_non_nullable
as TeamStrengthProfile,awayStrengthProfile: null == awayStrengthProfile ? _self.awayStrengthProfile : awayStrengthProfile // ignore: cast_nullable_to_non_nullable
as TeamStrengthProfile,homeStructuralProfile: null == homeStructuralProfile ? _self.homeStructuralProfile : homeStructuralProfile // ignore: cast_nullable_to_non_nullable
as StructuralProfile,awayStructuralProfile: null == awayStructuralProfile ? _self.awayStructuralProfile : awayStructuralProfile // ignore: cast_nullable_to_non_nullable
as StructuralProfile,homeToAwayMatchupProfile: null == homeToAwayMatchupProfile ? _self.homeToAwayMatchupProfile : homeToAwayMatchupProfile // ignore: cast_nullable_to_non_nullable
as MatchupProfile,awayToHomeMatchupProfile: null == awayToHomeMatchupProfile ? _self.awayToHomeMatchupProfile : awayToHomeMatchupProfile // ignore: cast_nullable_to_non_nullable
as MatchupProfile,
  ));
}
/// Create a copy of MatchContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TacticalIdentityCopyWith<$Res> get homeTacticalIdentity {
  
  return $TacticalIdentityCopyWith<$Res>(_self.homeTacticalIdentity, (value) {
    return _then(_self.copyWith(homeTacticalIdentity: value));
  });
}/// Create a copy of MatchContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TacticalIdentityCopyWith<$Res> get awayTacticalIdentity {
  
  return $TacticalIdentityCopyWith<$Res>(_self.awayTacticalIdentity, (value) {
    return _then(_self.copyWith(awayTacticalIdentity: value));
  });
}/// Create a copy of MatchContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamStrengthProfileCopyWith<$Res> get homeStrengthProfile {
  
  return $TeamStrengthProfileCopyWith<$Res>(_self.homeStrengthProfile, (value) {
    return _then(_self.copyWith(homeStrengthProfile: value));
  });
}/// Create a copy of MatchContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamStrengthProfileCopyWith<$Res> get awayStrengthProfile {
  
  return $TeamStrengthProfileCopyWith<$Res>(_self.awayStrengthProfile, (value) {
    return _then(_self.copyWith(awayStrengthProfile: value));
  });
}/// Create a copy of MatchContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StructuralProfileCopyWith<$Res> get homeStructuralProfile {
  
  return $StructuralProfileCopyWith<$Res>(_self.homeStructuralProfile, (value) {
    return _then(_self.copyWith(homeStructuralProfile: value));
  });
}/// Create a copy of MatchContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StructuralProfileCopyWith<$Res> get awayStructuralProfile {
  
  return $StructuralProfileCopyWith<$Res>(_self.awayStructuralProfile, (value) {
    return _then(_self.copyWith(awayStructuralProfile: value));
  });
}/// Create a copy of MatchContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchupProfileCopyWith<$Res> get homeToAwayMatchupProfile {
  
  return $MatchupProfileCopyWith<$Res>(_self.homeToAwayMatchupProfile, (value) {
    return _then(_self.copyWith(homeToAwayMatchupProfile: value));
  });
}/// Create a copy of MatchContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchupProfileCopyWith<$Res> get awayToHomeMatchupProfile {
  
  return $MatchupProfileCopyWith<$Res>(_self.awayToHomeMatchupProfile, (value) {
    return _then(_self.copyWith(awayToHomeMatchupProfile: value));
  });
}
}


/// Adds pattern-matching-related methods to [MatchContext].
extension MatchContextPatterns on MatchContext {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchContext value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchContext() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchContext value)  $default,){
final _that = this;
switch (_that) {
case _MatchContext():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchContext value)?  $default,){
final _that = this;
switch (_that) {
case _MatchContext() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TacticalIdentity homeTacticalIdentity,  TacticalIdentity awayTacticalIdentity,  TeamStrengthProfile homeStrengthProfile,  TeamStrengthProfile awayStrengthProfile,  StructuralProfile homeStructuralProfile,  StructuralProfile awayStructuralProfile,  MatchupProfile homeToAwayMatchupProfile,  MatchupProfile awayToHomeMatchupProfile)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchContext() when $default != null:
return $default(_that.homeTacticalIdentity,_that.awayTacticalIdentity,_that.homeStrengthProfile,_that.awayStrengthProfile,_that.homeStructuralProfile,_that.awayStructuralProfile,_that.homeToAwayMatchupProfile,_that.awayToHomeMatchupProfile);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TacticalIdentity homeTacticalIdentity,  TacticalIdentity awayTacticalIdentity,  TeamStrengthProfile homeStrengthProfile,  TeamStrengthProfile awayStrengthProfile,  StructuralProfile homeStructuralProfile,  StructuralProfile awayStructuralProfile,  MatchupProfile homeToAwayMatchupProfile,  MatchupProfile awayToHomeMatchupProfile)  $default,) {final _that = this;
switch (_that) {
case _MatchContext():
return $default(_that.homeTacticalIdentity,_that.awayTacticalIdentity,_that.homeStrengthProfile,_that.awayStrengthProfile,_that.homeStructuralProfile,_that.awayStructuralProfile,_that.homeToAwayMatchupProfile,_that.awayToHomeMatchupProfile);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TacticalIdentity homeTacticalIdentity,  TacticalIdentity awayTacticalIdentity,  TeamStrengthProfile homeStrengthProfile,  TeamStrengthProfile awayStrengthProfile,  StructuralProfile homeStructuralProfile,  StructuralProfile awayStructuralProfile,  MatchupProfile homeToAwayMatchupProfile,  MatchupProfile awayToHomeMatchupProfile)?  $default,) {final _that = this;
switch (_that) {
case _MatchContext() when $default != null:
return $default(_that.homeTacticalIdentity,_that.awayTacticalIdentity,_that.homeStrengthProfile,_that.awayStrengthProfile,_that.homeStructuralProfile,_that.awayStructuralProfile,_that.homeToAwayMatchupProfile,_that.awayToHomeMatchupProfile);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MatchContext implements MatchContext {
  const _MatchContext({this.homeTacticalIdentity = const TacticalIdentity(), this.awayTacticalIdentity = const TacticalIdentity(), this.homeStrengthProfile = const TeamStrengthProfile(buildUpQuality: 50, pressResistance: 50, wideAttack: 50, centralCreativity: 50, aerialThreat: 50, defensiveCompactness: 50, transitionThreat: 50, pressingForce: 50, possessionSecurity: 50, turnoverLiability: 50, finishingQuality: 50, shotVolumeTendency: 50, chanceConversion: 50, transitionDefense: 50, wideDefense: 50, centralDefense: 50, setPieceAttackStrength: 50, setPieceDefenseStrength: 50, disciplineControl: 50, gkDistributionQuality: 50, gkShotStopping: 50, chemistry: 50, morale: 50), this.awayStrengthProfile = const TeamStrengthProfile(buildUpQuality: 50, pressResistance: 50, wideAttack: 50, centralCreativity: 50, aerialThreat: 50, defensiveCompactness: 50, transitionThreat: 50, pressingForce: 50, possessionSecurity: 50, turnoverLiability: 50, finishingQuality: 50, shotVolumeTendency: 50, chanceConversion: 50, transitionDefense: 50, wideDefense: 50, centralDefense: 50, setPieceAttackStrength: 50, setPieceDefenseStrength: 50, disciplineControl: 50, gkDistributionQuality: 50, gkShotStopping: 50, chemistry: 50, morale: 50), this.homeStructuralProfile = const StructuralProfile(), this.awayStructuralProfile = const StructuralProfile(), this.homeToAwayMatchupProfile = const MatchupProfile(), this.awayToHomeMatchupProfile = const MatchupProfile()});
  factory _MatchContext.fromJson(Map<String, dynamic> json) => _$MatchContextFromJson(json);

@override@JsonKey() final  TacticalIdentity homeTacticalIdentity;
@override@JsonKey() final  TacticalIdentity awayTacticalIdentity;
@override@JsonKey() final  TeamStrengthProfile homeStrengthProfile;
@override@JsonKey() final  TeamStrengthProfile awayStrengthProfile;
@override@JsonKey() final  StructuralProfile homeStructuralProfile;
@override@JsonKey() final  StructuralProfile awayStructuralProfile;
@override@JsonKey() final  MatchupProfile homeToAwayMatchupProfile;
@override@JsonKey() final  MatchupProfile awayToHomeMatchupProfile;

/// Create a copy of MatchContext
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchContextCopyWith<_MatchContext> get copyWith => __$MatchContextCopyWithImpl<_MatchContext>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchContextToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchContext&&(identical(other.homeTacticalIdentity, homeTacticalIdentity) || other.homeTacticalIdentity == homeTacticalIdentity)&&(identical(other.awayTacticalIdentity, awayTacticalIdentity) || other.awayTacticalIdentity == awayTacticalIdentity)&&(identical(other.homeStrengthProfile, homeStrengthProfile) || other.homeStrengthProfile == homeStrengthProfile)&&(identical(other.awayStrengthProfile, awayStrengthProfile) || other.awayStrengthProfile == awayStrengthProfile)&&(identical(other.homeStructuralProfile, homeStructuralProfile) || other.homeStructuralProfile == homeStructuralProfile)&&(identical(other.awayStructuralProfile, awayStructuralProfile) || other.awayStructuralProfile == awayStructuralProfile)&&(identical(other.homeToAwayMatchupProfile, homeToAwayMatchupProfile) || other.homeToAwayMatchupProfile == homeToAwayMatchupProfile)&&(identical(other.awayToHomeMatchupProfile, awayToHomeMatchupProfile) || other.awayToHomeMatchupProfile == awayToHomeMatchupProfile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,homeTacticalIdentity,awayTacticalIdentity,homeStrengthProfile,awayStrengthProfile,homeStructuralProfile,awayStructuralProfile,homeToAwayMatchupProfile,awayToHomeMatchupProfile);

@override
String toString() {
  return 'MatchContext(homeTacticalIdentity: $homeTacticalIdentity, awayTacticalIdentity: $awayTacticalIdentity, homeStrengthProfile: $homeStrengthProfile, awayStrengthProfile: $awayStrengthProfile, homeStructuralProfile: $homeStructuralProfile, awayStructuralProfile: $awayStructuralProfile, homeToAwayMatchupProfile: $homeToAwayMatchupProfile, awayToHomeMatchupProfile: $awayToHomeMatchupProfile)';
}


}

/// @nodoc
abstract mixin class _$MatchContextCopyWith<$Res> implements $MatchContextCopyWith<$Res> {
  factory _$MatchContextCopyWith(_MatchContext value, $Res Function(_MatchContext) _then) = __$MatchContextCopyWithImpl;
@override @useResult
$Res call({
 TacticalIdentity homeTacticalIdentity, TacticalIdentity awayTacticalIdentity, TeamStrengthProfile homeStrengthProfile, TeamStrengthProfile awayStrengthProfile, StructuralProfile homeStructuralProfile, StructuralProfile awayStructuralProfile, MatchupProfile homeToAwayMatchupProfile, MatchupProfile awayToHomeMatchupProfile
});


@override $TacticalIdentityCopyWith<$Res> get homeTacticalIdentity;@override $TacticalIdentityCopyWith<$Res> get awayTacticalIdentity;@override $TeamStrengthProfileCopyWith<$Res> get homeStrengthProfile;@override $TeamStrengthProfileCopyWith<$Res> get awayStrengthProfile;@override $StructuralProfileCopyWith<$Res> get homeStructuralProfile;@override $StructuralProfileCopyWith<$Res> get awayStructuralProfile;@override $MatchupProfileCopyWith<$Res> get homeToAwayMatchupProfile;@override $MatchupProfileCopyWith<$Res> get awayToHomeMatchupProfile;

}
/// @nodoc
class __$MatchContextCopyWithImpl<$Res>
    implements _$MatchContextCopyWith<$Res> {
  __$MatchContextCopyWithImpl(this._self, this._then);

  final _MatchContext _self;
  final $Res Function(_MatchContext) _then;

/// Create a copy of MatchContext
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? homeTacticalIdentity = null,Object? awayTacticalIdentity = null,Object? homeStrengthProfile = null,Object? awayStrengthProfile = null,Object? homeStructuralProfile = null,Object? awayStructuralProfile = null,Object? homeToAwayMatchupProfile = null,Object? awayToHomeMatchupProfile = null,}) {
  return _then(_MatchContext(
homeTacticalIdentity: null == homeTacticalIdentity ? _self.homeTacticalIdentity : homeTacticalIdentity // ignore: cast_nullable_to_non_nullable
as TacticalIdentity,awayTacticalIdentity: null == awayTacticalIdentity ? _self.awayTacticalIdentity : awayTacticalIdentity // ignore: cast_nullable_to_non_nullable
as TacticalIdentity,homeStrengthProfile: null == homeStrengthProfile ? _self.homeStrengthProfile : homeStrengthProfile // ignore: cast_nullable_to_non_nullable
as TeamStrengthProfile,awayStrengthProfile: null == awayStrengthProfile ? _self.awayStrengthProfile : awayStrengthProfile // ignore: cast_nullable_to_non_nullable
as TeamStrengthProfile,homeStructuralProfile: null == homeStructuralProfile ? _self.homeStructuralProfile : homeStructuralProfile // ignore: cast_nullable_to_non_nullable
as StructuralProfile,awayStructuralProfile: null == awayStructuralProfile ? _self.awayStructuralProfile : awayStructuralProfile // ignore: cast_nullable_to_non_nullable
as StructuralProfile,homeToAwayMatchupProfile: null == homeToAwayMatchupProfile ? _self.homeToAwayMatchupProfile : homeToAwayMatchupProfile // ignore: cast_nullable_to_non_nullable
as MatchupProfile,awayToHomeMatchupProfile: null == awayToHomeMatchupProfile ? _self.awayToHomeMatchupProfile : awayToHomeMatchupProfile // ignore: cast_nullable_to_non_nullable
as MatchupProfile,
  ));
}

/// Create a copy of MatchContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TacticalIdentityCopyWith<$Res> get homeTacticalIdentity {
  
  return $TacticalIdentityCopyWith<$Res>(_self.homeTacticalIdentity, (value) {
    return _then(_self.copyWith(homeTacticalIdentity: value));
  });
}/// Create a copy of MatchContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TacticalIdentityCopyWith<$Res> get awayTacticalIdentity {
  
  return $TacticalIdentityCopyWith<$Res>(_self.awayTacticalIdentity, (value) {
    return _then(_self.copyWith(awayTacticalIdentity: value));
  });
}/// Create a copy of MatchContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamStrengthProfileCopyWith<$Res> get homeStrengthProfile {
  
  return $TeamStrengthProfileCopyWith<$Res>(_self.homeStrengthProfile, (value) {
    return _then(_self.copyWith(homeStrengthProfile: value));
  });
}/// Create a copy of MatchContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamStrengthProfileCopyWith<$Res> get awayStrengthProfile {
  
  return $TeamStrengthProfileCopyWith<$Res>(_self.awayStrengthProfile, (value) {
    return _then(_self.copyWith(awayStrengthProfile: value));
  });
}/// Create a copy of MatchContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StructuralProfileCopyWith<$Res> get homeStructuralProfile {
  
  return $StructuralProfileCopyWith<$Res>(_self.homeStructuralProfile, (value) {
    return _then(_self.copyWith(homeStructuralProfile: value));
  });
}/// Create a copy of MatchContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StructuralProfileCopyWith<$Res> get awayStructuralProfile {
  
  return $StructuralProfileCopyWith<$Res>(_self.awayStructuralProfile, (value) {
    return _then(_self.copyWith(awayStructuralProfile: value));
  });
}/// Create a copy of MatchContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchupProfileCopyWith<$Res> get homeToAwayMatchupProfile {
  
  return $MatchupProfileCopyWith<$Res>(_self.homeToAwayMatchupProfile, (value) {
    return _then(_self.copyWith(homeToAwayMatchupProfile: value));
  });
}/// Create a copy of MatchContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchupProfileCopyWith<$Res> get awayToHomeMatchupProfile {
  
  return $MatchupProfileCopyWith<$Res>(_self.awayToHomeMatchupProfile, (value) {
    return _then(_self.copyWith(awayToHomeMatchupProfile: value));
  });
}
}

// dart format on
