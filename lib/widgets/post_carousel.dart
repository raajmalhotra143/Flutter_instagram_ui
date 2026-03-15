import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../core/constants/spacing.dart';
import '../core/constants/typography.dart';

class PostCarousel extends StatefulWidget {
  final List<String> imageUrls;

  const PostCarousel({super.key, required this.imageUrls});

  @override
  State<PostCarousel> createState() => _PostCarouselState();
}

class _PostCarouselState extends State<PostCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.imageUrls.isEmpty) return const SizedBox();

    return Stack(
      alignment: Alignment.topRight,
      children: [
        // Carousel
        AspectRatio(
          aspectRatio: AppSpacing.postImageAspectRatio,
          child: PageView.builder(
            itemCount: widget.imageUrls.length,
            onPageChanged: (i) => setState(() => _currentIndex = i),
            itemBuilder: (context, index) {
              return CachedNetworkImage(
                imageUrl: widget.imageUrls[index],
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  color: Theme.of(context).brightness == Brightness.dark 
                      ? Colors.grey.shade900 
                      : Colors.grey.shade200,
                ),
                errorWidget: (context, url, error) => Container(
                  color: Colors.grey.shade800,
                  child: const Center(child: Icon(Icons.error)),
                ),
              );
            },
          ),
        ),

        // Photo Number Badge
        if (widget.imageUrls.length > 1)
          Positioned(
            top: AppSpacing.carouselBadgeTop,
            right: AppSpacing.carouselBadgeRight,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.9), // Exact Figma opacity 0.899
                borderRadius: BorderRadius.circular(AppSpacing.carouselBadgeRadius),
              ),
              child: Text(
                '${_currentIndex + 1}/${widget.imageUrls.length}',
                style: AppTypography.carouselBadge,
              ),
            ),
          ),
          
        // Page indicator dots at the bottom
        if (widget.imageUrls.length > 1)
          Positioned(
            bottom: -20, // To sit below the image in the Action row
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.imageUrls.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  width: _currentIndex == index ? 6 : 4,
                  height: _currentIndex == index ? 6 : 4,
                  decoration: BoxDecoration(
                    color: _currentIndex == index 
                        ? const Color(0xFF0095F6) 
                        : Colors.grey.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
