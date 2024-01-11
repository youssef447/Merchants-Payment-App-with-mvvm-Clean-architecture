import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class DefaultCachedImage extends StatelessWidget {
  final String imgUrl;
  final double? width, height;

  const DefaultCachedImage(
      {super.key, required this.imgUrl, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CachedNetworkImage(
        width: width ?? double.infinity,
        height: height,

        fit: BoxFit.cover,
        imageUrl: imgUrl,
        placeholder: (context, url) => Center(
            child: Text(
          'Loading...',
          style: Theme.of(context).textTheme.titleMedium,
        )),
        errorWidget: (context, url, error) => const Icon(
          Icons.error_outline,
          color: Colors.red,
        ),

        ///Caching Configuration [CacheManager]
        cacheManager: CacheManager(
          Config(
            'defaultCachDuration',
            stalePeriod: const Duration(days: 7),
          ),
        ),
      ),
    );
  }
}
