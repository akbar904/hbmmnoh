
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_cubit_app/screens/home_screen.dart';

class MockTextCubit extends MockCubit<TextModel> implements TextCubit {}

void main() {
	group('HomeScreen Widget Tests', () {
		late TextCubit textCubit;

		setUp(() {
			textCubit = MockTextCubit();
		});

		testWidgets('initial state displays "Cat" with clock icon', (tester) async {
			when(() => textCubit.state).thenReturn(TextModel(text: 'Cat', icon: Icons.access_time));

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider.value(
						value: textCubit,
						child: HomeScreen(),
					),
				),
			);

			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});

		testWidgets('tapping text toggles to "Dog" with person icon', (tester) async {
			when(() => textCubit.state).thenReturn(TextModel(text: 'Cat', icon: Icons.access_time));

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider.value(
						value: textCubit,
						child: HomeScreen(),
					),
				),
			);

			// Simulate tapping the text
			await tester.tap(find.text('Cat'));
			await tester.pumpAndSettle();

			verify(() => textCubit.toggleText()).called(1);
			
			// Mock the state change after toggle
			when(() => textCubit.state).thenReturn(TextModel(text: 'Dog', icon: Icons.person));
			await tester.pump();

			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});
	});
}
