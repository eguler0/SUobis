
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'indicator.dart';

class PieChartExample extends StatefulWidget {
  int uzunluk;
  double vize;
  double final_notlari;
  double but;
  PieChartExample(this.uzunluk,this.vize,this.final_notlari,this.but,{Key key}) : super(key: key);

  @override
  _PieChartExampleState createState() => _PieChartExampleState();
}

class _PieChartExampleState extends State<PieChartExample> {
  int touchedIndex=-1;
  double finalYuzde;
  double butYuzde;
  double vizeYuzde;
  @override
  Widget build(BuildContext context) {
    vizeYuzde=(widget.vize*100)/(widget.vize+widget.final_notlari+widget.but);
    finalYuzde=(widget.final_notlari*100)/(widget.vize+widget.final_notlari+widget.but);
    butYuzde=(widget.but*100)/(widget.vize+widget.final_notlari+widget.but);
    return  AspectRatio(
      aspectRatio: 1.3,
      child: Card(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            const SizedBox(
              height: 18,
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                      pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
                        setState(() {
                          final desiredTouch = pieTouchResponse.touchInput is! PointerExitEvent &&
                              pieTouchResponse.touchInput is! PointerUpEvent;
                          if (desiredTouch && pieTouchResponse.touchedSection != null) {
                            touchedIndex = pieTouchResponse.touchedSection.touchedSectionIndex;
                          } else {
                            touchedIndex = -1;
                          }
                        });
                      }),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 0,
                      centerSpaceRadius: 40,
                      sections: showingSections()),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Indicator(
                  color: Color(0xff0293ee),
                  text: "Vize",
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Color(0xfff8b250),
                  text: 'Final',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Color(0xff845bef),
                  text: 'Büt',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),

              ],
            ),
            const SizedBox(
              width: 28,
            ),
          ],
        ),
      ),
    );

  }
  List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value:widget.vize,
            title: 'Vize: %${vizeYuzde.roundToDouble()}',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: widget.final_notlari,
            title: 'Final: %${finalYuzde.roundToDouble()}',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: widget.but,
            title: 'But: %${butYuzde.roundToDouble()}',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        default:
          throw Error();
      }
    });
  }
}
