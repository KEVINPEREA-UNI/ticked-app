import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mi_primer_app/main.dart';

void main() {
  testWidgets('la app arranca y muestra el título Eventos', (tester) async {
    await tester.pumpWidget(const MiApp());

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await tester.pumpAndSettle();

    expect(find.text('Eventos'), findsOneWidget);
  });
}
