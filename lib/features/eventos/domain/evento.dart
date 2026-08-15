import 'package:mi_primer_app/core/json.dart';
import 'package:mi_primer_app/features/eventos/domain/estado_evento.dart';
import 'package:mi_primer_app/features/eventos/domain/ubicacion.dart';

class Evento {
  const Evento({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.ubicacion,
    required this.fechaEvento,
    required this.estado,
    this.afiche,
  });

  factory Evento.fromJson(Map<String, dynamic> json) => Evento(
    id: leerTexto(json, 'id'),
    nombre: leerTexto(json, 'nombre'),
    descripcion: leerTexto(json, 'descripcion'),
    ubicacion: Ubicacion.fromJson(leerMapa(json, 'ubicacion')),
    fechaEvento: leerFecha(json, 'fechaEvento'),
    estado: EstadoEvento.fromJson(leerMapa(json, 'estado')),
    afiche: leerTextoOpcional(json, 'afiche'),
  );

  final String id;
  final String nombre;
  final String descripcion;
  final Ubicacion ubicacion;
  final DateTime fechaEvento;
  final EstadoEvento estado;
  final String? afiche;

  Map<String, dynamic> toJson() => {
    'id': id,
    'nombre': nombre,
    'descripcion': descripcion,
    'ubicacion': ubicacion.toJson(),
    'fechaEvento': fechaEvento.toUtc().toIso8601String(),
    'estado': estado.toJson(),
    if (afiche != null) 'afiche': afiche,
  };

  bool get tieneAfiche => afiche != null;

  bool get sePuedeVender => estado.sePuedeVender;

  bool yaOcurrio(DateTime ahora) => ahora.isAfter(fechaEvento);

  Duration tiempoRestante(DateTime ahora) => fechaEvento.difference(ahora);

  Evento copyWith({
    String? nombre,
    String? descripcion,
    Ubicacion? ubicacion,
    EstadoEvento? estado,
    String? afiche,
  }) => Evento(
    id: id,
    nombre: nombre ?? this.nombre,
    descripcion: descripcion ?? this.descripcion,
    ubicacion: ubicacion ?? this.ubicacion,
    fechaEvento: fechaEvento,
    estado: estado ?? this.estado,
    afiche: afiche ?? this.afiche,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Evento &&
          other.id == id &&
          other.nombre == nombre &&
          other.descripcion == descripcion &&
          other.ubicacion == ubicacion &&
          other.fechaEvento == fechaEvento &&
          other.estado == estado &&
          other.afiche == afiche;

  @override
  int get hashCode => Object.hash(
    id,
    nombre,
    descripcion,
    ubicacion,
    fechaEvento,
    estado,
    afiche,
  );

  @override
  String toString() => 'Evento($id, $nombre, ${estado.etiqueta})';
}
