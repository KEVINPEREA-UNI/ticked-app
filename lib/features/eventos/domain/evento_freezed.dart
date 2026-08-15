import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mi_primer_app/features/eventos/domain/estado_evento.dart';
import 'package:mi_primer_app/features/eventos/domain/ubicacion.dart';

part 'evento_freezed.freezed.dart';
part 'evento_freezed.g.dart';

@freezed
abstract class EventoFreezed with _$EventoFreezed {
  const factory EventoFreezed({
    required String id,
    required String nombre,
    required String descripcion,
    required Ubicacion ubicacion,
    required DateTime fechaEvento,
    required EstadoEvento estado,
    String? afiche,
  }) = _EventoFreezed;

  /// Sin este constructor privado, freezed NO deja añadir métodos propios.
  const EventoFreezed._();

  factory EventoFreezed.fromJson(Map<String, dynamic> json) =>
      _$EventoFreezedFromJson(json);

  // Las reglas de negocio siguen siendo tuyas: freezed no las toca.
  bool get tieneAfiche => afiche != null;

  bool get sePuedeVender => estado.sePuedeVender;

  bool yaOcurrio(DateTime ahora) => ahora.isAfter(fechaEvento);
}
