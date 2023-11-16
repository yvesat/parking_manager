import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:parking_manager/src/model/enum/alert_type.dart';
import 'package:parking_manager/src/view/widgets/alert.dart';

void main() {
  testWidgets('Alert widget should show dialog for error type', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            return ElevatedButton(
              onPressed: () {
                final alert = Alert();
                alert.dialog(context, AlertType.error, 'Error message');
              },
              child: Text('Show Error Dialog'),
            );
          },
        ),
      ),
    );

    await tester.tap(find.text('Show Error Dialog'));
    await tester.pumpAndSettle();

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text('Erro'), findsOneWidget);
    expect(find.text('OK'), findsOneWidget);
  });

  testWidgets('Alert widget should show dialog for warning type with confirm and cancel buttons', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            return ElevatedButton(
              onPressed: () {
                final alert = Alert();
                alert.dialog(context, AlertType.warning, 'Warning message');
              },
              child: Text('Show Warning Dialog'),
            );
          },
        ),
      ),
    );

    await tester.tap(find.text('Show Warning Dialog'));
    await tester.pumpAndSettle();

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text('Atenção'), findsOneWidget);
    expect(find.text('CONFIRMAR'), findsOneWidget);
    expect(find.text('CANCELAR'), findsOneWidget);
  });
}
