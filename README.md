# Ticked

Aplicación movil hecha en Flutter para consultar una lista de eventos desde datos locales en formato JSON.

## Descripción

La app muestra eventos con su nombre, ciudad, estado y si cuentan con afiche. La información se carga desde `assets/data/eventos.json`, y la pantalla principal presenta una lista con los eventos disponibles.

## Tecnologías

- Flutter
- Dart
- Material Design
- JSON local

## Estructura principal

```text
lib/
├── main.dart
├── core/
│   └── json.dart
└── features/
    └── eventos/
        ├── data/
        ├── domain/
        └── presentation/

assets/
└── data/
    └── eventos.json
```

## Requisitos

- Flutter SDK compatible con `sdk: ^3.12.2`
- Dart 3
- Android Studio, VS Code o un emulador/dispositivo disponible

## Cómo ejecutar

1. Entra a la carpeta del proyecto.
2. Instala dependencias:

```bash
flutter pub get
```

3. Ejecuta la aplicación:

```bash
flutter run
```

4. Selecciona un emulador o dispositivo conectado.

## Validación

Para correr las pruebas:

```bash
flutter test
```

## Características

- Lista de eventos cargados desde JSON
- Vista principal con `ListView`
- Informacion de ubicacion y estado del evento
- Indicador visual cuando un evento tiene afiche
- Tema base con color naranja

## Notas

Este proyecto sirve como base para una app de eventos y puede ampliarse con filtros, detalle de evento, búsqueda, favoritos y más funcionalidades.
