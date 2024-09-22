
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';

import 'package:simple_cubit_app/models/text_model.dart';

void main() {
	group('TextModel', () {
		test('should correctly deserialize from JSON', () {
			final json = {
				"text": "Cat",
				"icon": Icons.access_time.codePoint,
			};

			final textModel = TextModel.fromJson(json);

			expect(textModel.text, "Cat");
			expect(textModel.icon, Icons.access_time);
		});

		test('should correctly serialize to JSON', () {
			final textModel = TextModel(text: "Dog", icon: Icons.person);

			final json = textModel.toJson();

			expect(json['text'], "Dog");
			expect(json['icon'], Icons.person.codePoint);
		});
	});
}
