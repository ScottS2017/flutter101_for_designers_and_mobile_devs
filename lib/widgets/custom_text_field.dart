import 'package:flutter/material.dart';

class ImmutableCustomTextField extends StatelessWidget {
  const ImmutableCustomTextField({
    Key? key,
    required this.text,
  }) : super(key: key);

  /// It's immutable, and has to be destroyed & replaced rather
  /// than mutated. So, make all members final.
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      /// You align the text within the parent here.
      /// If the parent and text are equal height and
      /// width, you won't see any difference.
      // textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}
