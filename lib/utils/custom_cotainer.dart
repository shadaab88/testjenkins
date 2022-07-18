import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget? child;
  final double? padding;
  final EdgeInsets? paddingEdge;
  final double? height;
  final double? width;
  final double? borderWidth;
  final EdgeInsets? margin;
  final Color? borderColor;
  final Color? backgroundColor;
  final double? borderRadius;
  final Color? shadowColor;
  final double? elevation;
  final bool isBorderSide;
  final String? backgroundImage;

  const CustomContainer(
      {@required this.child,
        this.onTap,
        this.height,
        this.width,
        this.margin,
        this.borderColor,
        this.shadowColor,
        this.padding = 0,
        this.paddingEdge,
        this.borderRadius = 5,
        this.backgroundColor = Colors.white,
        this.elevation = 0,
        this.borderWidth = 1,
        this.isBorderSide = false,
        this.backgroundImage = ""});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Card(
        shape: this.isBorderSide
            ? Border(
          top: BorderSide(width: borderWidth!, color: this.borderColor!),
        )
            : RoundedRectangleBorder(
          side: this.borderColor != null
              ? BorderSide(color: this.borderColor!, width: borderWidth!)
              : BorderSide.none,
          borderRadius: BorderRadius.circular(this.borderRadius!),
        ),
        color: this.backgroundColor,
        elevation: this.elevation,
        margin: this.margin,

        shadowColor: this.shadowColor ?? Theme.of(context).accentColor,
        clipBehavior: Clip.hardEdge,
        child: Container(
          decoration: (backgroundImage != "")?BoxDecoration(
            borderRadius: BorderRadius.circular(this.borderRadius!),
            image: DecorationImage(
                image: AssetImage(this.backgroundImage!),
                fit:BoxFit.cover
            ),
          ):BoxDecoration(
            borderRadius: BorderRadius.circular(this.borderRadius!),
          ),
          child: InkWell(
            onTap: this.onTap,
            hoverColor: Colors.transparent,
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            child: Padding(
              padding: paddingEdge == null
                  ? EdgeInsets.all(this.padding!)
                  : paddingEdge!,
              child: this.child,
            ),
          ),
        ),
      ),
    );
  }
}
