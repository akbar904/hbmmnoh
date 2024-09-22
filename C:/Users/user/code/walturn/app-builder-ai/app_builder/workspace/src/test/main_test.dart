
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_cubit_app/main.dart';

class MockTextCubit extends MockCubit<TextModel> implements TextCubit {}

void main() {
	group('Main App', () {
		late TextCubit textCubit;

		setUp(() {
			textCubit = MockTextCubit();
		});

		testWidgets('Displays initial text as Cat with clock icon', (tester) async {
			when(() => textCubit.state).thenReturn(TextModel(text: 'Cat', icon: Icons.access_time));
			await tester.pumpWidget(
				BlocProvider.value(
					value: textCubit,
					child: const MyApp(),
				),
			);

			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});

		testWidgets('Toggles text to Dog with person icon when tapped', (tester) async {
			when(() => textCubit.state).thenReturn(TextModel(text: 'Cat', icon: Icons.access_time));
			await tester.pumpWidget(
				BlocProvider.value(
					value: textCubit,
					child: const MyApp(),
				),
			);

			whenListen(
				textCubit,
				Stream.fromIterable([
					TextModel(text: 'Cat', icon: Icons.access_time),
					TextModel(text: 'Dog', icon: Icons.person),
				]),
			);

			await tester.tap(find.text('Cat'));
			await tester.pump();

			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});
	});
}
