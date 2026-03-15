// ─────────────────────────────────────────────────────────────────────────────
// AppColors — extracted from Figma: Instagram UI Screens (Community)
// File ID: oczedq6zJ47mIa0erL0kby  |  Frame size: 375×812 (iPhone X)
// ─────────────────────────────────────────────────────────────────────────────

import 'package:flutter/material.dart';

abstract final class AppColors {
  // ── Backgrounds ──────────────────────────────────────────────────────────
  /// Light mode scaffold background (Figma: white FFFFFFFF)
  static const Color backgroundLight = Color(0xFFFFFFFF);

  /// Dark mode scaffold background (Figma: pure black 000000FF)
  static const Color backgroundDark = Color(0xFF000000);

  /// Light mode secondary surface (e.g. search bar bg, text field bg)
  static const Color surfaceLight = Color(0xFFFAFAFA);

  /// Dark mode secondary surface
  static const Color surfaceDark = Color(0xFF121212);

  /// Input / search bar fill – light (Figma: #EFEFEF)
  static const Color inputFillLight = Color(0xFFEFEFEF);

  /// Input / search bar fill – dark (Figma: #262626)
  static const Color inputFillDark = Color(0xFF262626);

  // ── Dividers & Borders ────────────────────────────────────────────────────
  /// Separator / divider – light (Figma: #DBDBDB)
  static const Color separatorLight = Color(0xFFDBDBDB);

  /// Separator / divider – dark (Figma: #262626)
  static const Color separatorDark = Color(0xFF262626);

  // ── Text ──────────────────────────────────────────────────────────────────
  /// Primary text – light
  static const Color textPrimaryLight = Color(0xFF000000);

  /// Primary text – dark
  static const Color textPrimaryDark = Color(0xFFFFFFFF);

  /// Secondary / muted text – both modes (Figma: #737373)
  static const Color textSecondary = Color(0xFF737373);

  /// Timestamp / faded text (Figma: 60% opacity on black → #262626@60%)
  static const Color textTimestamp = Color(0xFF8E8E8E);

  // ── Brand / Accent ────────────────────────────────────────────────────────
  /// Instagram blue – links, buttons, follow action (Figma: #0095F6)
  static const Color brandBlue = Color(0xFF0095F6);

  // ── Instagram Gradient ────────────────────────────────────────────────────
  /// Full Instagram gradient (used on story rings, logo, login button)
  static const List<Color> instagramGradient = [
    Color(0xFF405DE6), // violet
    Color(0xFF5851DB),
    Color(0xFF833AB4), // purple
    Color(0xFFC13584),
    Color(0xFFE1306C), // pink/magenta
    Color(0xFFFD1D1D),
    Color(0xFFF56040),
    Color(0xFFF77737),
    Color(0xFFFCAF45), // orange
    Color(0xFFFFDC80), // yellow
  ];

  /// Compact gradient stops used most often (story ring)
  static const List<Color> storyGradient = [
    Color(0xFFF56040),
    Color(0xFFE1306C),
    Color(0xFF833AB4),
  ];

  /// Seen / inactive story ring colour
  static const Color storyRingSeen = Color(0xFFDBDBDB);

  // ── Notification dot ─────────────────────────────────────────────────────
  static const Color notificationDot = Color(0xFFE1306C);

  // ── Like / heart active ──────────────────────────────────────────────────
  static const Color likeActive = Color(0xFFED4956);
}
