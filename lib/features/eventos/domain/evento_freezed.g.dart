// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evento_freezed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EventoFreezed _$EventoFreezedFromJson(Map<String, dynamic> json) =>
    _EventoFreezed(
      id: json['id'] as String,
      nombre: json['nombre'] as String,
      descripcion: json['descripcion'] as String,
      ubicacion: Ubicacion.fromJson(json['ubicacion'] as Map<String, dynamic>),
      fechaEvento: DateTime.parse(json['fechaEvento'] as String),
      estado: EstadoEvento.fromJson(json['estado'] as Map<String, dynamic>),
      afiche: json['afiche'] as String?,
    );

Map<String, dynamic> _$EventoFreezedToJson(_EventoFreezed instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nombre': instance.nombre,
      'descripcion': instance.descripcion,
      'ubicacion': instance.ubicacion,
      'fechaEvento': instance.fechaEvento.toIso8601String(),
      'estado': instance.estado,
      'afiche': instance.afiche,
    };
