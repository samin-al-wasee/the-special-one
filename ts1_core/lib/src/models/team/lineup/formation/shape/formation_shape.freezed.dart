// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'formation_shape.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FormationShape {

 int get id; String get code; List<FormationSlot> get slotDefinitions; Map<String, double> get structuralTags;
/// Create a copy of FormationShape
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FormationShapeCopyWith<FormationShape> get copyWith => _$FormationShapeCopyWithImpl<FormationShape>(this as FormationShape, _$identity);

  /// Serializes this FormationShape to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FormationShape&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&const DeepCollectionEquality().equals(other.slotDefinitions, slotDefinitions)&&const DeepCollectionEquality().equals(other.structuralTags, structuralTags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,const DeepCollectionEquality().hash(slotDefinitions),const DeepCollectionEquality().hash(structuralTags));

@override
String toString() {
  return 'FormationShape(id: $id, code: $code, slotDefinitions: $slotDefinitions, structuralTags: $structuralTags)';
}


}

/// @nodoc
abstract mixin class $FormationShapeCopyWith<$Res>  {
  factory $FormationShapeCopyWith(FormationShape value, $Res Function(FormationShape) _then) = _$FormationShapeCopyWithImpl;
@useResult
$Res call({
 int id, String code, List<FormationSlot> slotDefinitions, Map<String, double> structuralTags
});




}
/// @nodoc
class _$FormationShapeCopyWithImpl<$Res>
    implements $FormationShapeCopyWith<$Res> {
  _$FormationShapeCopyWithImpl(this._self, this._then);

  final FormationShape _self;
  final $Res Function(FormationShape) _then;

/// Create a copy of FormationShape
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? code = null,Object? slotDefinitions = null,Object? structuralTags = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,slotDefinitions: null == slotDefinitions ? _self.slotDefinitions : slotDefinitions // ignore: cast_nullable_to_non_nullable
as List<FormationSlot>,structuralTags: null == structuralTags ? _self.structuralTags : structuralTags // ignore: cast_nullable_to_non_nullable
as Map<String, double>,
  ));
}

}


/// Adds pattern-matching-related methods to [FormationShape].
extension FormationShapePatterns on FormationShape {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FormationShape value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FormationShape() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FormationShape value)  $default,){
final _that = this;
switch (_that) {
case _FormationShape():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FormationShape value)?  $default,){
final _that = this;
switch (_that) {
case _FormationShape() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String code,  List<FormationSlot> slotDefinitions,  Map<String, double> structuralTags)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FormationShape() when $default != null:
return $default(_that.id,_that.code,_that.slotDefinitions,_that.structuralTags);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String code,  List<FormationSlot> slotDefinitions,  Map<String, double> structuralTags)  $default,) {final _that = this;
switch (_that) {
case _FormationShape():
return $default(_that.id,_that.code,_that.slotDefinitions,_that.structuralTags);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String code,  List<FormationSlot> slotDefinitions,  Map<String, double> structuralTags)?  $default,) {final _that = this;
switch (_that) {
case _FormationShape() when $default != null:
return $default(_that.id,_that.code,_that.slotDefinitions,_that.structuralTags);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FormationShape extends FormationShape {
  const _FormationShape({required this.id, required this.code, required final  List<FormationSlot> slotDefinitions, final  Map<String, double> structuralTags = const {}}): _slotDefinitions = slotDefinitions,_structuralTags = structuralTags,super._();
  factory _FormationShape.fromJson(Map<String, dynamic> json) => _$FormationShapeFromJson(json);

@override final  int id;
@override final  String code;
 final  List<FormationSlot> _slotDefinitions;
@override List<FormationSlot> get slotDefinitions {
  if (_slotDefinitions is EqualUnmodifiableListView) return _slotDefinitions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_slotDefinitions);
}

 final  Map<String, double> _structuralTags;
@override@JsonKey() Map<String, double> get structuralTags {
  if (_structuralTags is EqualUnmodifiableMapView) return _structuralTags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_structuralTags);
}


/// Create a copy of FormationShape
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FormationShapeCopyWith<_FormationShape> get copyWith => __$FormationShapeCopyWithImpl<_FormationShape>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FormationShapeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FormationShape&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&const DeepCollectionEquality().equals(other._slotDefinitions, _slotDefinitions)&&const DeepCollectionEquality().equals(other._structuralTags, _structuralTags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,const DeepCollectionEquality().hash(_slotDefinitions),const DeepCollectionEquality().hash(_structuralTags));

@override
String toString() {
  return 'FormationShape(id: $id, code: $code, slotDefinitions: $slotDefinitions, structuralTags: $structuralTags)';
}


}

/// @nodoc
abstract mixin class _$FormationShapeCopyWith<$Res> implements $FormationShapeCopyWith<$Res> {
  factory _$FormationShapeCopyWith(_FormationShape value, $Res Function(_FormationShape) _then) = __$FormationShapeCopyWithImpl;
@override @useResult
$Res call({
 int id, String code, List<FormationSlot> slotDefinitions, Map<String, double> structuralTags
});




}
/// @nodoc
class __$FormationShapeCopyWithImpl<$Res>
    implements _$FormationShapeCopyWith<$Res> {
  __$FormationShapeCopyWithImpl(this._self, this._then);

  final _FormationShape _self;
  final $Res Function(_FormationShape) _then;

/// Create a copy of FormationShape
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? code = null,Object? slotDefinitions = null,Object? structuralTags = null,}) {
  return _then(_FormationShape(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,slotDefinitions: null == slotDefinitions ? _self._slotDefinitions : slotDefinitions // ignore: cast_nullable_to_non_nullable
as List<FormationSlot>,structuralTags: null == structuralTags ? _self._structuralTags : structuralTags // ignore: cast_nullable_to_non_nullable
as Map<String, double>,
  ));
}


}

// dart format on
