
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_cubit_app/widgets/text_display.dart';

class MockTextModel extends Mock implements TextModel {}

void main() {
	group('TextDisplay Widget Tests', () {
		testWidgets('displays Cat with clock icon initially', (WidgetTester tester) async {
			// Arrange
			final textModel = TextModel(text: 'Cat', icon: Icons.access_time);
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: TextDisplay(
							textModel: textModel,
						),
					),
				),
			);

			// Assert
			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});

		testWidgets('displays Dog with person icon when textModel is updated', (WidgetTester tester) async {
			// Arrange
			final textModel = TextModel(text: 'Dog', icon: Icons.person);
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: TextDisplay(
							textModel: textModel,
						),
					),
				),
			);

			// Assert
			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});
	});
}
