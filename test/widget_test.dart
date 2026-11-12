
import 'package:flutter_test/flutter_test.dart';
import 'package:shop/main.dart';

void main() {
  testWidgets('Shop Online app test', (WidgetTester tester) async {
    await tester.pumpWidget(const ShopOnlineApp());

    expect(find.text('SHOP ONLINE'), findsOneWidget);
  });
}
