import 'package:final_sprs/presentaion/core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillCyan => BoxDecoration(
        color: appTheme.cyan20033,
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray200,
      );
  static BoxDecoration get fillGray10002 => BoxDecoration(
        color: appTheme.gray10002,
      );
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
      );
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.whiteA700,
      );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: appTheme.whiteA700.withOpacity(0.47),
      );
       static BoxDecoration get fillGray2 => BoxDecoration(
        color: appTheme.gray100,
      );
  static BoxDecoration get fillPink => BoxDecoration(
        color: appTheme.pink500,
      );
  static BoxDecoration get fillWhiteA2 => BoxDecoration(
        color: appTheme.whiteA700,
      );

  // Outline decorations
  static BoxDecoration get outlineGray => BoxDecoration(
        color: appTheme.gray50,
        border: Border.all(
          color: appTheme.gray300,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineWhiteA => BoxDecoration(
        color: appTheme.cyan400,
        border: Border(
          right: BorderSide(
            color: appTheme.whiteA700,
            width: 2.h,
          ),
        ),
      );

  // Outline decorations
  static BoxDecoration get outlineBlueGray => BoxDecoration(
        color: appTheme.cyan50,
        border: Border.all(
          color: appTheme.blueGray800.withOpacity(0.4),
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineGray2 => BoxDecoration(
        color: appTheme.whiteA700,
        boxShadow: [
          BoxShadow(
            color: appTheme.gray90014,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: const Offset(
              0,
              2,
            ),
          ),
        ],
      );
  static BoxDecoration get outlinePrimary => BoxDecoration(
        color: appTheme.whiteA700,
        border: Border.all(
          color: theme.colorScheme.primary.withOpacity(0.6),
          width: 1.h,
        ),
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder25 => BorderRadius.circular(
        25.h,
      );

  // Rounded borders
  static BorderRadius get roundedBorder10 => BorderRadius.circular(
        10.h,
      );
  static BorderRadius get roundedBorder20 => BorderRadius.circular(
        20.h,
      );
  static BorderRadius get roundedBorder5 => BorderRadius.circular(
        5.h,
      );

      
}
class BorderRadiusStyle2 {
  // Rounded borders
  static BorderRadius get roundedBorder4 => BorderRadius.circular(
        4.h,
      );
  static BorderRadius get roundedBorder8 => BorderRadius.circular(
        8.h,
      );
}


// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
