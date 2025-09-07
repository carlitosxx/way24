import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:way24/core/presentation/router/routes.dart';
import 'package:way24/core/presentation/theme/spacing.dart';
import 'package:way24/features/tourist/domain/entities/tourist_site.entity.dart';

/// Skeleton cards diagonal
class CardsDiagonal extends StatefulWidget {
  /// Skeleton cards diagonal
  const CardsDiagonal({
    required this.height,
    required this.listTouristSite,
    super.key,
  });

  /// Height
  final double height;

  /// List tourist sites
  final List<TouristSiteEntity> listTouristSite;

  @override
  State<CardsDiagonal> createState() => _CardsDiagonalState();
}

class _CardsDiagonalState extends State<CardsDiagonal>
    with SingleTickerProviderStateMixin {
  late AnimationController _shimmerController;
  late Animation<double> _shimmerAnimation;
  final PageController _pageController = PageController(viewportFraction: 0.75);
  double _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _shimmerController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page ?? 0;
      });
    });
    _shimmerAnimation = Tween<double>(
      begin: 0.3,
      end: 0.7,
    ).animate(_shimmerController);
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: PageView.builder(
        controller: _pageController,
        itemCount: widget.listTouristSite.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final touristSite = widget.listTouristSite;
          return AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              final pageOffset = _currentPage - index;
              final verticalOffset = pageOffset * 85;
              final scale = 1 - (pageOffset.abs() * 0.5);
              return Transform.scale(
                scale: scale.clamp(0.80, 1.0),
                child: Transform.translate(
                  offset: Offset(0, verticalOffset),
                  child: AnimatedBuilder(
                    animation: _shimmerAnimation,
                    builder: (context, child) {
                      return GestureDetector(
                        onTap: () {
                          SiteTouristRoute(
                            touristSite: index.toString(),
                          ).push<BuildContext>(context);
                        },
                        child: Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                vertical: Spacing.spaceExtraLarge,
                              ),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: CachedNetworkImageProvider(
                                    touristSite[index].imageUrl,
                                  ),
                                ),
                                color: Theme.of(
                                  context,
                                ).colorScheme.outlineVariant,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: Spacing.spaceExtraExtraLarge,
                                left: Spacing.spaceMedium,
                              ),
                              child: TextH3(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                text: touristSite[index].title,
                              ),
                            ),
                            Positioned(
                              bottom: Spacing.spaceExtraExtraLarge,
                              right: Spacing.spaceSmall,
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  size: 32,
                                  Icons.favorite,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
