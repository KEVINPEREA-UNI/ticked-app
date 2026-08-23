import 'package:flutter/material.dart';
import 'package:mi_primer_app/features/eventos/presentation/pantalla_gestion_eventos.dart';

void main() => runApp(const MiApp());

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Ticked',
    theme: ThemeData(colorSchemeSeed: Colors.deepOrange),
    home: const PantallaGestionEventos(),
  );
}
