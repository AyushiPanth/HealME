import 'package:flutter/material.dart';

import 'package:healme/constants.dart';
import 'custom_button.dart';

class CustomProgressWidget extends StatefulWidget {
  @override
  _CustomProgressWidgetState createState() => _CustomProgressWidgetState();
}

class _CustomProgressWidgetState extends State<CustomProgressWidget> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: 50,
      child: Stack(
        children: <Widget>[
          _mainProgress(width),
          _progressValue(width),
          _indicatorButton(width),
        ],
      ),
    );
  }

  Widget _indicatorButton(double width) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        height: 40,
        width: width,
        child: Row(
          children: <Widget>[
            CustomButtonWidget(
              size: 30,
              onTap: null,
              child: Icon(
                Icons.fiber_manual_record,
                size: 20,
                color: kPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _progressValue(double width) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        height: 5,
        width: width,
        decoration: BoxDecoration(
          color: kPrimaryLightColor,
          border: Border.all(
            color: kPrimaryColor.withAlpha(90),
            width: .5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
      ),
    );
  }

  Widget _mainProgress(double width) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        height: 5,
        width: width,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          border: Border.all(
            color: kPrimaryColor.withAlpha(90),
            width: .5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
      ),
    );
  }
}

class CustomSliderThumbRect extends SliderComponentShape {
  final double thumbRadius;
  final thumbHeight;
  final int min;
  final int max;

  const CustomSliderThumbRect({
    this.thumbRadius,
    this.thumbHeight,
    this.min,
    this.max,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    Animation<double> activationAnimation,
    Animation<double> enableAnimation,
    bool isDiscrete,
    TextPainter labelPainter,
    RenderBox parentBox,
    SliderThemeData sliderTheme,
    TextDirection textDirection,
    double value,
    double textScaleFactor,
    Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final rRect = RRect.fromRectAndRadius(
      Rect.fromCenter(
          center: center, width: thumbHeight * 1.2, height: thumbHeight * .6),
      Radius.circular(thumbRadius * .4),
    );

    final paint = Paint()
      ..color = kPrimaryColor //Thumb Background Color
      ..style = PaintingStyle.fill;

    canvas.drawRRect(rRect, paint);
  }

  String getValue(double value) {
    return (min + (max - min) * value).round().toString();
  }
}
