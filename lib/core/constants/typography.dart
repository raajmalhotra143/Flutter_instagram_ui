// ─────────────────────────────────────────────────────────────────────────────
// AppTypography — extracted from Figma: Instagram UI Screens (Community)
// Font family in Figma: SF Pro Text (substituted with Inter on Android/desktop)
// ─────────────────────────────────────────────────────────────────────────────

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract final class AppTypography {
  // ── Font families ────────────────────────────────────────────────────────
  /// Primary font (Figma: SF Pro Text → Inter via Google Fonts)
  static TextStyle _base({
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w400,
    Color? color,
    double? letterSpacing,
    double? height,
  }) =>
      GoogleFonts.inter(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
        height: height,
      );

  // ── Instagram wordmark ───────────────────────────────────────────────────
  /// Logo / wordmark — Grand Hotel font (imitates Instagram's script)
  static TextStyle get wordmark => GoogleFonts.grandHotel(
        fontSize: 30,
        fontWeight: FontWeight.w400,
      );

  // ── Post Header (Post / Top) ─────────────────────────────────────────────
  /// username in post header  — SFProText-Semibold 13px -0.1 ls (Figma id 0:26)
  static TextStyle get postUsername => _base(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.1,
        height: 18 / 13, // lineHeightPx=18
      );

  /// location text in post header — SFProText-Regular 11px +0.07 ls (Figma id 0:25)
  static TextStyle get postLocation => _base(
        fontSize: 11,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.07,
      );

  // ── Post Bottom ──────────────────────────────────────────────────────────
  /// caption — SFProText-Semibold 13px for username portion; Regular for rest
  /// (Figma id 0:44, styleOverrideTable idx 1=Semibold, 3=Regular)
  static TextStyle get captionUsername => _base(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.1,
        height: 18 / 13,
      );

  static TextStyle get captionBody => _base(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.07,
        height: 18 / 13,
      );

  /// "Liked by craig_love and 44,686 others" — Regular 13px (Figma id 0:46)
  static TextStyle get likesInfo => _base(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.1,
        height: 18 / 13,
      );

  /// Timestamp — Regular 11px +0.05 ls, 60% opacity (Figma id 0:43)
  static TextStyle get timestamp => _base(
        fontSize: 11,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.05,
      );

  // ── Photo number badge ───────────────────────────────────────────────────
  /// "1/3" badge inside carousel — Regular 12px (Figma id 0:40)
  static TextStyle get carouselBadge => _base(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        color: Colors.white,
      );

  // ── Stories ───────────────────────────────────────────────────────────────
  /// Story username below ring — SF Pro Text Regular 11px (Figma: Stories node)
  static TextStyle get storyUsername => _base(
        fontSize: 11,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.07,
      );

  // ── Navigation / general ─────────────────────────────────────────────────
  static TextStyle get navLabel => _base(
        fontSize: 10,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get body => _base(fontSize: 14);
  static TextStyle get bodyBold => _base(fontSize: 14, fontWeight: FontWeight.w700);
  static TextStyle get caption => _base(fontSize: 12);
  static TextStyle get small => _base(fontSize: 11);
}
