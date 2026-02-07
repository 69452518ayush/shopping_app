import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/texts.dart';

class UFormPrivacyCheckbox extends StatelessWidget {
  const UFormPrivacyCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        Checkbox(value: true, onChanged: (value) {}),
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.bodyMedium,
            children: [
              TextSpan(text: '${UTexts.iAgreeTo}'),
              TextSpan(
                text: '${UTexts.privacyPolicy}',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: dark ? UColors.white : UColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? UColors.white : UColors.primary,
                ),
              ),
              TextSpan(text: ' ${UTexts.and}'),
              TextSpan(
                text: '${UTexts.termsofUse}',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: dark ? UColors.white : UColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: UColors.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
