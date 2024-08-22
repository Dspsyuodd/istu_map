import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:istu_map/config/theme/app_theme/app_theme.dart';
import 'package:istu_map/features/authentication/presentation/widgets/auth_elevated_button.dart';

void main() {
  testWidgets('AuthElevatedButton displays the correct text',
      (WidgetTester tester) async {
    const testText = 'Sign In';

    await tester.pumpWidget(
      MaterialApp(
        home: AppTheme(
          child: Scaffold(
            body: AuthElevatedButton(
              text: testText,
              onPressed: () {},
            ),
          ),
        ),
      ),
    );

    expect(find.text(testText), findsOneWidget);
  });

  testWidgets('AuthElevatedButton onPressed callback is triggered',
      (WidgetTester tester) async {
    bool wasPressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: AppTheme(
          child: Scaffold(
            body: AuthElevatedButton(
              text: 'Sign In',
              onPressed: () {
                wasPressed = true;
              },
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();
    expect(wasPressed, true);
  });
}
