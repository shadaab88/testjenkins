
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shimmer/shimmer.dart';

class MyCachedNetworkImage extends StatelessWidget {
  final String? url;
  final double? borderRadius;
  final double? width;
  final double? height;
  final EdgeInsets padding;
  final Color? color;
  final bool zoomToFit;
  final String? baseUrlType;

  MyCachedNetworkImage(
      {@required this.url,
        this.width,
        this.height,
        this.color,
        this.zoomToFit = true,
        this.borderRadius = 0,
        this.padding = EdgeInsets.zero,
        this.baseUrlType = "default"});

  @override
  Widget build(BuildContext context) {
    // print(Constants.baseURL+url!);
    return Padding(
      padding: this.padding,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(this.borderRadius!),
        child: CachedNetworkImage(
          height: this.height,
          width: this.width,
          imageUrl: this.url!,

          // imageUrl: (url!.contains("http"))?url!:Constants.baseURL+url!,
          color: this.color,
          fit: this.zoomToFit ? BoxFit.fill : null,
          placeholder: (context, _) => Shimmer.fromColors(
            child: Container(color: Colors.white),
            baseColor: Colors.grey[400]!,
            highlightColor: Colors.white,
            period: Duration(milliseconds: 350),
          ),
          errorWidget: (context, _, __) => Container(),
          // errorWidget: (context, _, __) {
          //   return Center(
          //     // height: 0,
          //     // width: 0,
          //     child: Text(
          //       "${Constants.appName}",
          //       style: GoogleFonts.montserrat(
          //           fontSize: baseUrlType == "restaurantLogo" ? 25 : 16,
          //           fontWeight: FontWeight.bold,
          //           color: Constants.borderColor,
          //           fontStyle: FontStyle.italic),
          //     ),
          //   );
          // },
        ),
      ),
    );
  }
}