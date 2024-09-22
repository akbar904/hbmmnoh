
import 'package:flutter/material.dart';
import 'package:simple_cubit_app/models/text_model.dart';

class TextDisplay extends StatelessWidget {
	final TextModel textModel;

	const TextDisplay({Key? key, required this.textModel}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Row(
			mainAxisAlignment: MainAxisAlignment.center,
			children: [
				Text(
					textModel.text,
					style: TextStyle(fontSize: 24),
				),
				SizedBox(width: 8),
				Icon(textModel.icon),
			],
		);
	}
}
