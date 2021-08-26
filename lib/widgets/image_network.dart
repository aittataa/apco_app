import 'package:apco_app/widgets/bounce_point.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageNetwork extends StatelessWidget {
  final String image;
  const ImageNetwork({required this.image});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: "$image",
      fit: BoxFit.cover,
      placeholder: (context, url) => new BouncePoint(size: 25),
      errorWidget: (context, url, error) => new Icon(Icons.error),
    );
  }
}
