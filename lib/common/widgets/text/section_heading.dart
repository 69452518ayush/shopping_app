import 'package:flutter/material.dart';

class USectionHeading extends StatelessWidget {
  const USectionHeading({
    super.key,
    this.textColor,
    required this.title,
    this.buttonTitle = 'View all',
    this.onPressed,
    this.showActonButton = true,
  });

  final Color? textColor;
  final String title, buttonTitle;
  final void Function()? onPressed;
  final bool showActonButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.headlineSmall!.apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActonButton)
          TextButton(onPressed: onPressed, child: Text(buttonTitle)),
      ],
    );
  }
}
