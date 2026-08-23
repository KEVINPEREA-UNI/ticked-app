import 'package:flutter/material.dart';
import 'package:mi_primer_app/core/design_tokens.dart';

/// Ancho a partir del cual mostramos el sidebar fijo.
/// Por debajo de esto, se oculta detrás de un Drawer.
const double _anchoDeCorte = 720;

class PantallaGestionEventos extends StatelessWidget {
  const PantallaGestionEventos({super.key});

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      final esAncho = constraints.maxWidth >= _anchoDeCorte;

      if (esAncho) {
        // Pantalla ancha (web/escritorio): sidebar fijo, como el original.
        return Scaffold(
          body: Row(
            children: [
              const _Sidebar(),
              const Expanded(
                child: SingleChildScrollView(child: _ContenidoPrincipal()),
              ),
            ],
          ),
        );
      }

      // Pantalla angosta (celular): sidebar escondido en un Drawer.
      return Scaffold(
        appBar: AppBar(title: const Text('Eventos')),
        drawer: const Drawer(child: _Sidebar()),
        body: const SingleChildScrollView(child: _ContenidoPrincipal()),
      );
    },
  );
}

/// La franja oscura de navegación.
class _Sidebar extends StatelessWidget {
  const _Sidebar();

  @override
  Widget build(BuildContext context) => Container(
    width: 220,
    color: Colors.indigo.shade900,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _PerfilAdmin(),
        const Divider(color: Colors.white24, height: 1),
        const SizedBox(height: Space.sm),
        const _NavItem(icono: Icons.home_outlined, texto: 'Inicio'),
        const _NavItem(
          icono: Icons.event_outlined,
          texto: 'Eventos',
          activo: true,
        ),
        const _NavItem(icono: Icons.point_of_sale_outlined, texto: 'Ventas'),
        const _NavItem(icono: Icons.bar_chart_outlined, texto: 'Reportes'),
        const Divider(color: Colors.white24, height: 1),
        const SizedBox(height: Space.sm),
        const _NavItem(
          icono: Icons.people_outline,
          texto: 'Gestión de Usuarios',
        ),
      ],
    ),
  );
}

/// Avatar + nombre + correo del administrador.
class _PerfilAdmin extends StatelessWidget {
  const _PerfilAdmin();

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(Space.md),
    child: Row(
      children: [
        const CircleAvatar(radius: Space.lg, child: Icon(Icons.person)),
        const SizedBox(width: Space.sm),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Administrador',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                'admin@ticked.co',
                style: Theme.of(context).textTheme.bodySmall,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

/// Un ítem de navegación del sidebar.
class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icono,
    required this.texto,
    this.activo = false,
  });

  final IconData icono;
  final String texto;
  final bool activo;

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.symmetric(horizontal: Space.sm, vertical: 2),
    padding: const EdgeInsets.symmetric(
      horizontal: Space.sm,
      vertical: Space.sm,
    ),
    decoration: BoxDecoration(
      color: activo ? Colors.white24 : null,
      borderRadius: BorderRadius.circular(Space.xs),
    ),
    child: Row(
      children: [
        Icon(icono, color: Colors.white, size: Space.lg),
        const SizedBox(width: Space.sm),
        Expanded(
          child: Text(texto, style: const TextStyle(color: Colors.white)),
        ),
      ],
    ),
  );
}

/// Todo el contenido a la derecha (o debajo del AppBar en celular):
/// header, búsqueda y la tarjeta de evento.
class _ContenidoPrincipal extends StatelessWidget {
  const _ContenidoPrincipal();

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(Space.lg),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _EncabezadoEventos(),
        const SizedBox(height: Space.lg),
        const _BarraBusqueda(),
        const SizedBox(height: Space.lg),
        const _EventoCard(
          titulo: 'Concierto de Rock 2026',
          fecha: '14 Ago, 2026',
          ubicacion: 'Estadio Nacional',
          organizador: 'Jose Rodriguez',
          precio: '\$100.000',
        ),
      ],
    ),
  );
}

/// Título + subtítulo, y el botón "+ Crear Evento".
/// Usa Wrap en vez de un Row rígido: si no cabe todo en una línea,
/// el botón baja a la siguiente en vez de forzar el desbordamiento.
class _EncabezadoEventos extends StatelessWidget {
  const _EncabezadoEventos();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Wrap(
      spacing: Space.md,
      runSpacing: Space.sm,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Gestión de Eventos', style: theme.textTheme.headlineSmall),
            Text(
              'Administra todos los eventos del sistema',
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
        FilledButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text('Crear Evento'),
        ),
      ],
    );
  }
}

/// La barra de búsqueda de eventos.
class _BarraBusqueda extends StatelessWidget {
  const _BarraBusqueda();

  @override
  Widget build(BuildContext context) => TextField(
    decoration: InputDecoration(
      hintText: 'Buscar eventos por nombre o lugar...',
      prefixIcon: const Icon(Icons.search),
      filled: true,
      fillColor: Theme.of(context).colorScheme.surface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Space.sm),
        borderSide: BorderSide.none,
      ),
    ),
  );
}

/// Una tarjeta de evento, con imagen, datos y organizador.
class _EventoCard extends StatelessWidget {
  const _EventoCard({
    required this.titulo,
    required this.fecha,
    required this.ubicacion,
    required this.organizador,
    required this.precio,
  });

  final String titulo;
  final String fecha;
  final String ubicacion;
  final String organizador;
  final String precio;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: 260,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 140,
              color: theme.colorScheme.surfaceContainerHighest,
              child: const Icon(Icons.image_outlined, size: Space.xl),
            ),
            Padding(
              padding: const EdgeInsets.all(Space.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(titulo, style: theme.textTheme.titleMedium),
                  const SizedBox(height: Space.xs),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, size: Space.sm),
                      const SizedBox(width: Space.xs),
                      Text(fecha, style: theme.textTheme.bodySmall),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined, size: Space.sm),
                      const SizedBox(width: Space.xs),
                      Text(ubicacion, style: theme.textTheme.bodySmall),
                    ],
                  ),
                  const SizedBox(height: Space.xs),
                  Text('Organizador', style: theme.textTheme.labelSmall),
                  Text(organizador, style: theme.textTheme.bodySmall),
                  const SizedBox(height: Space.xs),
                  Text('General $precio', style: theme.textTheme.bodyMedium),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
