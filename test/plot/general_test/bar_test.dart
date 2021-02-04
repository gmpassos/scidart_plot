import 'package:scidart/numdart.dart';
import 'package:scidart_plot/scidart_plot.dart';
import 'package:test/test.dart';

import '../../helpers.dart';

void main() {
  const directory = './test_files/';
  group('bar plot', () {
    test('bar simple', () async {
      var N = 0.1;
      var n = linspace(0, N, num: 50, endpoint: false);
      var f1 = 60.0;
      var sg = arraySin(arrayMultiplyToScalar(n, 2 * pi * f1));
      print(sg);

      var line = PlotGeneral(ay: sg, plotGeneralType: PlotGeneralType.Bar);
      var plotExample = canvasGeneral(ax: n, lines: [line]);

      await saveSvg(plotExample, directory + 'barSimple');
    });

    test('bar big set', () async {
      var N = 0.1;
      var n = linspace(0, N, num: 1000, endpoint: false);
      var f1 = 60.0;
      var sg = arraySin(arrayMultiplyToScalar(n, 2 * pi * f1));
      print(sg);

      var line = PlotGeneral(ay: sg, plotGeneralType: PlotGeneralType.Bar);
      var plotExample = canvasGeneral(ax: n, lines: [line]);

      await saveSvg(plotExample, directory + 'barBigSet');
    });

    test('bar 1 lines 2 dashed Legend top right big text title line filled',
        () async {
      var N = 0.1;
      var n = linspace(0, N, num: 50, endpoint: false);
      var f1 = 60.0;
      var sg = arraySin(arrayMultiplyToScalar(n, 2 * pi * f1));
      var sg2 = arrayDivisionToScalar(
          arraySin(arrayMultiplyToScalar(n, 2 * pi * f1)), 2);
      var sg3 = arrayDivisionToScalar(
          arraySin(arrayMultiplyToScalar(n, 2 * pi * f1 * 2)), 2);

      var line = PlotGeneral(
          ay: sg,
          stroke: Color.purple,
          // strokeDasharray: StrokeDasharray.dash2,
          strokeWidth: StrokeWidth.width5,
          fill: Color.green,
          plotGeneralType: PlotGeneralType.Bar);
      var line2 = PlotGeneral(
          ay: sg2, stroke: Color.blue, strokeDasharray: StrokeDasharray.dash5);
      var line3 = PlotGeneral(ay: sg3, stroke: Color.orange);

      var legend1 =
          LegendItem('Bacon ipsum dolor amet meatloaf porchetta beef');
      var legend2 = LegendItem('line 2');
      var legend3 = LegendItem('line 3');

      var plotExample = canvasGeneral(
          ax: n,
          lines: [line, line2, line3],
          title: 'bresaola shankle rump cupim',
          legend: Legend([legend1, legend2, legend3], LegendPosition.topRight));

      await saveSvg(plotExample,
          directory + 'bar1Lines2DashedLegendTopRightBigTextTitleLineFilled');
    });
  });
}
