import 'package:flutter/material.dart';

class Dimensions {
  static bool _isInitialized = false;

  static late Dimensions _instance;

  static Dimensions get I => _instance;

  factory Dimensions({required double width, required double height, bool allowFontScaling = false}) {
    if (!_isInitialized) {
      _isInitialized = true;
      _instance = Dimensions._(width: width, height: height, allowFontScaling: allowFontScaling);
    }

    return _instance;
  }

  Dimensions._({
    this.width = 0,
    this.height = 0,
    this.allowFontScaling = false,
  });

  late double width;
  late double height;
  late bool allowFontScaling;
  static late MediaQueryData _mediaQueryData;
  static late double _screenWidth;
  static late double _screenHeight;
  static late double _pixelRatio;
  static late double _textScaleFactor;

  void init(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    _mediaQueryData = mediaQuery;
    _pixelRatio = mediaQuery.devicePixelRatio;
    _screenWidth = mediaQuery.size.width;
    _screenHeight = mediaQuery.size.height;
    _textScaleFactor = mediaQuery.textScaleFactor;
  }

  static MediaQueryData get mediaQueryData => _mediaQueryData;

  static double get textScaleFactory => _textScaleFactor;

  static double get pixelRatio => _pixelRatio;

  static double get screenWidthDp => _screenWidth;

  static double get screenHeightDp => _screenHeight;

  static double get screenWidth => _screenWidth * _pixelRatio;

  static double get screenHeight => _screenHeight * _pixelRatio;

  get scaleWidth => _screenWidth / _instance.width;

  get scaleHeight => _screenHeight / _instance.height;

  double setWidth(double width) => width * scaleWidth;

  double setHeight(double height, [DimensionsApproach dimensionsApproach = DimensionsApproach.widthBased]) {
    switch (dimensionsApproach) {
      case DimensionsApproach.widthBased:
        return height * scaleWidth;
      case DimensionsApproach.heightBased:
        return height * scaleHeight;
    }
  }

  double setSp(double fontSize) => allowFontScaling ? setWidth(fontSize) : setWidth(fontSize) / _textScaleFactor;

  EdgeInsets getEdgeInsets({double? top, double? bottom, double? left, double? right}) {
    return EdgeInsets.only(
      top: setHeight(top ?? 0.0),
      bottom: setHeight(bottom ?? 0.0),
      left: setWidth(left ?? 0.0),
      right: setWidth(right ?? 0.0),
    );
  }

  EdgeInsets getEdgeInsetsSymmetric({
    double? vertical,
    double? horizontal,
    DimensionsApproach dimensionsApproach = DimensionsApproach.widthBased,
  }) {
    return EdgeInsets.fromLTRB(
      setWidth(horizontal ?? 0.0),
      setHeight(vertical ?? 0.0, dimensionsApproach),
      setWidth(horizontal ?? 0.0),
      setHeight(vertical ?? 0.0, dimensionsApproach),
    );
  }

  EdgeInsets getEdgeInsetsAll(double size) {
    return EdgeInsets.only(top: setHeight(size), bottom: setHeight(size), left: setWidth(size), right: setWidth(size));
  }

  EdgeInsets getEdgeInsetsFromLTRB(double left, double top, double right, double bottom) {
    return EdgeInsets.fromLTRB(setWidth(left), setHeight(top), setWidth(right), setHeight(bottom));
  }
}

enum DimensionsApproach { widthBased, heightBased }

extension DimensionsDoubleExtension on double {
  double get w {
    return Dimensions.I.setWidth(this);
  }

  double get h {
    return Dimensions.I.setHeight(this);
  }

  double get sp {
    return Dimensions.I.setSp(this);
  }
}

extension DimensionsIntExtension on int {
  double get w {
    return Dimensions.I.setWidth(toDouble());
  }

  double get h {
    return Dimensions.I.setHeight(toDouble());
  }

  double get sp {
    return Dimensions.I.setSp(toDouble());
  }
}
