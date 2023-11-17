import 'package:flutter/material.dart';

class MyCustomButton extends StatelessWidget {
  const MyCustomButton({
    Key? key,
    required this.onPressed,
    required this.child,
    required this.hasPrefix,
    this.height,
    this.width,
    this.borderRadius,
    this.splashColor,
    this.gradient,
    this.boxShadow,
    this.elevation,
    this.backgroundColor,
    this.prefixWidget,
    this.border,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Widget child;
  final bool hasPrefix;
  final Widget? prefixWidget;
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;
  final double? elevation;
  final Color? splashColor;
  final Color? backgroundColor;
  final Gradient? gradient;
  final List<BoxShadow>? boxShadow;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: elevation ?? 0,
      child: InkWell(
        splashColor: splashColor,
        borderRadius: borderRadius,
        onTap: onPressed,
        child: Container(
          height: height ?? 50,
          width: width ?? 150,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: borderRadius,
            boxShadow: boxShadow,
            gradient: gradient,
            border: border,
          ),
          child: hasPrefix
              ? Row(
                  children: <Widget>[
                    const Spacer(
                      flex: 1,
                    ),
                    prefixWidget!,
                    const Spacer(
                      flex: 2,
                    ),
                    child,
                    const Spacer(
                      flex: 3,
                    ),
                  ],
                )
              : child,
        ),
      ),
    );
  }
}
