import 'package:flutter/material.dart';

/// A widget that dismisses the keyboard when tapped outside of a text field.
class DismissibleKeyboard extends StatelessWidget {
  /// Constructor for creating a DismissibleKeyboard.
  const DismissibleKeyboard({super.key, this.child});

  /// The child widget.
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final currentFocus = FocusScope.of(context);

        // Dismiss the keyboard if the focus is not on a text field
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: child,
    );
  }
}
