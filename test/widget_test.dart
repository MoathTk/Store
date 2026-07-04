import 'package:flutter_test/flutter_test.dart';
import 'package:store_management/main.dart';

void main() {
  testWidgets('App builds without errors', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp(isFirstTime: true));
    await tester.pumpAndSettle();
  });
}
