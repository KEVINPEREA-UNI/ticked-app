import 'package:mi_primer_app/features/eventos/domain/evento.dart';

abstract interface class EventosRepository {
  Future<List<Evento>> obtenerTodos();

  Future<Evento?> obtenerPorId(String id);
}
