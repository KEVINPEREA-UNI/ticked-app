// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'evento_freezed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EventoFreezed {

 String get id; String get nombre; String get descripcion; Ubicacion get ubicacion; DateTime get fechaEvento; EstadoEvento get estado; String? get afiche;
/// Create a copy of EventoFreezed
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventoFreezedCopyWith<EventoFreezed> get copyWith => _$EventoFreezedCopyWithImpl<EventoFreezed>(this as EventoFreezed, _$identity);

  /// Serializes this EventoFreezed to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventoFreezed&&(identical(other.id, id) || other.id == id)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.descripcion, descripcion) || other.descripcion == descripcion)&&(identical(other.ubicacion, ubicacion) || other.ubicacion == ubicacion)&&(identical(other.fechaEvento, fechaEvento) || other.fechaEvento == fechaEvento)&&(identical(other.estado, estado) || other.estado == estado)&&(identical(other.afiche, afiche) || other.afiche == afiche));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nombre,descripcion,ubicacion,fechaEvento,estado,afiche);

@override
String toString() {
  return 'EventoFreezed(id: $id, nombre: $nombre, descripcion: $descripcion, ubicacion: $ubicacion, fechaEvento: $fechaEvento, estado: $estado, afiche: $afiche)';
}


}

/// @nodoc
abstract mixin class $EventoFreezedCopyWith<$Res>  {
  factory $EventoFreezedCopyWith(EventoFreezed value, $Res Function(EventoFreezed) _then) = _$EventoFreezedCopyWithImpl;
@useResult
$Res call({
 String id, String nombre, String descripcion, Ubicacion ubicacion, DateTime fechaEvento, EstadoEvento estado, String? afiche
});




}
/// @nodoc
class _$EventoFreezedCopyWithImpl<$Res>
    implements $EventoFreezedCopyWith<$Res> {
  _$EventoFreezedCopyWithImpl(this._self, this._then);

  final EventoFreezed _self;
  final $Res Function(EventoFreezed) _then;

/// Create a copy of EventoFreezed
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? nombre = null,Object? descripcion = null,Object? ubicacion = null,Object? fechaEvento = null,Object? estado = null,Object? afiche = freezed,}) {
  return _then(EventoFreezed(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,descripcion: null == descripcion ? _self.descripcion : descripcion // ignore: cast_nullable_to_non_nullable
as String,ubicacion: null == ubicacion ? _self.ubicacion : ubicacion // ignore: cast_nullable_to_non_nullable
as Ubicacion,fechaEvento: null == fechaEvento ? _self.fechaEvento : fechaEvento // ignore: cast_nullable_to_non_nullable
as DateTime,estado: null == estado ? _self.estado : estado // ignore: cast_nullable_to_non_nullable
as EstadoEvento,afiche: freezed == afiche ? _self.afiche : afiche // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EventoFreezed].
extension EventoFreezedPatterns on EventoFreezed {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EventoFreezed value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventoFreezed() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EventoFreezed value)  $default,){
final _that = this;
switch (_that) {
case _EventoFreezed():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EventoFreezed value)?  $default,){
final _that = this;
switch (_that) {
case _EventoFreezed() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String nombre,  String descripcion,  Ubicacion ubicacion,  DateTime fechaEvento,  EstadoEvento estado,  String? afiche)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EventoFreezed() when $default != null:
return $default(_that.id,_that.nombre,_that.descripcion,_that.ubicacion,_that.fechaEvento,_that.estado,_that.afiche);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String nombre,  String descripcion,  Ubicacion ubicacion,  DateTime fechaEvento,  EstadoEvento estado,  String? afiche)  $default,) {final _that = this;
switch (_that) {
case _EventoFreezed():
return $default(_that.id,_that.nombre,_that.descripcion,_that.ubicacion,_that.fechaEvento,_that.estado,_that.afiche);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String nombre,  String descripcion,  Ubicacion ubicacion,  DateTime fechaEvento,  EstadoEvento estado,  String? afiche)?  $default,) {final _that = this;
switch (_that) {
case _EventoFreezed() when $default != null:
return $default(_that.id,_that.nombre,_that.descripcion,_that.ubicacion,_that.fechaEvento,_that.estado,_that.afiche);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EventoFreezed extends EventoFreezed {
  const _EventoFreezed({required this.id, required this.nombre, required this.descripcion, required this.ubicacion, required this.fechaEvento, required this.estado, this.afiche}): super._();
  factory _EventoFreezed.fromJson(Map<String, dynamic> json) => _$EventoFreezedFromJson(json);

@override final  String id;
@override final  String nombre;
@override final  String descripcion;
@override final  Ubicacion ubicacion;
@override final  DateTime fechaEvento;
@override final  EstadoEvento estado;
@override final  String? afiche;

/// Create a copy of EventoFreezed
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventoFreezedCopyWith<_EventoFreezed> get copyWith => __$EventoFreezedCopyWithImpl<_EventoFreezed>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EventoFreezedToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventoFreezed&&(identical(other.id, id) || other.id == id)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.descripcion, descripcion) || other.descripcion == descripcion)&&(identical(other.ubicacion, ubicacion) || other.ubicacion == ubicacion)&&(identical(other.fechaEvento, fechaEvento) || other.fechaEvento == fechaEvento)&&(identical(other.estado, estado) || other.estado == estado)&&(identical(other.afiche, afiche) || other.afiche == afiche));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nombre,descripcion,ubicacion,fechaEvento,estado,afiche);

@override
String toString() {
  return 'EventoFreezed(id: $id, nombre: $nombre, descripcion: $descripcion, ubicacion: $ubicacion, fechaEvento: $fechaEvento, estado: $estado, afiche: $afiche)';
}


}

/// @nodoc
abstract mixin class _$EventoFreezedCopyWith<$Res> implements $EventoFreezedCopyWith<$Res> {
  factory _$EventoFreezedCopyWith(_EventoFreezed value, $Res Function(_EventoFreezed) _then) = __$EventoFreezedCopyWithImpl;
@override @useResult
$Res call({
 String id, String nombre, String descripcion, Ubicacion ubicacion, DateTime fechaEvento, EstadoEvento estado, String? afiche
});




}
/// @nodoc
class __$EventoFreezedCopyWithImpl<$Res>
    implements _$EventoFreezedCopyWith<$Res> {
  __$EventoFreezedCopyWithImpl(this._self, this._then);

  final _EventoFreezed _self;
  final $Res Function(_EventoFreezed) _then;

/// Create a copy of EventoFreezed
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nombre = null,Object? descripcion = null,Object? ubicacion = null,Object? fechaEvento = null,Object? estado = null,Object? afiche = freezed,}) {
  return _then(_EventoFreezed(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,descripcion: null == descripcion ? _self.descripcion : descripcion // ignore: cast_nullable_to_non_nullable
as String,ubicacion: null == ubicacion ? _self.ubicacion : ubicacion // ignore: cast_nullable_to_non_nullable
as Ubicacion,fechaEvento: null == fechaEvento ? _self.fechaEvento : fechaEvento // ignore: cast_nullable_to_non_nullable
as DateTime,estado: null == estado ? _self.estado : estado // ignore: cast_nullable_to_non_nullable
as EstadoEvento,afiche: freezed == afiche ? _self.afiche : afiche // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
