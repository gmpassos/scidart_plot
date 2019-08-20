import 'package:color/color.dart';
import 'package:meta/meta.dart';
import 'package:scidart_plot/src/svg/abstract/svg_widget.dart';

class Ellipse implements SvgWidget {
  double cx;
  double cy;
  double rx;
  double ry;

  // override
  Color fill;
  Color stroke;
  double strokeWidth;
  String style;

  Ellipse(
      {@required this.cx,
      @required this.cy,
      @required this.rx,
      @required this.ry,
      this.fill,
      this.stroke,
      this.strokeWidth,
      this.style});

  @override
  String toXML() {
    var xml = '<ellipse cx="${cx}" cy="${cx}" rx="${rx}" ry="${ry}" '
        'fill="${fill.toHexColor().toCssString()}" '
        'stroke="${stroke.toHexColor().toCssString()}" '
        'stroke-width="${strokeWidth}" '
        'style="${style}" />';
    return xml;
  }
}
