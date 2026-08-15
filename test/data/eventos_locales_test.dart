import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:mi_primer_app/core/json.dart';
import 'package:mi_primer_app/features/eventos/data/eventos_locales.dart';

const _json = '''
[
  {
    "id": "evt-001",
    "nombre": "Concierto de Rock 2026",
    "descripcion": "Una noche de rock.",
    "ubicacion": { "nombreLugar": "Estadio Nacional", "ciudad": "Valledupar", "aforoMaximo": 2000 },
    "fechaEvento": "2026-08-14T19:00:00Z",
    "estado": { "tipo": "borrador" }
  }
]
''';

void main() {
  test('lee la lista completa del archivo', () async {
    final repo = EventosLocales(lector: (_) async => _json);
    expect((await repo.obtenerTodos()).length, 1);
  });

  test('busca por id y devuelve null cuando no está', () async {
    final repo = EventosLocales(lector: (_) async => _json);

    expect(
      (await repo.obtenerPorId('evt-001'))?.nombre,
      'Concierto de Rock 2026',
    );
    expect(await repo.obtenerPorId('no-existe'), isNull);
  });

  test('un archivo que no es una lista se rechaza', () async {
    final repo = EventosLocales(lector: (_) async => '{"a": 1}');
    expect(repo.obtenerTodos(), throwsA(isA<CampoInvalido>()));
  });

  test(
    'el asset declarado en pubspec existe y el modelo lo entiende',
    () async {
      TestWidgetsFlutterBinding.ensureInitialized();

      final repo = EventosLocales(lector: rootBundle.loadString);
      expect((await repo.obtenerTodos()).length, greaterThanOrEqualTo(3));
    },
  );
}
