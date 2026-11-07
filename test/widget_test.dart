import 'package:flutter_test/flutter_test.dart';
import 'package:parcial_flutter/main.dart';

void main() {
  testWidgets('muestra los cuatro museos disponibles', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const ParcialFlutterApp());
    expect(find.text('Centro'), findsWidgets);
    expect(find.text('Museo de Arte del Río'), findsOneWidget);
    expect(find.text('Museo de Historia Natural Andina'), findsOneWidget);
    expect(find.text('Museo Arqueológico del Altiplano'), findsOneWidget);
    expect(find.text('Casa Museo del Patrimonio Local'), findsOneWidget);
  });
}
