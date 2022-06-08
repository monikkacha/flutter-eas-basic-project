import 'package:flutter_basics/utils/size_config.dart';

class AppFontSize {
  static double large = 32;
  static double h1 = 22;
  static double h2 = 20;
  static double h3 = 18;
  static double h4 = 16;
  static double h5 = 14;
  static double h6 = 12;

  // Padding Margin values
  static double value1 = 1;
  static double value2 = 2;
  static double value4 = 4;
  static double value6 = 6;
  static double value8 = 8;
  static double value10 = 10;
  static double value12 = 12;
  static double value14 = 14;
  static double value16 = 16;
  static double value18 = 18;
  static double value20 = 20;
  static double value22 = 22;
  static double value24 = 24;
  static double value26 = 26;
  static double value28 = 28;
  static double value30 = 30;
  static double value36 = 36;
  static double value40 = 40;
  static double value42 = 42;
  static double value48 = 48;
  static double value50 = 50;
  static double value58 = 58;
  static double value60 = 60;
  static double value70 = 70;
  static double value80 = 80;
  static double value82 = 82;
  static double value86 = 86;
  static double value88 = 88;
  static double value90 = 90;
  static double value98 = 98;
  static double value100 = 100;
  static double value124 = 124;
  static double value130 = 130;
  static double value132 = 132;
  static double value136 = 136;
  static double value150 = 150;
  static double value160 = 160;
  static double value180 = 180;
  static double value200 = 200;
  static double value220 = 220;
  static double value240 = 240;
  static double value260 = 260;
  static double value500 = 500;

  static double toolbarHeight = 48;

  static void init() {
    large = SizeConfig.isTabletDevice ? 48 : 32;
    h1 = SizeConfig.isTabletDevice ? 33 : 22;
    h2 = SizeConfig.isTabletDevice ? 30 : 20;
    h3 = SizeConfig.isTabletDevice ? 27 : 18;
    h4 = SizeConfig.isTabletDevice ? 24 : 16;
    h5 = SizeConfig.isTabletDevice ? 21 : 14;
    h6 = SizeConfig.isTabletDevice ? 18 : 12;

    value2 = SizeConfig.isTabletDevice ? 3 : 2;
    value4 = SizeConfig.isTabletDevice ? 6 : 4;
    value6 = SizeConfig.isTabletDevice ? 9 : 6;
    value8 = SizeConfig.isTabletDevice ? 12 : 8;
    value10 = SizeConfig.isTabletDevice ? 15 : 10;
    value12 = SizeConfig.isTabletDevice ? 18 : 12;
    value14 = SizeConfig.isTabletDevice ? 21 : 14;
    value16 = SizeConfig.isTabletDevice ? 24 : 16;
    value18 = SizeConfig.isTabletDevice ? 27 : 18;
    value20 = SizeConfig.isTabletDevice ? 30 : 20;
    value22 = SizeConfig.isTabletDevice ? 33 : 22;
    value24 = SizeConfig.isTabletDevice ? 36 : 24;
    value26 = SizeConfig.isTabletDevice ? 39 : 26;
    value28 = SizeConfig.isTabletDevice ? 42 : 28;
    value30 = SizeConfig.isTabletDevice ? 45 : 30;
    value30 = SizeConfig.isTabletDevice ? 54 : 36;
    value40 = SizeConfig.isTabletDevice ? 60 : 40;
    value42 = SizeConfig.isTabletDevice ? 63 : 42;
    value48 = SizeConfig.isTabletDevice ? 72 : 48;
    value50 = SizeConfig.isTabletDevice ? 75 : 50;
    value58 = SizeConfig.isTabletDevice ? 87 : 58;
    value60 = SizeConfig.isTabletDevice ? 90 : 60;
    value70 = SizeConfig.isTabletDevice ? 105 : 70;
    value80 = SizeConfig.isTabletDevice ? 120 : 80;
    value82 = SizeConfig.isTabletDevice ? 123 : 82;
    value86 = SizeConfig.isTabletDevice ? 129 : 86;
    value88 = SizeConfig.isTabletDevice ? 132 : 88;
    value98 = SizeConfig.isTabletDevice ? 147 : 98;
    value100 = SizeConfig.isTabletDevice ? 150 : 100;
    value124 = SizeConfig.isTabletDevice ? 186 : 124;
    value130 = SizeConfig.isTabletDevice ? 195 : 130;
    value136 = SizeConfig.isTabletDevice ? 204 : 136;

    toolbarHeight = SizeConfig.isTabletDevice ? 84 : 48;
  }
}
