import 'package:flutter/material.dart';
import 'package:mi_primer_app/features/eventos/data/eventos_locales.dart';
import 'package:mi_primer_app/features/eventos/domain/evento.dart';

void main() => runApp(const MiApp());

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Ticked',
    theme: ThemeData(colorSchemeSeed: Colors.deepOrange),
    home: const PantallaEventos(),
  );
}

class PantallaEventos extends StatefulWidget {
  const PantallaEventos({super.key});

  @override
  State<PantallaEventos> createState() => _PantallaEventosState();
}

class _PantallaEventosState extends State<PantallaEventos> {
  late final Future<List<Evento>> _eventos = EventosLocales().obtenerTodos();

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Eventos')),
    body: FutureBuilder<List<Evento>>(
      future: _eventos,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('No se pudo leer:\n${snapshot.error}'));
        }

        final eventos = snapshot.data ?? const <Evento>[];
        return ListView.separated(
          itemCount: eventos.length,
          separatorBuilder: (_, _) => const Divider(height: 1),
          itemBuilder: (context, i) {
            final evento = eventos[i];
            return ListTile(
              title: Text(evento.nombre),
              subtitle: Text(
                '${evento.ubicacion.ciudad} · ${evento.estado.etiqueta}',
              ),
              trailing: evento.tieneAfiche
                  ? const Icon(Icons.image_outlined)
                  : null,
            );
          },
        );
      },
    ),
  );
}
