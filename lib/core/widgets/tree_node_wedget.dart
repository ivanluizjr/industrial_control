import 'package:flutter/material.dart';
import 'package:tractian/core/themes/extensions/color_theme_extension.dart';
import 'package:tractian/core/widgets/text_widget.dart';

class TreeNodeWidget extends StatefulWidget {
  final String title;
  final List<TreeNodeWidget> children;
  final Widget leadingIcon;
  final Widget? trailingIcon;
  final Widget? rightIcon;
  final bool isExpanded;
  final Function() onToggleExpand;

  const TreeNodeWidget({
    required this.title,
    required this.children,
    required this.leadingIcon,
    required this.onToggleExpand,
    required this.isExpanded,
    this.trailingIcon,
    this.rightIcon,
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _TreeNodeWidgetState createState() => _TreeNodeWidgetState();
}

class _TreeNodeWidgetState extends State<TreeNodeWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: widget.onToggleExpand,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 7.0),
              widget.leadingIcon,
              const SizedBox(width: 6.0),
              if (widget.trailingIcon != null) widget.trailingIcon!,
              const SizedBox(width: 4.0),
              Expanded(
                child: Row(
                  children: [
                    TextWidget(
                      text: widget.title,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      colorText: context.appColors.darkBlue,
                    ),
                    const SizedBox(width: 4.0),
                    widget.rightIcon ?? const SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (widget.isExpanded)
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              top: 7.0,
            ),
            child: Column(
              children: widget.children.map((child) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 1,
                      height: 40,
                      color: context.appColors.lightGray,
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(child: child),
                  ],
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}
