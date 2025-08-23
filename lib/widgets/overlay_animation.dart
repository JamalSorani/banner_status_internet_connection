part of '../elkood_connection_banner.dart';

class OverlayAnimation extends StatefulWidget {
  const OverlayAnimation({
    super.key,
    required this.child,
    required this.alignment,
    required this.overlayAnimationType,
    this.animationDuration,
    this.animationCurve,
    required this.isConnected,
    required this.disconnectedDuration,
    required this.connectedDuration,
  });

  final Widget child;

  final bool isConnected;

  final AlignmentGeometry alignment;

  final OverlayAnimationType overlayAnimationType;

  final Duration? animationDuration;

  final Curve? animationCurve;

  final Duration? disconnectedDuration;

  final Duration? connectedDuration;

  @override
  State<OverlayAnimation> createState() => _OverlayAnimationState();
}

class _OverlayAnimationState extends State<OverlayAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _tweenSlideAnimation;

  @override
  void initState() {
    super.initState();
    if (widget.overlayAnimationType != OverlayAnimationType.none) {
      final animationDuration =
          widget.animationDuration ?? const Duration(milliseconds: 300);
      final animationCurve = widget.animationCurve ?? Curves.fastOutSlowIn;
      final AlignmentHelper alignmentHelper = AlignmentHelper(widget.alignment);
      final double dySlideAnimationStartingPoint =
          alignmentHelper.isTopAlignment
              ? -1.0
              : alignmentHelper.isBottomAlignment
                  ? 1.0
                  : 0.0;

      _controller = AnimationController(
        vsync: this,
        duration: animationDuration,
        reverseDuration: animationDuration,
      )..forward();

      if (widget.overlayAnimationType != OverlayAnimationType.fade) {
        _tweenSlideAnimation = Tween<Offset>(
          begin: Offset(
            0.0,
            dySlideAnimationStartingPoint,
          ),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: animationCurve,
            reverseCurve: animationCurve,
          ),
        );
      }

      _controller.addStatusListener(
        (status) async {
          if (mounted) {
            if (widget.isConnected) {
              if (status == AnimationStatus.completed) {
                await Future.delayed(
                  widget.connectedDuration ?? const Duration(seconds: 2),
                );

                await _controller.reverse();
              }
            } else {
              if (widget.disconnectedDuration != null) {
                await Future.delayed(
                  widget.disconnectedDuration!,
                );
                await _controller.reverse();
              }
            }
          }
        },
      );
    }
  }

  @override
  void dispose() {
    if (widget.overlayAnimationType != OverlayAnimationType.none) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.overlayAnimationType) {
      case OverlayAnimationType.fadeAndSlide:
        return FadeTransition(
          opacity: _controller,
          child: SlideTransition(
            position: _tweenSlideAnimation,
            child: widget.child,
          ),
        );
      case OverlayAnimationType.fade:
        return FadeTransition(
          opacity: _controller,
          child: widget.child,
        );
      case OverlayAnimationType.slide:
        return SlideTransition(
          position: _tweenSlideAnimation,
          child: widget.child,
        );
      case OverlayAnimationType.none:
        return widget.child;
    }
  }
}

/// Overlay animation type of the connection notification.
enum OverlayAnimationType {
  /// Mixed fade and slide animation.
  fadeAndSlide,

  /// Fade animation only.
  fade,

  /// Slide animation only.
  slide,

  /// No any animation.
  none,
}
