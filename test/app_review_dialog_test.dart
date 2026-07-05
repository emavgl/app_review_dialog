import 'package:app_review_dialog/app_review_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Future<void> openDialog(
    WidgetTester tester,
    void Function(AppReviewDialogResult) onResult,
  ) async {
    await tester.pumpWidget(MaterialApp(
      home: Builder(
        builder: (context) => ElevatedButton(
          onPressed: () async {
            final result = await AppReviewDialog.show(
              context,
              supportEmail: 'hello@example.com',
              storePackageName: 'com.example.app',
            );
            onResult(result);
          },
          child: const Text('open'),
        ),
      ),
    ));
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
  }

  testWidgets('tapping the explicit Cancel button yields cancelled',
      (tester) async {
    AppReviewDialogResult? result;
    await openDialog(tester, (r) => result = r);

    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();

    expect(result, isNotNull);
    expect(result!.action, AppReviewDialogAction.cancelled);
  });

  testWidgets(
      'tapping outside the dialog (modal barrier) yields dismissed, never null',
      (tester) async {
    AppReviewDialogResult? result;
    await openDialog(tester, (r) => result = r);

    // Tap far outside the dialog card to hit the modal barrier.
    await tester.tapAt(const Offset(5, 5));
    await tester.pumpAndSettle();

    expect(result, isNotNull);
    expect(result!.action, AppReviewDialogAction.dismissed);
  });
}
