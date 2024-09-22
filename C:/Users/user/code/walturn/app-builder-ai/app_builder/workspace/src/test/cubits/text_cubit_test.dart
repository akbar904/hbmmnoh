
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_cubit_app/cubits/text_cubit.dart';
import 'package:simple_cubit_app/models/text_model.dart';

// Mock class for TextCubit
class MockTextCubit extends MockCubit<TextModel> implements TextCubit {}

void main() {
	group('TextCubit', () {
		late TextCubit textCubit;

		setUp(() {
			textCubit = TextCubit();
		});

		tearDown(() {
			textCubit.close();
		});

		test('initial state is TextModel with text "Cat" and clock icon', () {
			expect(
				textCubit.state,
				TextModel(
					text: 'Cat',
					icon: Icons.access_time,
				),
			);
		});

		blocTest<TextCubit, TextModel>(
			'emits [TextModel with text "Dog" and person icon] when toggleText is called from initial state',
			build: () => textCubit,
			act: (cubit) => cubit.toggleText(),
			expect: () => [
				TextModel(
					text: 'Dog',
					icon: Icons.person,
				),
			],
		);

		blocTest<TextCubit, TextModel>(
			'emits [TextModel with text "Cat" and clock icon] when toggleText is called after toggled to "Dog"',
			build: () => textCubit,
			act: (cubit) {
				cubit.toggleText();
				cubit.toggleText();
			},
			expect: () => [
				TextModel(
					text: 'Dog',
					icon: Icons.person,
				),
				TextModel(
					text: 'Cat',
					icon: Icons.access_time,
				),
			],
		);
	});
}
