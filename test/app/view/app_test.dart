import 'package:flutter_test/flutter_test.dart';
import 'package:site_diary_app/app/app.dart';
import 'package:site_diary_app/diary/view/list_page.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
