import 'package:app_review_dialog/app_review_dialog.dart';
import 'package:flutter/material.dart';

void main() => runApp(const ExampleApp());

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'app_review_dialog example',
      home: Scaffold(
        appBar: AppBar(title: const Text('app_review_dialog example')),
        body: Center(
          child: ElevatedButton(
            onPressed: () => _showReviewDialog(context),
            child: const Text('Show review dialog'),
          ),
        ),
      ),
    );
  }

  Future<void> _showReviewDialog(BuildContext context) async {
    final result = await AppReviewDialog.show(
      context,
      supportEmail: 'hello@example.com',
      storePackageName: 'com.example.myapp',
      supportWebsitePage: 'https://example.com/support',
    );

    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text('Rating: ${result.rating}, action: ${result.action}')),
    );
  }
}
