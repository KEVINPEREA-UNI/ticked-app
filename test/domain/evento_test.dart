import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mi_primer_app/core/json.dart';
import 'package:mi_primer_app/features/eventos/domain/estado_evento.dart';
import 'package:mi_primer_app/features/eventos/domain/evento.dart';
import 'package:mi_primer_app/features/eventos/domain/ubicacion.dart';

Evento ejemplo({EstadoEvento? estado, String? afiche}) => Evento(
  id: 'evt-001',
  nombre: 'Concierto de Rock 2026',
  descripcion: 'Vive una noche inolvidable con las mejores bandas.',
  ubicacion: const Ubicacion(
    nombreLugar: 'Estadio Nacional',
    ciudad: 'Valledupar',
    aforoMaximo: 2000,
  ),
  fechaEvento: DateTime.utc(2026, 8, 14, 19, 0),
  estado: estado ?? const Borrador(),
  afiche: afiche,
);

void main() {
  group('serialización', () {
    test('un evento sobrevive la ida y vuelta a JSON sin perder nada', () {
      final original = ejemplo(
        estado: Publicado(DateTime.utc(2026, 6, 1, 10, 0)),
        afiche: 'https://ticked.co/img/concierto-rock.jpg',
      );

      final texto = jsonEncode(original.toJson());
      final vuelta = Evento.fromJson(jsonDecode(texto) as Map<String, dynamic>);

      expect(vuelta, equals(original));
    });

    test('un evento sin la clave afiche se lee con afiche nulo', () {
      final json = ejemplo().toJson()..remove('afiche');
      expect(Evento.fromJson(json).afiche, isNull);
    });

    test('un evento sin nombre dice QUÉ campo falló, no solo que falló', () {
      final json = ejemplo().toJson()..remove('nombre');

      expect(
        () => Evento.fromJson(json),
        throwsA(isA<CampoInvalido>().having((e) => e.campo, 'campo', 'nombre')),
      );
    });

    test('una fecha que no es ISO 8601 se rechaza', () {
      final json = ejemplo().toJson()..['fechaEvento'] = '14 de agosto';
      expect(() => Evento.fromJson(json), throwsA(isA<CampoInvalido>()));
    });

    test('la hora se conserva en UTC y no se corre cinco horas', () {
      final json = ejemplo().toJson();
      expect(json['fechaEvento'], '2026-08-14T19:00:00.000Z');
    });
  });

  group('igualdad', () {
    test('dos eventos con los mismos datos son iguales', () {
      expect(ejemplo(), equals(ejemplo()));
    });

    test('dos eventos con los mismos datos comparten hashCode', () {
      expect(ejemplo().hashCode, equals(ejemplo().hashCode));
      expect({ejemplo(), ejemplo()}.length, 1);
    });

    test('dos eventos con distinto afiche NO son iguales', () {
      expect(ejemplo(afiche: 'a.jpg'), isNot(equals(ejemplo(afiche: 'b.jpg'))));
    });

    test('copyWith cambia solo lo que se le pasa', () {
      final original = ejemplo();
      final copia = original.copyWith(nombre: 'Otro nombre');

      expect(copia.nombre, 'Otro nombre');
      expect(copia.id, original.id);
      expect(copia.fechaEvento, original.fechaEvento);
    });
  });

  group('reglas de negocio', () {
    test('un evento en borrador no se puede vender', () {
      expect(ejemplo(estado: const Borrador()).sePuedeVender, isFalse);
    });

    test('un evento publicado sí se puede vender', () {
      expect(
        ejemplo(estado: Publicado(DateTime.utc(2026, 6, 1))).sePuedeVender,
        isTrue,
      );
    });

    test('un evento con fecha pasada ya ocurrió', () {
      final ahora = DateTime.utc(2026, 9, 1);
      expect(ejemplo().yaOcurrio(ahora), isTrue);
    });

    test('la etiqueta de un evento cancelado incluye el motivo', () {
      expect(const Cancelado('Lluvia').etiqueta, contains('Lluvia'));
    });
  });
}
