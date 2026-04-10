// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'matchup_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MatchupProfile {

// ==================== POSSESSION and BUILD-UP ====================
// How A's build-up style matches against B's press resistance
 double get buildupEdge;// How effective A's pressing is vs B's build-up structure
 double get pressingEdge;// Counterpressing (when possession lost)
 double get counterpressingEdge;// ==================== SPACE CONTROL ====================
// Compactness matchup: A's compactness vs B's ability to penetrate
 double get compactnessEdge;// Defensive line height matchup: A's line vs B's offside trap vulnerability
 double get defensiveLineEdge;// ==================== ROUTE and CHANCE CREATION ====================
// Flank/wing progression: A's width strategy vs B's flank coverage
 double get wideEdge;// Central control and through-ball effectiveness
 double get centralEdge;// Fullback vs Winger duel (wing battleground)
 double get fullbackEdge;// ==================== FINAL THIRD and SHOOTING ====================
// How teams finish: A's final third approach vs B's defensive positioning
 double get finalThirdEdge;// Shot quality influenced by risk tolerance
 double get shootingRiskEdge;// ==================== TRANSITIONS ====================
// Transition speed when possession won
 double get transitionOutEdge;// Transition vulnerability when possession lost
 double get transitionInEdge;// ==================== SET PIECES and AERIAL ====================
// Aerial duels and set-piece effectiveness
 double get aerialEdge;// Defensive set-piece vulnerability
 double get setpieceDefenseEdge;// ==================== TEMPO and FATIGUE ====================
// Tempo compatibility: high pace vs controlled play
 double get tempoEdge;// ==================== KEY PLAYER INFLUENCE ====================
// Playmaker presence and impact zones
 double get playmakerEdge;// Striker effectiveness and support quality
 double get strikerSupportEdge;
/// Create a copy of MatchupProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchupProfileCopyWith<MatchupProfile> get copyWith => _$MatchupProfileCopyWithImpl<MatchupProfile>(this as MatchupProfile, _$identity);

  /// Serializes this MatchupProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchupProfile&&(identical(other.buildupEdge, buildupEdge) || other.buildupEdge == buildupEdge)&&(identical(other.pressingEdge, pressingEdge) || other.pressingEdge == pressingEdge)&&(identical(other.counterpressingEdge, counterpressingEdge) || other.counterpressingEdge == counterpressingEdge)&&(identical(other.compactnessEdge, compactnessEdge) || other.compactnessEdge == compactnessEdge)&&(identical(other.defensiveLineEdge, defensiveLineEdge) || other.defensiveLineEdge == defensiveLineEdge)&&(identical(other.wideEdge, wideEdge) || other.wideEdge == wideEdge)&&(identical(other.centralEdge, centralEdge) || other.centralEdge == centralEdge)&&(identical(other.fullbackEdge, fullbackEdge) || other.fullbackEdge == fullbackEdge)&&(identical(other.finalThirdEdge, finalThirdEdge) || other.finalThirdEdge == finalThirdEdge)&&(identical(other.shootingRiskEdge, shootingRiskEdge) || other.shootingRiskEdge == shootingRiskEdge)&&(identical(other.transitionOutEdge, transitionOutEdge) || other.transitionOutEdge == transitionOutEdge)&&(identical(other.transitionInEdge, transitionInEdge) || other.transitionInEdge == transitionInEdge)&&(identical(other.aerialEdge, aerialEdge) || other.aerialEdge == aerialEdge)&&(identical(other.setpieceDefenseEdge, setpieceDefenseEdge) || other.setpieceDefenseEdge == setpieceDefenseEdge)&&(identical(other.tempoEdge, tempoEdge) || other.tempoEdge == tempoEdge)&&(identical(other.playmakerEdge, playmakerEdge) || other.playmakerEdge == playmakerEdge)&&(identical(other.strikerSupportEdge, strikerSupportEdge) || other.strikerSupportEdge == strikerSupportEdge));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,buildupEdge,pressingEdge,counterpressingEdge,compactnessEdge,defensiveLineEdge,wideEdge,centralEdge,fullbackEdge,finalThirdEdge,shootingRiskEdge,transitionOutEdge,transitionInEdge,aerialEdge,setpieceDefenseEdge,tempoEdge,playmakerEdge,strikerSupportEdge);

@override
String toString() {
  return 'MatchupProfile(buildupEdge: $buildupEdge, pressingEdge: $pressingEdge, counterpressingEdge: $counterpressingEdge, compactnessEdge: $compactnessEdge, defensiveLineEdge: $defensiveLineEdge, wideEdge: $wideEdge, centralEdge: $centralEdge, fullbackEdge: $fullbackEdge, finalThirdEdge: $finalThirdEdge, shootingRiskEdge: $shootingRiskEdge, transitionOutEdge: $transitionOutEdge, transitionInEdge: $transitionInEdge, aerialEdge: $aerialEdge, setpieceDefenseEdge: $setpieceDefenseEdge, tempoEdge: $tempoEdge, playmakerEdge: $playmakerEdge, strikerSupportEdge: $strikerSupportEdge)';
}


}

/// @nodoc
abstract mixin class $MatchupProfileCopyWith<$Res>  {
  factory $MatchupProfileCopyWith(MatchupProfile value, $Res Function(MatchupProfile) _then) = _$MatchupProfileCopyWithImpl;
@useResult
$Res call({
 double buildupEdge, double pressingEdge, double counterpressingEdge, double compactnessEdge, double defensiveLineEdge, double wideEdge, double centralEdge, double fullbackEdge, double finalThirdEdge, double shootingRiskEdge, double transitionOutEdge, double transitionInEdge, double aerialEdge, double setpieceDefenseEdge, double tempoEdge, double playmakerEdge, double strikerSupportEdge
});




}
/// @nodoc
class _$MatchupProfileCopyWithImpl<$Res>
    implements $MatchupProfileCopyWith<$Res> {
  _$MatchupProfileCopyWithImpl(this._self, this._then);

  final MatchupProfile _self;
  final $Res Function(MatchupProfile) _then;

/// Create a copy of MatchupProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? buildupEdge = null,Object? pressingEdge = null,Object? counterpressingEdge = null,Object? compactnessEdge = null,Object? defensiveLineEdge = null,Object? wideEdge = null,Object? centralEdge = null,Object? fullbackEdge = null,Object? finalThirdEdge = null,Object? shootingRiskEdge = null,Object? transitionOutEdge = null,Object? transitionInEdge = null,Object? aerialEdge = null,Object? setpieceDefenseEdge = null,Object? tempoEdge = null,Object? playmakerEdge = null,Object? strikerSupportEdge = null,}) {
  return _then(_self.copyWith(
buildupEdge: null == buildupEdge ? _self.buildupEdge : buildupEdge // ignore: cast_nullable_to_non_nullable
as double,pressingEdge: null == pressingEdge ? _self.pressingEdge : pressingEdge // ignore: cast_nullable_to_non_nullable
as double,counterpressingEdge: null == counterpressingEdge ? _self.counterpressingEdge : counterpressingEdge // ignore: cast_nullable_to_non_nullable
as double,compactnessEdge: null == compactnessEdge ? _self.compactnessEdge : compactnessEdge // ignore: cast_nullable_to_non_nullable
as double,defensiveLineEdge: null == defensiveLineEdge ? _self.defensiveLineEdge : defensiveLineEdge // ignore: cast_nullable_to_non_nullable
as double,wideEdge: null == wideEdge ? _self.wideEdge : wideEdge // ignore: cast_nullable_to_non_nullable
as double,centralEdge: null == centralEdge ? _self.centralEdge : centralEdge // ignore: cast_nullable_to_non_nullable
as double,fullbackEdge: null == fullbackEdge ? _self.fullbackEdge : fullbackEdge // ignore: cast_nullable_to_non_nullable
as double,finalThirdEdge: null == finalThirdEdge ? _self.finalThirdEdge : finalThirdEdge // ignore: cast_nullable_to_non_nullable
as double,shootingRiskEdge: null == shootingRiskEdge ? _self.shootingRiskEdge : shootingRiskEdge // ignore: cast_nullable_to_non_nullable
as double,transitionOutEdge: null == transitionOutEdge ? _self.transitionOutEdge : transitionOutEdge // ignore: cast_nullable_to_non_nullable
as double,transitionInEdge: null == transitionInEdge ? _self.transitionInEdge : transitionInEdge // ignore: cast_nullable_to_non_nullable
as double,aerialEdge: null == aerialEdge ? _self.aerialEdge : aerialEdge // ignore: cast_nullable_to_non_nullable
as double,setpieceDefenseEdge: null == setpieceDefenseEdge ? _self.setpieceDefenseEdge : setpieceDefenseEdge // ignore: cast_nullable_to_non_nullable
as double,tempoEdge: null == tempoEdge ? _self.tempoEdge : tempoEdge // ignore: cast_nullable_to_non_nullable
as double,playmakerEdge: null == playmakerEdge ? _self.playmakerEdge : playmakerEdge // ignore: cast_nullable_to_non_nullable
as double,strikerSupportEdge: null == strikerSupportEdge ? _self.strikerSupportEdge : strikerSupportEdge // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [MatchupProfile].
extension MatchupProfilePatterns on MatchupProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchupProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchupProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchupProfile value)  $default,){
final _that = this;
switch (_that) {
case _MatchupProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchupProfile value)?  $default,){
final _that = this;
switch (_that) {
case _MatchupProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double buildupEdge,  double pressingEdge,  double counterpressingEdge,  double compactnessEdge,  double defensiveLineEdge,  double wideEdge,  double centralEdge,  double fullbackEdge,  double finalThirdEdge,  double shootingRiskEdge,  double transitionOutEdge,  double transitionInEdge,  double aerialEdge,  double setpieceDefenseEdge,  double tempoEdge,  double playmakerEdge,  double strikerSupportEdge)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchupProfile() when $default != null:
return $default(_that.buildupEdge,_that.pressingEdge,_that.counterpressingEdge,_that.compactnessEdge,_that.defensiveLineEdge,_that.wideEdge,_that.centralEdge,_that.fullbackEdge,_that.finalThirdEdge,_that.shootingRiskEdge,_that.transitionOutEdge,_that.transitionInEdge,_that.aerialEdge,_that.setpieceDefenseEdge,_that.tempoEdge,_that.playmakerEdge,_that.strikerSupportEdge);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double buildupEdge,  double pressingEdge,  double counterpressingEdge,  double compactnessEdge,  double defensiveLineEdge,  double wideEdge,  double centralEdge,  double fullbackEdge,  double finalThirdEdge,  double shootingRiskEdge,  double transitionOutEdge,  double transitionInEdge,  double aerialEdge,  double setpieceDefenseEdge,  double tempoEdge,  double playmakerEdge,  double strikerSupportEdge)  $default,) {final _that = this;
switch (_that) {
case _MatchupProfile():
return $default(_that.buildupEdge,_that.pressingEdge,_that.counterpressingEdge,_that.compactnessEdge,_that.defensiveLineEdge,_that.wideEdge,_that.centralEdge,_that.fullbackEdge,_that.finalThirdEdge,_that.shootingRiskEdge,_that.transitionOutEdge,_that.transitionInEdge,_that.aerialEdge,_that.setpieceDefenseEdge,_that.tempoEdge,_that.playmakerEdge,_that.strikerSupportEdge);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double buildupEdge,  double pressingEdge,  double counterpressingEdge,  double compactnessEdge,  double defensiveLineEdge,  double wideEdge,  double centralEdge,  double fullbackEdge,  double finalThirdEdge,  double shootingRiskEdge,  double transitionOutEdge,  double transitionInEdge,  double aerialEdge,  double setpieceDefenseEdge,  double tempoEdge,  double playmakerEdge,  double strikerSupportEdge)?  $default,) {final _that = this;
switch (_that) {
case _MatchupProfile() when $default != null:
return $default(_that.buildupEdge,_that.pressingEdge,_that.counterpressingEdge,_that.compactnessEdge,_that.defensiveLineEdge,_that.wideEdge,_that.centralEdge,_that.fullbackEdge,_that.finalThirdEdge,_that.shootingRiskEdge,_that.transitionOutEdge,_that.transitionInEdge,_that.aerialEdge,_that.setpieceDefenseEdge,_that.tempoEdge,_that.playmakerEdge,_that.strikerSupportEdge);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MatchupProfile extends MatchupProfile {
  const _MatchupProfile({this.buildupEdge = 0.0, this.pressingEdge = 0.0, this.counterpressingEdge = 0.0, this.compactnessEdge = 0.0, this.defensiveLineEdge = 0.0, this.wideEdge = 0.0, this.centralEdge = 0.0, this.fullbackEdge = 0.0, this.finalThirdEdge = 0.0, this.shootingRiskEdge = 0.0, this.transitionOutEdge = 0.0, this.transitionInEdge = 0.0, this.aerialEdge = 0.0, this.setpieceDefenseEdge = 0.0, this.tempoEdge = 0.0, this.playmakerEdge = 0.0, this.strikerSupportEdge = 0.0}): super._();
  factory _MatchupProfile.fromJson(Map<String, dynamic> json) => _$MatchupProfileFromJson(json);

// ==================== POSSESSION and BUILD-UP ====================
// How A's build-up style matches against B's press resistance
@override@JsonKey() final  double buildupEdge;
// How effective A's pressing is vs B's build-up structure
@override@JsonKey() final  double pressingEdge;
// Counterpressing (when possession lost)
@override@JsonKey() final  double counterpressingEdge;
// ==================== SPACE CONTROL ====================
// Compactness matchup: A's compactness vs B's ability to penetrate
@override@JsonKey() final  double compactnessEdge;
// Defensive line height matchup: A's line vs B's offside trap vulnerability
@override@JsonKey() final  double defensiveLineEdge;
// ==================== ROUTE and CHANCE CREATION ====================
// Flank/wing progression: A's width strategy vs B's flank coverage
@override@JsonKey() final  double wideEdge;
// Central control and through-ball effectiveness
@override@JsonKey() final  double centralEdge;
// Fullback vs Winger duel (wing battleground)
@override@JsonKey() final  double fullbackEdge;
// ==================== FINAL THIRD and SHOOTING ====================
// How teams finish: A's final third approach vs B's defensive positioning
@override@JsonKey() final  double finalThirdEdge;
// Shot quality influenced by risk tolerance
@override@JsonKey() final  double shootingRiskEdge;
// ==================== TRANSITIONS ====================
// Transition speed when possession won
@override@JsonKey() final  double transitionOutEdge;
// Transition vulnerability when possession lost
@override@JsonKey() final  double transitionInEdge;
// ==================== SET PIECES and AERIAL ====================
// Aerial duels and set-piece effectiveness
@override@JsonKey() final  double aerialEdge;
// Defensive set-piece vulnerability
@override@JsonKey() final  double setpieceDefenseEdge;
// ==================== TEMPO and FATIGUE ====================
// Tempo compatibility: high pace vs controlled play
@override@JsonKey() final  double tempoEdge;
// ==================== KEY PLAYER INFLUENCE ====================
// Playmaker presence and impact zones
@override@JsonKey() final  double playmakerEdge;
// Striker effectiveness and support quality
@override@JsonKey() final  double strikerSupportEdge;

/// Create a copy of MatchupProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchupProfileCopyWith<_MatchupProfile> get copyWith => __$MatchupProfileCopyWithImpl<_MatchupProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchupProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchupProfile&&(identical(other.buildupEdge, buildupEdge) || other.buildupEdge == buildupEdge)&&(identical(other.pressingEdge, pressingEdge) || other.pressingEdge == pressingEdge)&&(identical(other.counterpressingEdge, counterpressingEdge) || other.counterpressingEdge == counterpressingEdge)&&(identical(other.compactnessEdge, compactnessEdge) || other.compactnessEdge == compactnessEdge)&&(identical(other.defensiveLineEdge, defensiveLineEdge) || other.defensiveLineEdge == defensiveLineEdge)&&(identical(other.wideEdge, wideEdge) || other.wideEdge == wideEdge)&&(identical(other.centralEdge, centralEdge) || other.centralEdge == centralEdge)&&(identical(other.fullbackEdge, fullbackEdge) || other.fullbackEdge == fullbackEdge)&&(identical(other.finalThirdEdge, finalThirdEdge) || other.finalThirdEdge == finalThirdEdge)&&(identical(other.shootingRiskEdge, shootingRiskEdge) || other.shootingRiskEdge == shootingRiskEdge)&&(identical(other.transitionOutEdge, transitionOutEdge) || other.transitionOutEdge == transitionOutEdge)&&(identical(other.transitionInEdge, transitionInEdge) || other.transitionInEdge == transitionInEdge)&&(identical(other.aerialEdge, aerialEdge) || other.aerialEdge == aerialEdge)&&(identical(other.setpieceDefenseEdge, setpieceDefenseEdge) || other.setpieceDefenseEdge == setpieceDefenseEdge)&&(identical(other.tempoEdge, tempoEdge) || other.tempoEdge == tempoEdge)&&(identical(other.playmakerEdge, playmakerEdge) || other.playmakerEdge == playmakerEdge)&&(identical(other.strikerSupportEdge, strikerSupportEdge) || other.strikerSupportEdge == strikerSupportEdge));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,buildupEdge,pressingEdge,counterpressingEdge,compactnessEdge,defensiveLineEdge,wideEdge,centralEdge,fullbackEdge,finalThirdEdge,shootingRiskEdge,transitionOutEdge,transitionInEdge,aerialEdge,setpieceDefenseEdge,tempoEdge,playmakerEdge,strikerSupportEdge);

@override
String toString() {
  return 'MatchupProfile(buildupEdge: $buildupEdge, pressingEdge: $pressingEdge, counterpressingEdge: $counterpressingEdge, compactnessEdge: $compactnessEdge, defensiveLineEdge: $defensiveLineEdge, wideEdge: $wideEdge, centralEdge: $centralEdge, fullbackEdge: $fullbackEdge, finalThirdEdge: $finalThirdEdge, shootingRiskEdge: $shootingRiskEdge, transitionOutEdge: $transitionOutEdge, transitionInEdge: $transitionInEdge, aerialEdge: $aerialEdge, setpieceDefenseEdge: $setpieceDefenseEdge, tempoEdge: $tempoEdge, playmakerEdge: $playmakerEdge, strikerSupportEdge: $strikerSupportEdge)';
}


}

/// @nodoc
abstract mixin class _$MatchupProfileCopyWith<$Res> implements $MatchupProfileCopyWith<$Res> {
  factory _$MatchupProfileCopyWith(_MatchupProfile value, $Res Function(_MatchupProfile) _then) = __$MatchupProfileCopyWithImpl;
@override @useResult
$Res call({
 double buildupEdge, double pressingEdge, double counterpressingEdge, double compactnessEdge, double defensiveLineEdge, double wideEdge, double centralEdge, double fullbackEdge, double finalThirdEdge, double shootingRiskEdge, double transitionOutEdge, double transitionInEdge, double aerialEdge, double setpieceDefenseEdge, double tempoEdge, double playmakerEdge, double strikerSupportEdge
});




}
/// @nodoc
class __$MatchupProfileCopyWithImpl<$Res>
    implements _$MatchupProfileCopyWith<$Res> {
  __$MatchupProfileCopyWithImpl(this._self, this._then);

  final _MatchupProfile _self;
  final $Res Function(_MatchupProfile) _then;

/// Create a copy of MatchupProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? buildupEdge = null,Object? pressingEdge = null,Object? counterpressingEdge = null,Object? compactnessEdge = null,Object? defensiveLineEdge = null,Object? wideEdge = null,Object? centralEdge = null,Object? fullbackEdge = null,Object? finalThirdEdge = null,Object? shootingRiskEdge = null,Object? transitionOutEdge = null,Object? transitionInEdge = null,Object? aerialEdge = null,Object? setpieceDefenseEdge = null,Object? tempoEdge = null,Object? playmakerEdge = null,Object? strikerSupportEdge = null,}) {
  return _then(_MatchupProfile(
buildupEdge: null == buildupEdge ? _self.buildupEdge : buildupEdge // ignore: cast_nullable_to_non_nullable
as double,pressingEdge: null == pressingEdge ? _self.pressingEdge : pressingEdge // ignore: cast_nullable_to_non_nullable
as double,counterpressingEdge: null == counterpressingEdge ? _self.counterpressingEdge : counterpressingEdge // ignore: cast_nullable_to_non_nullable
as double,compactnessEdge: null == compactnessEdge ? _self.compactnessEdge : compactnessEdge // ignore: cast_nullable_to_non_nullable
as double,defensiveLineEdge: null == defensiveLineEdge ? _self.defensiveLineEdge : defensiveLineEdge // ignore: cast_nullable_to_non_nullable
as double,wideEdge: null == wideEdge ? _self.wideEdge : wideEdge // ignore: cast_nullable_to_non_nullable
as double,centralEdge: null == centralEdge ? _self.centralEdge : centralEdge // ignore: cast_nullable_to_non_nullable
as double,fullbackEdge: null == fullbackEdge ? _self.fullbackEdge : fullbackEdge // ignore: cast_nullable_to_non_nullable
as double,finalThirdEdge: null == finalThirdEdge ? _self.finalThirdEdge : finalThirdEdge // ignore: cast_nullable_to_non_nullable
as double,shootingRiskEdge: null == shootingRiskEdge ? _self.shootingRiskEdge : shootingRiskEdge // ignore: cast_nullable_to_non_nullable
as double,transitionOutEdge: null == transitionOutEdge ? _self.transitionOutEdge : transitionOutEdge // ignore: cast_nullable_to_non_nullable
as double,transitionInEdge: null == transitionInEdge ? _self.transitionInEdge : transitionInEdge // ignore: cast_nullable_to_non_nullable
as double,aerialEdge: null == aerialEdge ? _self.aerialEdge : aerialEdge // ignore: cast_nullable_to_non_nullable
as double,setpieceDefenseEdge: null == setpieceDefenseEdge ? _self.setpieceDefenseEdge : setpieceDefenseEdge // ignore: cast_nullable_to_non_nullable
as double,tempoEdge: null == tempoEdge ? _self.tempoEdge : tempoEdge // ignore: cast_nullable_to_non_nullable
as double,playmakerEdge: null == playmakerEdge ? _self.playmakerEdge : playmakerEdge // ignore: cast_nullable_to_non_nullable
as double,strikerSupportEdge: null == strikerSupportEdge ? _self.strikerSupportEdge : strikerSupportEdge // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
