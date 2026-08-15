import 'package:mi_primer_app/core/json.dart';

class Ubicacion {
  const Ubicacion({
    required this.nombreLugar,
    required this.ciudad,
    required this.aforoMaximo,
  });

  factory Ubicacion.fromJson(Map<String, dynamic> json) => Ubicacion(
    nombreLugar: leerTexto(json, 'nombreLugar'),
    ciudad: leerTexto(json, 'ciudad'),
    aforoMaximo: leerEntero(json, 'aforoMaximo'),
  );

  final String nombreLugar;
  final String ciudad;
  final int aforoMaximo;

  Map<String, dynamic> toJson() => {
    'nombreLugar': nombreLugar,
    'ciudad': ciudad,
    'aforoMaximo': aforoMaximo,
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Ubicacion &&
          other.nombreLugar == nombreLugar &&
          other.ciudad == ciudad &&
          other.aforoMaximo == aforoMaximo;

  @override
  int get hashCode => Object.hash(nombreLugar, ciudad, aforoMaximo);

  @override
  String toString() => 'Ubicacion($nombreLugar, $ciudad, aforo: $aforoMaximo)';
}
