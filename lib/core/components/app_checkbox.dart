import 'package:flutter/material.dart';

class CheckboxIcon {
  final Widget? unChecked;
  final Widget? checked;

  const CheckboxIcon({this.unChecked, this.checked});
}

class AppMultiSelectionBox extends AppCheckbox {
  AppMultiSelectionBox({
    super.key,
    super.child,
    required this.onTicked,
    this.checkboxIcon,
    super.isDisabled = false,
    super.color = Colors.black,
  }) : super(
         checkbox: checkboxIcon,
         onChecked: (isDisabled) ? (value) {} : onTicked,
       );

  final CheckboxIcon? checkboxIcon;
  final Function(bool) onTicked;
}

class AppAgreementCheckbox extends AppCheckbox {
  AppAgreementCheckbox({
    super.key,
    super.child,
    required this.onTicked,
    this.checkboxIcon,
    super.isDisabled = false,
    super.color = Colors.black,
  }) : super(
         checkbox: checkboxIcon,
         onChecked: (isDisabled) ? (value) {} : onTicked,
       );

  final CheckboxIcon? checkboxIcon;
  final Function(bool) onTicked;
}

class AppCheckbox extends StatefulWidget {
  const AppCheckbox({
    super.key,
    required this.child,
    required this.onChecked,
    this.isDisabled = false,
    this.checkbox,
    this.color = Colors.black,
  });

  final Widget? child;
  final CheckboxIcon? checkbox;
  final bool isDisabled;
  final Function(bool) onChecked;
  final Color color;

  @override
  AppCheckboxState createState() => AppCheckboxState();
}

class AppCheckboxState extends State<AppCheckbox> {
  late bool checked;

  @override
  void initState() {
    checked = false;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double opacity = (widget.isDisabled) ? 0.5 : 1;

    final icon = (widget.isDisabled)
        ? Opacity(
            opacity: opacity,
            child:
                widget.checkbox?.unChecked ??
                Icon(Icons.check_box_outline_blank, color: widget.color),
          )
        : checked
        ? widget.checkbox?.checked ??
              Icon(Icons.check_circle_outline_outlined, color: widget.color)
        : widget.checkbox?.unChecked ??
              Icon(Icons.check_box_outline_blank, color: widget.color);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          iconSize: 20,
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(),
          style: ButtonStyle(tapTargetSize: MaterialTapTargetSize.shrinkWrap),
          onPressed: () {
            setState(() {
              if (!widget.isDisabled) {
                checked = !checked;
                widget.onChecked(checked);
              }
            });
          },
          icon: icon,
        ),
        SizedBox(width: 10),
        if (widget.child != null)
          Expanded(
            child: Opacity(opacity: opacity, child: widget.child!),
          ),
      ],
    );
  }
}
