library order_widget;

import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:google_fonts/google_fonts.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}


class OrderStatus extends StatefulWidget {
  Size size;
  OrderStatus(this.size, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState()  => _OrderStatus();
}

class _OrderStatus extends State<OrderStatus> {
  final List<ChartData> chartData = [
    ChartData('Jan', 850),
    ChartData('Feb', 750),
    ChartData('Mar', 700),
    ChartData('Apr', 450),
    ChartData('May', 300)
  ];

  List<Color> colors = <Color>[
    const Color.fromRGBO(75, 135, 185, 1),
  ];

  Widget build(BuildContext context) {

    return Container(
        height: widget.size.height * 0.55,
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Stack(
              children: [
                Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/chart.png",
                          height: widget.size.width * .05,
                          width: widget.size.width * .05,
                        ),
                        Text(
                          "64,3%",
                          style: GoogleFonts.roboto().copyWith(
                            color: const Color(0xff383874),
                            fontSize: widget.size.width * .026,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    )
                ),
                Transform.rotate(
                  angle: math.pi,
                  child: SfCircularChart(
                    palette: <Color>[
                      Color(0xffFF708B),
                      Color(0xffFFBA69),
                      Color(0xff01F1E3),
                      Color(0xff8676FF),
                      Color(0xff7517F8),
                    ],
                    series: <CircularSeries>[
                      // Renders radial bar chart
                      RadialBarSeries<ChartData, String>(
                        dataSource: chartData,
                        maximumValue: 1000,
                        gap: "10",
                        innerRadius: "120",
                        radius: "230",
                        strokeWidth: 10,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
                        cornerStyle: CornerStyle.bothCurve,
                        dataLabelSettings: DataLabelSettings(
                            angle: 180,
                            isVisible: true
                        ),
                      ),
                    ],
                  ),
                ),
              ]
          ),
        ),


    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}