// ─────────────────────────────────────────────────────────────────────────────
// AppSpacing — extracted from Figma: Instagram UI Screens (Community)
// Frame: 375×812 (iPhone X)
// ─────────────────────────────────────────────────────────────────────────────

abstract final class AppSpacing {
  // ── Screen / global ───────────────────────────────────────────────────────
  /// Horizontal screen edge padding (Figma: post content starts at x=1464
  ///   vs frame start x=1449 → 15px left gutter)
  static const double screenHPadding = 15.0;

  // ── App Bar ───────────────────────────────────────────────────────────────
  static const double appBarHeight = 44.0;

  // ── Post / Top bar ────────────────────────────────────────────────────────
  /// Post header height (Figma 0:23 absoluteBoundingBox height=54)
  static const double postHeaderHeight = 54.0;

  /// Profile avatar size in post header
  ///   (Figma 0:31 Oval width=32, height=32)
  static const double postAvatarSize = 32.0;

  /// Spacing between avatar left edge and frame left
  ///   (frame x=1449, avatar x=1459 → 10px)
  static const double postAvatarLeading = 10.0;

  /// Gap between avatar right and text column
  ///   (avatar right=1491, text x=1501 → 10px)
  static const double postAvatarTextGap = 10.0;

  // ── Post image ────────────────────────────────────────────────────────────
  /// Square post image — fills full width (375px frame → 1:1 aspect ratio)
  static const double postImageAspectRatio = 1.0; // 375×375

  // ── Carousel badge ────────────────────────────────────────────────────────
  /// Badge w=34 h=26, corner=13 (Figma 0:38/0:39)
  static const double carouselBadgeW = 34.0;
  static const double carouselBadgeH = 26.0;
  static const double carouselBadgeRadius = 13.0;
  static const double carouselBadgeRight = 9.0; // right gap from frame edge
  static const double carouselBadgeTop = 9.0;   // top gap from frame edge

  // ── Post / Bottom bar ─────────────────────────────────────────────────────
  /// Bottom (action + likes + caption) height
  ///   (Figma 0:41 absoluteBoundingBox height=147)
  static const double postBottomHeight = 147.0;

  /// Action row height (icons row top of bottom bar)
  static const double postActionsHeight = 40.0;

  /// Horizontal padding for post bottom content
  ///   (Figma 0:43 text x=1464 vs frame x=1449 → 15px)
  static const double postBottomHPadding = 15.0;

  /// Gap between action icons (Messenger at x=1543.5, right edge of Like at ~1519)
  static const double postActionIconGap = 6.0;

  // ── Stories ───────────────────────────────────────────────────────────────
  /// Stories tray height (Figma: 100px approximate)
  static const double storiesTrayHeight = 100.0;

  /// Avatar ring outer size
  static const double storyAvatarOuter = 62.0;

  /// Avatar ring inner (image area) — 2px ring each side
  static const double storyAvatarInner = 56.0;

  /// Ring stroke width
  static const double storyRingStroke = 2.5;

  /// Gap between ring and image (1px white gap)
  static const double storyRingGap = 2.0;

  /// Gap between story items
  static const double storyItemGap = 14.0;

  // ── Divider ───────────────────────────────────────────────────────────────
  static const double dividerThickness = 0.5;
}
