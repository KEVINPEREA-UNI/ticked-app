import 'package:mi_primer_app/core/json.dart';

sealed class EstadoEvento {
  const EstadoEvento();

  factory EstadoEvento.fromJson(Map<String, dynamic> json) {
    final tipo = leerTexto(json, 'tipo');
    return switch (tipo) {
      'borrador' => const Borrador(),
      'publicado' => Publicado(leerFecha(json, 'fechaPublicacion')),
      'agotado' => Agotado(leerFecha(json, 'fechaAgotado')),
      'finalizado' => Finalizado(
        leerFecha(json, 'fechaFin'),
        leerEntero(json, 'asistentesTotales'),
      ),
      'cancelado' => Cancelado(leerTexto(json, 'motivo')),
      _ => throw CampoInvalido('estado.tipo', 'no es un estado conocido', tipo),
    };
  }

  Map<String, dynamic> toJson() => switch (this) {
    Borrador() => {'tipo': 'borrador'},
    Publicado(:final fechaPublicacion) => {
      'tipo': 'publicado',
      'fechaPublicacion': fechaPublicacion.toIso8601String(),
    },
    Agotado(:final fechaAgotado) => {
      'tipo': 'agotado',
      'fechaAgotado': fechaAgotado.toIso8601String(),
    },
    Finalizado(:final fechaFin, :final asistentesTotales) => {
      'tipo': 'finalizado',
      'fechaFin': fechaFin.toIso8601String(),
      'asistentesTotales': asistentesTotales,
    },
    Cancelado(:final motivo) => {'tipo': 'cancelado', 'motivo': motivo},
  };

  bool get sePuedeVender => switch (this) {
    Publicado() => true,
    Borrador() || Agotado() || Finalizado() || Cancelado() => false,
  };

  String get etiqueta => switch (this) {
    Borrador() => 'Borrador',
    Publicado() => 'Publicado',
    Agotado() => 'Agotado',
    Finalizado() => 'Finalizado',
    Cancelado(:final motivo) => 'Cancelado: $motivo',
  };
}

final class Borrador extends EstadoEvento {
  const Borrador();

  @override
  bool operator ==(Object other) => other is Borrador;

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() => 'Borrador()';
}

final class Publicado extends EstadoEvento {
  const Publicado(this.fechaPublicacion);

  final DateTime fechaPublicacion;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Publicado && other.fechaPublicacion == fechaPublicacion;

  @override
  int get hashCode => Object.hash(runtimeType, fechaPublicacion);

  @override
  String toString() => 'Publicado($fechaPublicacion)';
}

final class Agotado extends EstadoEvento {
  const Agotado(this.fechaAgotado);

  final DateTime fechaAgotado;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Agotado && other.fechaAgotado == fechaAgotado;

  @override
  int get hashCode => Object.hash(runtimeType, fechaAgotado);

  @override
  String toString() => 'Agotado($fechaAgotado)';
}

final class Finalizado extends EstadoEvento {
  const Finalizado(this.fechaFin, this.asistentesTotales);

  final DateTime fechaFin;
  final int asistentesTotales;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Finalizado &&
          other.fechaFin == fechaFin &&
          other.asistentesTotales == asistentesTotales;

  @override
  int get hashCode => Object.hash(runtimeType, fechaFin, asistentesTotales);

  @override
  String toString() => 'Finalizado($fechaFin, $asistentesTotales asistentes)';
}

final class Cancelado extends EstadoEvento {
  const Cancelado(this.motivo) : assert(motivo != '', 'cancelar exige motivo');

  final String motivo;
  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Cancelado && other.motivo == motivo;

  @override
  int get hashCode => Object.hash(runtimeType, motivo);

  @override
  String toString() => 'Cancelado($motivo)';
}
