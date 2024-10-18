import 'package:flutter/material.dart';
import 'package:tractian/core/themes/extensions/color_theme_extension.dart';
import 'package:tractian/core/widgets/image_widget.dart';
import 'package:tractian/core/widgets/text_widget.dart';

class ButtonCompaniesWidget extends StatelessWidget {
  final String titleCompanie;
  final Function()? onPressed;

  const ButtonCompaniesWidget({
    super.key,
    required this.titleCompanie,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Padding(
        padding: const EdgeInsets.only(left: 32.0),
        child: ImageWidget.iconButtonCompanies(),
      ),
      label: TextWidget(
        text: titleCompanie,
        colorText: context.appColors.white,
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
      ),
      style: ButtonStyle(
        fixedSize: const WidgetStatePropertyAll(
          Size(317.0, 76.0),
        ),
        backgroundColor: WidgetStatePropertyAll<Color>(
          context.appColors.standardBlue,
        ),
        alignment: Alignment.centerLeft,
        shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        overlayColor: WidgetStatePropertyAll<Color>(
          context.appColors.darkBlue,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
