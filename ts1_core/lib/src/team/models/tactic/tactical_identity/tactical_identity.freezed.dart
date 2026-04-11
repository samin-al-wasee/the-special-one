// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tactical_identity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TacticalIdentity {

 int get id;// ---- Possession / risk profile ----
// 0..1: 0 = very controlled, 1 = very chaotic/risky
 double get riskTaking;// ---- Build-up / progression ----
// 0..1: 0 = short/passive, 1 = direct/vertical
 double get directnessBias; double get verticalProgressionBias; double get shortPassBias;// ---- Width / attacking preference ----
// 0..1: 0 = very narrow, 1 = very wide
 double get widthBias;// 0..1 each; consumers may renormalize to sum to 1
 double get attackLeftBias; double get attackCentralBias; double get attackRightBias;// ---- Chance type / final third ----
 double get throughBallBias; double get crossBias; double get cutbackBias; double get dribbleCreationBias; double get longShotBias;// 0..1: 0 = shoot quickly, 1 = patient shot selection
 double get shotPatience;// ---- Defensive shape / pressing ----
// 0..1: 0 = very deep, 1 = very high
 double get defensiveLineHeight;// 0..1: 0 = very low press, 1 = very high press
 double get pressIntensityBias;// 0..1: how often pressing triggers occur
 double get pressTriggerRate;// 0..1: 0 = very narrow, 1 = very wide
 double get defensiveWidthBias;// 0..1: 0 = very loose, 1 = very compact
 double get compactnessBias;// 0..1: 0 = zonal, 1 = man-oriented
 double get markingBias;// 0..1: 0 = cautious, 1 = aggressive
 double get tacklingAggressionBias;// ---- Transitions ----
// 0..1: 0 = always hold/reset, 1 = counter immediately
 double get counterTriggerBias;// 0..1: 0 = fall back, 1 = counterpress always
 double get counterpressBias;// 0..1: 0 = slow, 1 = very fast
 double get counterSpeedBias;// ---- Set pieces ----
// 0..1: 0 = short routines, 1 = delivery to box
 double get setPieceAttackingBias;// 0..1: 0 = zonal, 1 = man-oriented
 double get setPieceDefensiveBias;// ---- Current minute-loop engine-facing knobs ----
// -0.20 .. +0.20 (recommended)
 double get possessionTilt;// Multipliers applied to base event weights.
 double get passWeightMult; double get turnoverWeightMult; double get shotWeightMult;// Delta applied to base goal probability (recommended -0.10 .. +0.10).
 double get shotConversionDelta;
/// Create a copy of TacticalIdentity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TacticalIdentityCopyWith<TacticalIdentity> get copyWith => _$TacticalIdentityCopyWithImpl<TacticalIdentity>(this as TacticalIdentity, _$identity);

  /// Serializes this TacticalIdentity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TacticalIdentity&&(identical(other.id, id) || other.id == id)&&(identical(other.riskTaking, riskTaking) || other.riskTaking == riskTaking)&&(identical(other.directnessBias, directnessBias) || other.directnessBias == directnessBias)&&(identical(other.verticalProgressionBias, verticalProgressionBias) || other.verticalProgressionBias == verticalProgressionBias)&&(identical(other.shortPassBias, shortPassBias) || other.shortPassBias == shortPassBias)&&(identical(other.widthBias, widthBias) || other.widthBias == widthBias)&&(identical(other.attackLeftBias, attackLeftBias) || other.attackLeftBias == attackLeftBias)&&(identical(other.attackCentralBias, attackCentralBias) || other.attackCentralBias == attackCentralBias)&&(identical(other.attackRightBias, attackRightBias) || other.attackRightBias == attackRightBias)&&(identical(other.throughBallBias, throughBallBias) || other.throughBallBias == throughBallBias)&&(identical(other.crossBias, crossBias) || other.crossBias == crossBias)&&(identical(other.cutbackBias, cutbackBias) || other.cutbackBias == cutbackBias)&&(identical(other.dribbleCreationBias, dribbleCreationBias) || other.dribbleCreationBias == dribbleCreationBias)&&(identical(other.longShotBias, longShotBias) || other.longShotBias == longShotBias)&&(identical(other.shotPatience, shotPatience) || other.shotPatience == shotPatience)&&(identical(other.defensiveLineHeight, defensiveLineHeight) || other.defensiveLineHeight == defensiveLineHeight)&&(identical(other.pressIntensityBias, pressIntensityBias) || other.pressIntensityBias == pressIntensityBias)&&(identical(other.pressTriggerRate, pressTriggerRate) || other.pressTriggerRate == pressTriggerRate)&&(identical(other.defensiveWidthBias, defensiveWidthBias) || other.defensiveWidthBias == defensiveWidthBias)&&(identical(other.compactnessBias, compactnessBias) || other.compactnessBias == compactnessBias)&&(identical(other.markingBias, markingBias) || other.markingBias == markingBias)&&(identical(other.tacklingAggressionBias, tacklingAggressionBias) || other.tacklingAggressionBias == tacklingAggressionBias)&&(identical(other.counterTriggerBias, counterTriggerBias) || other.counterTriggerBias == counterTriggerBias)&&(identical(other.counterpressBias, counterpressBias) || other.counterpressBias == counterpressBias)&&(identical(other.counterSpeedBias, counterSpeedBias) || other.counterSpeedBias == counterSpeedBias)&&(identical(other.setPieceAttackingBias, setPieceAttackingBias) || other.setPieceAttackingBias == setPieceAttackingBias)&&(identical(other.setPieceDefensiveBias, setPieceDefensiveBias) || other.setPieceDefensiveBias == setPieceDefensiveBias)&&(identical(other.possessionTilt, possessionTilt) || other.possessionTilt == possessionTilt)&&(identical(other.passWeightMult, passWeightMult) || other.passWeightMult == passWeightMult)&&(identical(other.turnoverWeightMult, turnoverWeightMult) || other.turnoverWeightMult == turnoverWeightMult)&&(identical(other.shotWeightMult, shotWeightMult) || other.shotWeightMult == shotWeightMult)&&(identical(other.shotConversionDelta, shotConversionDelta) || other.shotConversionDelta == shotConversionDelta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,riskTaking,directnessBias,verticalProgressionBias,shortPassBias,widthBias,attackLeftBias,attackCentralBias,attackRightBias,throughBallBias,crossBias,cutbackBias,dribbleCreationBias,longShotBias,shotPatience,defensiveLineHeight,pressIntensityBias,pressTriggerRate,defensiveWidthBias,compactnessBias,markingBias,tacklingAggressionBias,counterTriggerBias,counterpressBias,counterSpeedBias,setPieceAttackingBias,setPieceDefensiveBias,possessionTilt,passWeightMult,turnoverWeightMult,shotWeightMult,shotConversionDelta]);

@override
String toString() {
  return 'TacticalIdentity(id: $id, riskTaking: $riskTaking, directnessBias: $directnessBias, verticalProgressionBias: $verticalProgressionBias, shortPassBias: $shortPassBias, widthBias: $widthBias, attackLeftBias: $attackLeftBias, attackCentralBias: $attackCentralBias, attackRightBias: $attackRightBias, throughBallBias: $throughBallBias, crossBias: $crossBias, cutbackBias: $cutbackBias, dribbleCreationBias: $dribbleCreationBias, longShotBias: $longShotBias, shotPatience: $shotPatience, defensiveLineHeight: $defensiveLineHeight, pressIntensityBias: $pressIntensityBias, pressTriggerRate: $pressTriggerRate, defensiveWidthBias: $defensiveWidthBias, compactnessBias: $compactnessBias, markingBias: $markingBias, tacklingAggressionBias: $tacklingAggressionBias, counterTriggerBias: $counterTriggerBias, counterpressBias: $counterpressBias, counterSpeedBias: $counterSpeedBias, setPieceAttackingBias: $setPieceAttackingBias, setPieceDefensiveBias: $setPieceDefensiveBias, possessionTilt: $possessionTilt, passWeightMult: $passWeightMult, turnoverWeightMult: $turnoverWeightMult, shotWeightMult: $shotWeightMult, shotConversionDelta: $shotConversionDelta)';
}


}

/// @nodoc
abstract mixin class $TacticalIdentityCopyWith<$Res>  {
  factory $TacticalIdentityCopyWith(TacticalIdentity value, $Res Function(TacticalIdentity) _then) = _$TacticalIdentityCopyWithImpl;
@useResult
$Res call({
 int id, double riskTaking, double directnessBias, double verticalProgressionBias, double shortPassBias, double widthBias, double attackLeftBias, double attackCentralBias, double attackRightBias, double throughBallBias, double crossBias, double cutbackBias, double dribbleCreationBias, double longShotBias, double shotPatience, double defensiveLineHeight, double pressIntensityBias, double pressTriggerRate, double defensiveWidthBias, double compactnessBias, double markingBias, double tacklingAggressionBias, double counterTriggerBias, double counterpressBias, double counterSpeedBias, double setPieceAttackingBias, double setPieceDefensiveBias, double possessionTilt, double passWeightMult, double turnoverWeightMult, double shotWeightMult, double shotConversionDelta
});




}
/// @nodoc
class _$TacticalIdentityCopyWithImpl<$Res>
    implements $TacticalIdentityCopyWith<$Res> {
  _$TacticalIdentityCopyWithImpl(this._self, this._then);

  final TacticalIdentity _self;
  final $Res Function(TacticalIdentity) _then;

/// Create a copy of TacticalIdentity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? riskTaking = null,Object? directnessBias = null,Object? verticalProgressionBias = null,Object? shortPassBias = null,Object? widthBias = null,Object? attackLeftBias = null,Object? attackCentralBias = null,Object? attackRightBias = null,Object? throughBallBias = null,Object? crossBias = null,Object? cutbackBias = null,Object? dribbleCreationBias = null,Object? longShotBias = null,Object? shotPatience = null,Object? defensiveLineHeight = null,Object? pressIntensityBias = null,Object? pressTriggerRate = null,Object? defensiveWidthBias = null,Object? compactnessBias = null,Object? markingBias = null,Object? tacklingAggressionBias = null,Object? counterTriggerBias = null,Object? counterpressBias = null,Object? counterSpeedBias = null,Object? setPieceAttackingBias = null,Object? setPieceDefensiveBias = null,Object? possessionTilt = null,Object? passWeightMult = null,Object? turnoverWeightMult = null,Object? shotWeightMult = null,Object? shotConversionDelta = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,riskTaking: null == riskTaking ? _self.riskTaking : riskTaking // ignore: cast_nullable_to_non_nullable
as double,directnessBias: null == directnessBias ? _self.directnessBias : directnessBias // ignore: cast_nullable_to_non_nullable
as double,verticalProgressionBias: null == verticalProgressionBias ? _self.verticalProgressionBias : verticalProgressionBias // ignore: cast_nullable_to_non_nullable
as double,shortPassBias: null == shortPassBias ? _self.shortPassBias : shortPassBias // ignore: cast_nullable_to_non_nullable
as double,widthBias: null == widthBias ? _self.widthBias : widthBias // ignore: cast_nullable_to_non_nullable
as double,attackLeftBias: null == attackLeftBias ? _self.attackLeftBias : attackLeftBias // ignore: cast_nullable_to_non_nullable
as double,attackCentralBias: null == attackCentralBias ? _self.attackCentralBias : attackCentralBias // ignore: cast_nullable_to_non_nullable
as double,attackRightBias: null == attackRightBias ? _self.attackRightBias : attackRightBias // ignore: cast_nullable_to_non_nullable
as double,throughBallBias: null == throughBallBias ? _self.throughBallBias : throughBallBias // ignore: cast_nullable_to_non_nullable
as double,crossBias: null == crossBias ? _self.crossBias : crossBias // ignore: cast_nullable_to_non_nullable
as double,cutbackBias: null == cutbackBias ? _self.cutbackBias : cutbackBias // ignore: cast_nullable_to_non_nullable
as double,dribbleCreationBias: null == dribbleCreationBias ? _self.dribbleCreationBias : dribbleCreationBias // ignore: cast_nullable_to_non_nullable
as double,longShotBias: null == longShotBias ? _self.longShotBias : longShotBias // ignore: cast_nullable_to_non_nullable
as double,shotPatience: null == shotPatience ? _self.shotPatience : shotPatience // ignore: cast_nullable_to_non_nullable
as double,defensiveLineHeight: null == defensiveLineHeight ? _self.defensiveLineHeight : defensiveLineHeight // ignore: cast_nullable_to_non_nullable
as double,pressIntensityBias: null == pressIntensityBias ? _self.pressIntensityBias : pressIntensityBias // ignore: cast_nullable_to_non_nullable
as double,pressTriggerRate: null == pressTriggerRate ? _self.pressTriggerRate : pressTriggerRate // ignore: cast_nullable_to_non_nullable
as double,defensiveWidthBias: null == defensiveWidthBias ? _self.defensiveWidthBias : defensiveWidthBias // ignore: cast_nullable_to_non_nullable
as double,compactnessBias: null == compactnessBias ? _self.compactnessBias : compactnessBias // ignore: cast_nullable_to_non_nullable
as double,markingBias: null == markingBias ? _self.markingBias : markingBias // ignore: cast_nullable_to_non_nullable
as double,tacklingAggressionBias: null == tacklingAggressionBias ? _self.tacklingAggressionBias : tacklingAggressionBias // ignore: cast_nullable_to_non_nullable
as double,counterTriggerBias: null == counterTriggerBias ? _self.counterTriggerBias : counterTriggerBias // ignore: cast_nullable_to_non_nullable
as double,counterpressBias: null == counterpressBias ? _self.counterpressBias : counterpressBias // ignore: cast_nullable_to_non_nullable
as double,counterSpeedBias: null == counterSpeedBias ? _self.counterSpeedBias : counterSpeedBias // ignore: cast_nullable_to_non_nullable
as double,setPieceAttackingBias: null == setPieceAttackingBias ? _self.setPieceAttackingBias : setPieceAttackingBias // ignore: cast_nullable_to_non_nullable
as double,setPieceDefensiveBias: null == setPieceDefensiveBias ? _self.setPieceDefensiveBias : setPieceDefensiveBias // ignore: cast_nullable_to_non_nullable
as double,possessionTilt: null == possessionTilt ? _self.possessionTilt : possessionTilt // ignore: cast_nullable_to_non_nullable
as double,passWeightMult: null == passWeightMult ? _self.passWeightMult : passWeightMult // ignore: cast_nullable_to_non_nullable
as double,turnoverWeightMult: null == turnoverWeightMult ? _self.turnoverWeightMult : turnoverWeightMult // ignore: cast_nullable_to_non_nullable
as double,shotWeightMult: null == shotWeightMult ? _self.shotWeightMult : shotWeightMult // ignore: cast_nullable_to_non_nullable
as double,shotConversionDelta: null == shotConversionDelta ? _self.shotConversionDelta : shotConversionDelta // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [TacticalIdentity].
extension TacticalIdentityPatterns on TacticalIdentity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TacticalIdentity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TacticalIdentity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TacticalIdentity value)  $default,){
final _that = this;
switch (_that) {
case _TacticalIdentity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TacticalIdentity value)?  $default,){
final _that = this;
switch (_that) {
case _TacticalIdentity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  double riskTaking,  double directnessBias,  double verticalProgressionBias,  double shortPassBias,  double widthBias,  double attackLeftBias,  double attackCentralBias,  double attackRightBias,  double throughBallBias,  double crossBias,  double cutbackBias,  double dribbleCreationBias,  double longShotBias,  double shotPatience,  double defensiveLineHeight,  double pressIntensityBias,  double pressTriggerRate,  double defensiveWidthBias,  double compactnessBias,  double markingBias,  double tacklingAggressionBias,  double counterTriggerBias,  double counterpressBias,  double counterSpeedBias,  double setPieceAttackingBias,  double setPieceDefensiveBias,  double possessionTilt,  double passWeightMult,  double turnoverWeightMult,  double shotWeightMult,  double shotConversionDelta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TacticalIdentity() when $default != null:
return $default(_that.id,_that.riskTaking,_that.directnessBias,_that.verticalProgressionBias,_that.shortPassBias,_that.widthBias,_that.attackLeftBias,_that.attackCentralBias,_that.attackRightBias,_that.throughBallBias,_that.crossBias,_that.cutbackBias,_that.dribbleCreationBias,_that.longShotBias,_that.shotPatience,_that.defensiveLineHeight,_that.pressIntensityBias,_that.pressTriggerRate,_that.defensiveWidthBias,_that.compactnessBias,_that.markingBias,_that.tacklingAggressionBias,_that.counterTriggerBias,_that.counterpressBias,_that.counterSpeedBias,_that.setPieceAttackingBias,_that.setPieceDefensiveBias,_that.possessionTilt,_that.passWeightMult,_that.turnoverWeightMult,_that.shotWeightMult,_that.shotConversionDelta);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  double riskTaking,  double directnessBias,  double verticalProgressionBias,  double shortPassBias,  double widthBias,  double attackLeftBias,  double attackCentralBias,  double attackRightBias,  double throughBallBias,  double crossBias,  double cutbackBias,  double dribbleCreationBias,  double longShotBias,  double shotPatience,  double defensiveLineHeight,  double pressIntensityBias,  double pressTriggerRate,  double defensiveWidthBias,  double compactnessBias,  double markingBias,  double tacklingAggressionBias,  double counterTriggerBias,  double counterpressBias,  double counterSpeedBias,  double setPieceAttackingBias,  double setPieceDefensiveBias,  double possessionTilt,  double passWeightMult,  double turnoverWeightMult,  double shotWeightMult,  double shotConversionDelta)  $default,) {final _that = this;
switch (_that) {
case _TacticalIdentity():
return $default(_that.id,_that.riskTaking,_that.directnessBias,_that.verticalProgressionBias,_that.shortPassBias,_that.widthBias,_that.attackLeftBias,_that.attackCentralBias,_that.attackRightBias,_that.throughBallBias,_that.crossBias,_that.cutbackBias,_that.dribbleCreationBias,_that.longShotBias,_that.shotPatience,_that.defensiveLineHeight,_that.pressIntensityBias,_that.pressTriggerRate,_that.defensiveWidthBias,_that.compactnessBias,_that.markingBias,_that.tacklingAggressionBias,_that.counterTriggerBias,_that.counterpressBias,_that.counterSpeedBias,_that.setPieceAttackingBias,_that.setPieceDefensiveBias,_that.possessionTilt,_that.passWeightMult,_that.turnoverWeightMult,_that.shotWeightMult,_that.shotConversionDelta);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  double riskTaking,  double directnessBias,  double verticalProgressionBias,  double shortPassBias,  double widthBias,  double attackLeftBias,  double attackCentralBias,  double attackRightBias,  double throughBallBias,  double crossBias,  double cutbackBias,  double dribbleCreationBias,  double longShotBias,  double shotPatience,  double defensiveLineHeight,  double pressIntensityBias,  double pressTriggerRate,  double defensiveWidthBias,  double compactnessBias,  double markingBias,  double tacklingAggressionBias,  double counterTriggerBias,  double counterpressBias,  double counterSpeedBias,  double setPieceAttackingBias,  double setPieceDefensiveBias,  double possessionTilt,  double passWeightMult,  double turnoverWeightMult,  double shotWeightMult,  double shotConversionDelta)?  $default,) {final _that = this;
switch (_that) {
case _TacticalIdentity() when $default != null:
return $default(_that.id,_that.riskTaking,_that.directnessBias,_that.verticalProgressionBias,_that.shortPassBias,_that.widthBias,_that.attackLeftBias,_that.attackCentralBias,_that.attackRightBias,_that.throughBallBias,_that.crossBias,_that.cutbackBias,_that.dribbleCreationBias,_that.longShotBias,_that.shotPatience,_that.defensiveLineHeight,_that.pressIntensityBias,_that.pressTriggerRate,_that.defensiveWidthBias,_that.compactnessBias,_that.markingBias,_that.tacklingAggressionBias,_that.counterTriggerBias,_that.counterpressBias,_that.counterSpeedBias,_that.setPieceAttackingBias,_that.setPieceDefensiveBias,_that.possessionTilt,_that.passWeightMult,_that.turnoverWeightMult,_that.shotWeightMult,_that.shotConversionDelta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TacticalIdentity implements TacticalIdentity {
  const _TacticalIdentity({required this.id, required this.riskTaking, required this.directnessBias, required this.verticalProgressionBias, required this.shortPassBias, required this.widthBias, required this.attackLeftBias, required this.attackCentralBias, required this.attackRightBias, required this.throughBallBias, required this.crossBias, required this.cutbackBias, required this.dribbleCreationBias, required this.longShotBias, required this.shotPatience, required this.defensiveLineHeight, required this.pressIntensityBias, required this.pressTriggerRate, required this.defensiveWidthBias, required this.compactnessBias, required this.markingBias, required this.tacklingAggressionBias, required this.counterTriggerBias, required this.counterpressBias, required this.counterSpeedBias, required this.setPieceAttackingBias, required this.setPieceDefensiveBias, required this.possessionTilt, required this.passWeightMult, required this.turnoverWeightMult, required this.shotWeightMult, required this.shotConversionDelta});
  factory _TacticalIdentity.fromJson(Map<String, dynamic> json) => _$TacticalIdentityFromJson(json);

@override final  int id;
// ---- Possession / risk profile ----
// 0..1: 0 = very controlled, 1 = very chaotic/risky
@override final  double riskTaking;
// ---- Build-up / progression ----
// 0..1: 0 = short/passive, 1 = direct/vertical
@override final  double directnessBias;
@override final  double verticalProgressionBias;
@override final  double shortPassBias;
// ---- Width / attacking preference ----
// 0..1: 0 = very narrow, 1 = very wide
@override final  double widthBias;
// 0..1 each; consumers may renormalize to sum to 1
@override final  double attackLeftBias;
@override final  double attackCentralBias;
@override final  double attackRightBias;
// ---- Chance type / final third ----
@override final  double throughBallBias;
@override final  double crossBias;
@override final  double cutbackBias;
@override final  double dribbleCreationBias;
@override final  double longShotBias;
// 0..1: 0 = shoot quickly, 1 = patient shot selection
@override final  double shotPatience;
// ---- Defensive shape / pressing ----
// 0..1: 0 = very deep, 1 = very high
@override final  double defensiveLineHeight;
// 0..1: 0 = very low press, 1 = very high press
@override final  double pressIntensityBias;
// 0..1: how often pressing triggers occur
@override final  double pressTriggerRate;
// 0..1: 0 = very narrow, 1 = very wide
@override final  double defensiveWidthBias;
// 0..1: 0 = very loose, 1 = very compact
@override final  double compactnessBias;
// 0..1: 0 = zonal, 1 = man-oriented
@override final  double markingBias;
// 0..1: 0 = cautious, 1 = aggressive
@override final  double tacklingAggressionBias;
// ---- Transitions ----
// 0..1: 0 = always hold/reset, 1 = counter immediately
@override final  double counterTriggerBias;
// 0..1: 0 = fall back, 1 = counterpress always
@override final  double counterpressBias;
// 0..1: 0 = slow, 1 = very fast
@override final  double counterSpeedBias;
// ---- Set pieces ----
// 0..1: 0 = short routines, 1 = delivery to box
@override final  double setPieceAttackingBias;
// 0..1: 0 = zonal, 1 = man-oriented
@override final  double setPieceDefensiveBias;
// ---- Current minute-loop engine-facing knobs ----
// -0.20 .. +0.20 (recommended)
@override final  double possessionTilt;
// Multipliers applied to base event weights.
@override final  double passWeightMult;
@override final  double turnoverWeightMult;
@override final  double shotWeightMult;
// Delta applied to base goal probability (recommended -0.10 .. +0.10).
@override final  double shotConversionDelta;

/// Create a copy of TacticalIdentity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TacticalIdentityCopyWith<_TacticalIdentity> get copyWith => __$TacticalIdentityCopyWithImpl<_TacticalIdentity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TacticalIdentityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TacticalIdentity&&(identical(other.id, id) || other.id == id)&&(identical(other.riskTaking, riskTaking) || other.riskTaking == riskTaking)&&(identical(other.directnessBias, directnessBias) || other.directnessBias == directnessBias)&&(identical(other.verticalProgressionBias, verticalProgressionBias) || other.verticalProgressionBias == verticalProgressionBias)&&(identical(other.shortPassBias, shortPassBias) || other.shortPassBias == shortPassBias)&&(identical(other.widthBias, widthBias) || other.widthBias == widthBias)&&(identical(other.attackLeftBias, attackLeftBias) || other.attackLeftBias == attackLeftBias)&&(identical(other.attackCentralBias, attackCentralBias) || other.attackCentralBias == attackCentralBias)&&(identical(other.attackRightBias, attackRightBias) || other.attackRightBias == attackRightBias)&&(identical(other.throughBallBias, throughBallBias) || other.throughBallBias == throughBallBias)&&(identical(other.crossBias, crossBias) || other.crossBias == crossBias)&&(identical(other.cutbackBias, cutbackBias) || other.cutbackBias == cutbackBias)&&(identical(other.dribbleCreationBias, dribbleCreationBias) || other.dribbleCreationBias == dribbleCreationBias)&&(identical(other.longShotBias, longShotBias) || other.longShotBias == longShotBias)&&(identical(other.shotPatience, shotPatience) || other.shotPatience == shotPatience)&&(identical(other.defensiveLineHeight, defensiveLineHeight) || other.defensiveLineHeight == defensiveLineHeight)&&(identical(other.pressIntensityBias, pressIntensityBias) || other.pressIntensityBias == pressIntensityBias)&&(identical(other.pressTriggerRate, pressTriggerRate) || other.pressTriggerRate == pressTriggerRate)&&(identical(other.defensiveWidthBias, defensiveWidthBias) || other.defensiveWidthBias == defensiveWidthBias)&&(identical(other.compactnessBias, compactnessBias) || other.compactnessBias == compactnessBias)&&(identical(other.markingBias, markingBias) || other.markingBias == markingBias)&&(identical(other.tacklingAggressionBias, tacklingAggressionBias) || other.tacklingAggressionBias == tacklingAggressionBias)&&(identical(other.counterTriggerBias, counterTriggerBias) || other.counterTriggerBias == counterTriggerBias)&&(identical(other.counterpressBias, counterpressBias) || other.counterpressBias == counterpressBias)&&(identical(other.counterSpeedBias, counterSpeedBias) || other.counterSpeedBias == counterSpeedBias)&&(identical(other.setPieceAttackingBias, setPieceAttackingBias) || other.setPieceAttackingBias == setPieceAttackingBias)&&(identical(other.setPieceDefensiveBias, setPieceDefensiveBias) || other.setPieceDefensiveBias == setPieceDefensiveBias)&&(identical(other.possessionTilt, possessionTilt) || other.possessionTilt == possessionTilt)&&(identical(other.passWeightMult, passWeightMult) || other.passWeightMult == passWeightMult)&&(identical(other.turnoverWeightMult, turnoverWeightMult) || other.turnoverWeightMult == turnoverWeightMult)&&(identical(other.shotWeightMult, shotWeightMult) || other.shotWeightMult == shotWeightMult)&&(identical(other.shotConversionDelta, shotConversionDelta) || other.shotConversionDelta == shotConversionDelta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,riskTaking,directnessBias,verticalProgressionBias,shortPassBias,widthBias,attackLeftBias,attackCentralBias,attackRightBias,throughBallBias,crossBias,cutbackBias,dribbleCreationBias,longShotBias,shotPatience,defensiveLineHeight,pressIntensityBias,pressTriggerRate,defensiveWidthBias,compactnessBias,markingBias,tacklingAggressionBias,counterTriggerBias,counterpressBias,counterSpeedBias,setPieceAttackingBias,setPieceDefensiveBias,possessionTilt,passWeightMult,turnoverWeightMult,shotWeightMult,shotConversionDelta]);

@override
String toString() {
  return 'TacticalIdentity(id: $id, riskTaking: $riskTaking, directnessBias: $directnessBias, verticalProgressionBias: $verticalProgressionBias, shortPassBias: $shortPassBias, widthBias: $widthBias, attackLeftBias: $attackLeftBias, attackCentralBias: $attackCentralBias, attackRightBias: $attackRightBias, throughBallBias: $throughBallBias, crossBias: $crossBias, cutbackBias: $cutbackBias, dribbleCreationBias: $dribbleCreationBias, longShotBias: $longShotBias, shotPatience: $shotPatience, defensiveLineHeight: $defensiveLineHeight, pressIntensityBias: $pressIntensityBias, pressTriggerRate: $pressTriggerRate, defensiveWidthBias: $defensiveWidthBias, compactnessBias: $compactnessBias, markingBias: $markingBias, tacklingAggressionBias: $tacklingAggressionBias, counterTriggerBias: $counterTriggerBias, counterpressBias: $counterpressBias, counterSpeedBias: $counterSpeedBias, setPieceAttackingBias: $setPieceAttackingBias, setPieceDefensiveBias: $setPieceDefensiveBias, possessionTilt: $possessionTilt, passWeightMult: $passWeightMult, turnoverWeightMult: $turnoverWeightMult, shotWeightMult: $shotWeightMult, shotConversionDelta: $shotConversionDelta)';
}


}

/// @nodoc
abstract mixin class _$TacticalIdentityCopyWith<$Res> implements $TacticalIdentityCopyWith<$Res> {
  factory _$TacticalIdentityCopyWith(_TacticalIdentity value, $Res Function(_TacticalIdentity) _then) = __$TacticalIdentityCopyWithImpl;
@override @useResult
$Res call({
 int id, double riskTaking, double directnessBias, double verticalProgressionBias, double shortPassBias, double widthBias, double attackLeftBias, double attackCentralBias, double attackRightBias, double throughBallBias, double crossBias, double cutbackBias, double dribbleCreationBias, double longShotBias, double shotPatience, double defensiveLineHeight, double pressIntensityBias, double pressTriggerRate, double defensiveWidthBias, double compactnessBias, double markingBias, double tacklingAggressionBias, double counterTriggerBias, double counterpressBias, double counterSpeedBias, double setPieceAttackingBias, double setPieceDefensiveBias, double possessionTilt, double passWeightMult, double turnoverWeightMult, double shotWeightMult, double shotConversionDelta
});




}
/// @nodoc
class __$TacticalIdentityCopyWithImpl<$Res>
    implements _$TacticalIdentityCopyWith<$Res> {
  __$TacticalIdentityCopyWithImpl(this._self, this._then);

  final _TacticalIdentity _self;
  final $Res Function(_TacticalIdentity) _then;

/// Create a copy of TacticalIdentity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? riskTaking = null,Object? directnessBias = null,Object? verticalProgressionBias = null,Object? shortPassBias = null,Object? widthBias = null,Object? attackLeftBias = null,Object? attackCentralBias = null,Object? attackRightBias = null,Object? throughBallBias = null,Object? crossBias = null,Object? cutbackBias = null,Object? dribbleCreationBias = null,Object? longShotBias = null,Object? shotPatience = null,Object? defensiveLineHeight = null,Object? pressIntensityBias = null,Object? pressTriggerRate = null,Object? defensiveWidthBias = null,Object? compactnessBias = null,Object? markingBias = null,Object? tacklingAggressionBias = null,Object? counterTriggerBias = null,Object? counterpressBias = null,Object? counterSpeedBias = null,Object? setPieceAttackingBias = null,Object? setPieceDefensiveBias = null,Object? possessionTilt = null,Object? passWeightMult = null,Object? turnoverWeightMult = null,Object? shotWeightMult = null,Object? shotConversionDelta = null,}) {
  return _then(_TacticalIdentity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,riskTaking: null == riskTaking ? _self.riskTaking : riskTaking // ignore: cast_nullable_to_non_nullable
as double,directnessBias: null == directnessBias ? _self.directnessBias : directnessBias // ignore: cast_nullable_to_non_nullable
as double,verticalProgressionBias: null == verticalProgressionBias ? _self.verticalProgressionBias : verticalProgressionBias // ignore: cast_nullable_to_non_nullable
as double,shortPassBias: null == shortPassBias ? _self.shortPassBias : shortPassBias // ignore: cast_nullable_to_non_nullable
as double,widthBias: null == widthBias ? _self.widthBias : widthBias // ignore: cast_nullable_to_non_nullable
as double,attackLeftBias: null == attackLeftBias ? _self.attackLeftBias : attackLeftBias // ignore: cast_nullable_to_non_nullable
as double,attackCentralBias: null == attackCentralBias ? _self.attackCentralBias : attackCentralBias // ignore: cast_nullable_to_non_nullable
as double,attackRightBias: null == attackRightBias ? _self.attackRightBias : attackRightBias // ignore: cast_nullable_to_non_nullable
as double,throughBallBias: null == throughBallBias ? _self.throughBallBias : throughBallBias // ignore: cast_nullable_to_non_nullable
as double,crossBias: null == crossBias ? _self.crossBias : crossBias // ignore: cast_nullable_to_non_nullable
as double,cutbackBias: null == cutbackBias ? _self.cutbackBias : cutbackBias // ignore: cast_nullable_to_non_nullable
as double,dribbleCreationBias: null == dribbleCreationBias ? _self.dribbleCreationBias : dribbleCreationBias // ignore: cast_nullable_to_non_nullable
as double,longShotBias: null == longShotBias ? _self.longShotBias : longShotBias // ignore: cast_nullable_to_non_nullable
as double,shotPatience: null == shotPatience ? _self.shotPatience : shotPatience // ignore: cast_nullable_to_non_nullable
as double,defensiveLineHeight: null == defensiveLineHeight ? _self.defensiveLineHeight : defensiveLineHeight // ignore: cast_nullable_to_non_nullable
as double,pressIntensityBias: null == pressIntensityBias ? _self.pressIntensityBias : pressIntensityBias // ignore: cast_nullable_to_non_nullable
as double,pressTriggerRate: null == pressTriggerRate ? _self.pressTriggerRate : pressTriggerRate // ignore: cast_nullable_to_non_nullable
as double,defensiveWidthBias: null == defensiveWidthBias ? _self.defensiveWidthBias : defensiveWidthBias // ignore: cast_nullable_to_non_nullable
as double,compactnessBias: null == compactnessBias ? _self.compactnessBias : compactnessBias // ignore: cast_nullable_to_non_nullable
as double,markingBias: null == markingBias ? _self.markingBias : markingBias // ignore: cast_nullable_to_non_nullable
as double,tacklingAggressionBias: null == tacklingAggressionBias ? _self.tacklingAggressionBias : tacklingAggressionBias // ignore: cast_nullable_to_non_nullable
as double,counterTriggerBias: null == counterTriggerBias ? _self.counterTriggerBias : counterTriggerBias // ignore: cast_nullable_to_non_nullable
as double,counterpressBias: null == counterpressBias ? _self.counterpressBias : counterpressBias // ignore: cast_nullable_to_non_nullable
as double,counterSpeedBias: null == counterSpeedBias ? _self.counterSpeedBias : counterSpeedBias // ignore: cast_nullable_to_non_nullable
as double,setPieceAttackingBias: null == setPieceAttackingBias ? _self.setPieceAttackingBias : setPieceAttackingBias // ignore: cast_nullable_to_non_nullable
as double,setPieceDefensiveBias: null == setPieceDefensiveBias ? _self.setPieceDefensiveBias : setPieceDefensiveBias // ignore: cast_nullable_to_non_nullable
as double,possessionTilt: null == possessionTilt ? _self.possessionTilt : possessionTilt // ignore: cast_nullable_to_non_nullable
as double,passWeightMult: null == passWeightMult ? _self.passWeightMult : passWeightMult // ignore: cast_nullable_to_non_nullable
as double,turnoverWeightMult: null == turnoverWeightMult ? _self.turnoverWeightMult : turnoverWeightMult // ignore: cast_nullable_to_non_nullable
as double,shotWeightMult: null == shotWeightMult ? _self.shotWeightMult : shotWeightMult // ignore: cast_nullable_to_non_nullable
as double,shotConversionDelta: null == shotConversionDelta ? _self.shotConversionDelta : shotConversionDelta // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
