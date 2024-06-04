import 'package:aiimscycle/utils/image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyCacheNetworkImage extends StatelessWidget {
  final String image;
  final double? height;
  final double? width;
  final BoxFit? fit;

  const MyCacheNetworkImage({
    super.key,
    required this.image,
    this.height,
    this.width,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    print(image);
    return CachedNetworkImage(
      width: width,
      height: height,
      fit: fit,
      imageUrl: image,
      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => Image.asset(ImagePath.cycle),
    );
  }
}

class GetImageFromUrl {
  static String getImage(String image) {
    return 'https://cfapplication.aiims.edu/aiims-cycle/assets/profiles/$image';
  }

  static String getProfileImage(String image) {
    return 'https://cfapplication.aiims.edu/aiims-cycle/assets/profiles/$image';
  }
}
