import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:mi_primer_app/core/json.dart';
import 'package:mi_primer_app/features/eventos/domain/evento.dart';
import 'package:mi_primer_app/features/eventos/domain/eventos_repository.dart';

typedef LectorDeAssets = Future<String> Function(String ruta);

class EventosLocales implements EventosRepository {
  EventosLocales({
    LectorDeAssets? lector,
    this.ruta = 'assets/data/eventos.json',
  }) : _lector = lector ?? rootBundle.loadString;

  final LectorDeAssets _lector;
  final String ruta;

  List<Evento>? _cache;

  @override
  Future<List<Evento>> obtenerTodos() async {
    final guardado = _cache;
    if (guardado != null) return guardado;

    final crudo = await _lector(ruta);
    final decodificado = jsonDecode(crudo);

    if (decodificado is! List) {
      throw const CampoInvalido(
        '(raíz)',
        'el archivo debe contener una lista',
        null,
      );
    }

    return _cache = decodificado
        .map((e) => Evento.fromJson(e as Map<String, dynamic>))
        .toList(growable: false);
  }

  @override
  Future<Evento?> obtenerPorId(String id) async {
    for (final evento in await obtenerTodos()) {
      if (evento.id == id) return evento;
    }
    return null;
  }
}
