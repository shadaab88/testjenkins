import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomContainerGradients extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget? child;
  final double? padding;
  final double? height;
  final double? width;
  final EdgeInsets? margin;
  final EdgeInsets? paddingEdge;
  final Color? borderColor;
  final Color? backgroundColor;
  final double? borderRadius;
  final double? borderTopLeftRadius;
  final double? borderBottomRightRadius;
  final double? borderTopRightRadius;
  final double? borderBottomLeftRadius;
  final Color? shadowColor;
  final double? elevation;
  final Color? gradientStartColor;
  final Color? gradientEndColor;

  const CustomContainerGradients(
      {@required this.child,
        this.onTap,
        this.height,
        this.width,
        this.margin,
        this.borderColor,
        this.shadowColor,
        this.padding,
        this.borderRadius,
        this.backgroundColor = Colors.white,
        this.elevation = 2.5,
        this.borderBottomLeftRadius,
        this.borderBottomRightRadius,
        this.borderTopRightRadius,
        this.borderTopLeftRadius,
        this.gradientStartColor,
        this.gradientEndColor,
        this.paddingEdge});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: GestureDetector(
        onTap: this.onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: borderColor != null ? borderColor! : Colors.transparent,
            ),
            borderRadius: borderRadius != null
                ? BorderRadius.all(Radius.circular(borderRadius!))
                : BorderRadius.only(
                topRight: Radius.circular(borderTopRightRadius!),
                topLeft: Radius.circular(borderTopLeftRadius!),
                bottomLeft: Radius.circular(borderBottomLeftRadius!),
                bottomRight: Radius.circular(borderBottomRightRadius!)),
            gradient: LinearGradient(
              colors: [
                this.gradientStartColor != null
                    ? this.gradientStartColor!
                    : this.backgroundColor!,
                this.gradientEndColor != null
                    ? this.gradientEndColor!
                    : this.backgroundColor!
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.0, 4.0),
              stops: [0.0, 3.0],
              tileMode: TileMode.clamp,
            ),
          ),
          margin: this.margin,
          child: Padding(
            padding: paddingEdge == null
                ? EdgeInsets.all(this.padding!)
                : paddingEdge!,
            child: this.child,
          ),
        ),
      ),
    );
  }
}
