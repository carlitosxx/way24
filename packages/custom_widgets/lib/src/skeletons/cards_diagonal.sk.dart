import 'package:flutter/material.dart';

/// Skeleton cards diagonal
class SkeletonCardsDiagonal extends StatefulWidget {
  /// Skeleton cards diagonal
  const SkeletonCardsDiagonal({
    required this.height,
    super.key,
  });

  /// Height
  final double height;

  @override
  State<SkeletonCardsDiagonal> createState() => _SkeletonCardsDiagonalState();
}

class _SkeletonCardsDiagonalState extends State<SkeletonCardsDiagonal>
    with SingleTickerProviderStateMixin {
  late AnimationController _shimmerController;
  late Animation<double> _shimmerAnimation;
  final PageController _pageController = PageController(
    viewportFraction: 0.75,
  );
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
    _shimmerAnimation =
        Tween<double>(begin: 0.3, end: 0.7).animate(_shimmerController);
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
        itemCount: 5,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              final pageOffset = _currentPage - index;
              final verticalOffset = pageOffset * 85;
              final scale = 1 - (pageOffset.abs() * 0.5);
              return Transform.scale(
                scale: scale.clamp(
                  0.80,
                  1.0,
                ),
                child: Transform.translate(
                  offset: Offset(0, verticalOffset),
                  child: AnimatedBuilder(
                    animation: _shimmerAnimation,
                    builder: (context, child) {
                      return GestureDetector(
                        onTap: () {},
                        child: ShaderMask(
                          shaderCallback: (bounds) {
                            return LinearGradient(
                              colors: [
                                Colors.white.withValues(alpha: .3),
                                Colors.white.withValues(alpha: .4),
                                Colors.white.withValues(alpha: .3),
                              ],
                              stops: [
                                _shimmerController.value - 0.3,
                                _shimmerController.value,
                                _shimmerController.value + 0.3,
                              ],
                            ).createShader(bounds);
                          },
                          blendMode: BlendMode.srcATop,
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 32,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  Theme.of(context).colorScheme.outlineVariant,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
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
