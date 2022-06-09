import 'package:flutter/widgets.dart';
import 'package:flutter_basics/utils/app_font_size.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late bool isTabletDevice;
  static late double screenHeight;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;
  static late double safeAreaHorizontal;
  static late double safeAreaVertical;
  static double? safeBlockHorizontal;
  static double? safeBlockVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;

    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;

    safeBlockHorizontal = (screenWidth - safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - safeAreaVertical) / 100;

    isTabletDevice = ((_mediaQueryData.orientation == Orientation.portrait)
                ? screenWidth
                : screenHeight) >
            700
        ? true
        : false;
  }
}

height1() => const SizedBox(
      height: 1.0,
    );

height2() => const SizedBox(
      height: 2.0,
    );

height4() => const SizedBox(
      height: 4.0,
    );

height6() => const SizedBox(
      height: 6.0,
    );

height8() => const SizedBox(
      height: 8.0,
    );

height10() => const SizedBox(
      height: 10.0,
    );

height12() => const SizedBox(
      height: 12.0,
    );

height14() => const SizedBox(
      height: 14.0,
    );

height16() => const SizedBox(
      height: 16.0,
    );

height18() => const SizedBox(
      height: 18.0,
    );

height20() => const SizedBox(
      height: 20.0,
    );

height22() => const SizedBox(
      height: 22.0,
    );

height24() => const SizedBox(
      height: 24.0,
    );

height26() => const SizedBox(
      height: 26.0,
    );

height28() => const SizedBox(
      height: 28.0,
    );

height30() => const SizedBox(
      height: 30.0,
    );


width1() => const SizedBox(
  width: 1.0,
);

width2() => const SizedBox(
  width: 2.0,
);

width4() => const SizedBox(
  width: 4.0,
);

width6() => const SizedBox(
  width: 6.0,
);

width8() => const SizedBox(
  width: 8.0,
);

width10() => const SizedBox(
  width: 10.0,
);

width12() => const SizedBox(
  width: 12.0,
);

width14() => const SizedBox(
  width: 14.0,
);

width16() => const SizedBox(
  width: 16.0,
);

width18() => const SizedBox(
  width: 18.0,
);

width20() => const SizedBox(
  width: 20.0,
);

width22() => const SizedBox(
  width: 22.0,
);

width24() => const SizedBox(
  width: 24.0,
);

width26() => const SizedBox(
  width: 26.0,
);

width28() => const SizedBox(
  width: 28.0,
);

width30() => const SizedBox(
  width: 30.0,
);
