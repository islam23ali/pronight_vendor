import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/app_theme/app_colors.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/my_separator.dart';

class CustomCouponCard extends StatelessWidget {
  const CustomCouponCard({
    Key? key,
    required this.firstChild,
    required this.secondChild,
    this.width,
    this.height = 150,
    this.borderRadius = 8,
    this.curveRadius = 20,
    this.curvePosition = 100,
    this.curveAxis = Axis.horizontal,
    this.clockwise = false,
    this.backgroundColor,
    this.decoration,
    this.shadow,
    this.border, this.lineColor=AppColors.white, this.lineHeight,
  }) : super(key: key);

  final Widget firstChild;
  final Widget secondChild;
  final double? width;
  final double height;
  final double borderRadius;
  final double curveRadius;
  final double curvePosition;
  final double? lineHeight;
  final Axis curveAxis;
  final bool clockwise;
  final Color? backgroundColor;
  final Color? lineColor;
  final Decoration? decoration;
  final Shadow? shadow;
  final BorderSide? border;
  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [
      if (curveAxis == Axis.horizontal)
        SizedBox(
          width: double.maxFinite,
          height: curvePosition + (curveRadius / 2),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              firstChild,
               MySeparator(color:lineColor?? AppColors.blue,height:lineHeight?? 2.w,)
            ],
          ),
        )
      else
        SizedBox(
          width: curvePosition + (curveRadius / 2),
          height: double.maxFinite,
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              firstChild,
              RotatedBox(quarterTurns: 1,
              child: MySeparator(color:lineColor?? AppColors.white,height:lineHeight?? 2.w,))
            ],
          ),
        ),
      Expanded(child: secondChild),
    ];

    final clipper = CouponClipper(
      borderRadius: borderRadius,
      curveRadius: curveRadius,
      curvePosition: curvePosition,
      curveAxis: curveAxis,
      direction: Directionality.of(context),
      clockwise: clockwise,
    );

    return CustomPaint(
      painter: CouponDecorationPainter(
        shadow: shadow,
        border: border,
        clipper: clipper,
      ),
      child: ClipPath(
        clipper: clipper,
        child: Container(
          width: width,
          height: height,
          decoration: decoration ?? BoxDecoration(color: backgroundColor),
          child: curveAxis == Axis.horizontal
              ? Column(children: children)
              : Row(children: children),
        ),
      ),
    );
  }
}
class CouponClipper extends CustomClipper<Path> {
  const CouponClipper({
    this.borderRadius = 8,
    this.curveRadius = 20,
    this.curvePosition = 100,
    this.curveAxis = Axis.horizontal,
    this.direction = TextDirection.ltr,
    this.clockwise = false,
  }) : assert(
  curvePosition > borderRadius,
  );
  final double borderRadius;
  final double curveRadius;
  final double curvePosition;
  final Axis curveAxis;
  final TextDirection direction;
  final bool clockwise;
  @override
  Path getClip(Size size) {
    double directionalCurvePosition = curvePosition;

    if (curveAxis == Axis.vertical && direction == TextDirection.rtl) {
      directionalCurvePosition = size.width - curvePosition - curveRadius;
    }
    final Radius arcRadius = Radius.circular(borderRadius);
    final Offset bottomLeftArc = Offset(borderRadius, size.height);
    final Offset bottomRightArc =
    Offset(size.width, size.height - borderRadius);
    final Offset topRightArc = Offset(size.width - borderRadius, 0);
    final Offset topLeftArc = Offset(0, borderRadius);
    final Path path = Path();
    path.moveTo(0, borderRadius - 2);
    if (curveAxis == Axis.horizontal) {
      path.lineTo(0, directionalCurvePosition);
      path.quadraticBezierTo(
        curveRadius / 1.5,
        directionalCurvePosition + (curveRadius / 2),
        0,
        directionalCurvePosition + curveRadius,
      );
    }
    path.lineTo(0, size.height - borderRadius);
    path.arcToPoint(bottomLeftArc, radius: arcRadius, clockwise: clockwise);
    if (curveAxis == Axis.vertical) {
      path.lineTo(directionalCurvePosition, size.height);
      path.quadraticBezierTo(
        directionalCurvePosition + (curveRadius / 2),
        size.height - (curveRadius / 1.5),
        directionalCurvePosition + curveRadius,
        size.height,
      );
    }
    path.lineTo(size.width - borderRadius, size.height);
    path.arcToPoint(bottomRightArc, radius: arcRadius, clockwise: clockwise);
    if (curveAxis == Axis.horizontal) {
      path.lineTo(size.width, directionalCurvePosition + curveRadius);
      path.quadraticBezierTo(
        size.width - (curveRadius / 1.5),
        directionalCurvePosition + (curveRadius / 2),
        size.width,
        directionalCurvePosition,
      );
    }
    path.lineTo(size.width, borderRadius);
    path.arcToPoint(topRightArc, radius: arcRadius, clockwise: clockwise);
    if (curveAxis == Axis.vertical) {
      path.lineTo(directionalCurvePosition + curveRadius, 0);
      path.quadraticBezierTo(
        (directionalCurvePosition - (curveRadius / 2)) + curveRadius,
        curveRadius / 1.5,
        directionalCurvePosition - curveRadius + curveRadius,
        0,
      );
    }
    path.lineTo(borderRadius, 0);
    path.arcToPoint(topLeftArc, radius: arcRadius, clockwise: clockwise);

    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => oldClipper != this;
}
class CouponDecorationPainter extends CustomPainter {
  final Shadow? shadow;
  final BorderSide? border;
  final CustomClipper<Path> clipper;
  CouponDecorationPainter({
    this.shadow,
    this.border,
    required this.clipper,
  });
  @override
  void paint(Canvas canvas, Size size) {
    if (shadow != null) {
      final paintShadow = shadow!.toPaint();
      final pathShadow = clipper.getClip(size).shift(shadow!.offset);
      canvas.drawPath(pathShadow, paintShadow);
    }
    if (border != null) {
      final paintBorder = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = border!.width
        ..color = border!.color;
      final pathBorder = clipper.getClip(size);
      canvas.drawPath(pathBorder, paintBorder);
    }
  }
  @override
  bool shouldRepaint(CouponDecorationPainter oldDelegate) =>
      this != oldDelegate;
  @override
  bool shouldRebuildSemantics(CouponDecorationPainter oldDelegate) =>
      this != oldDelegate;
}
