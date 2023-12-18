import 'package:final_sprs/data/dataProviders/dashBoardData.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import "package:final_sprs/resource/percentIndicatorValue.dart";

Widget buildCircularPercentIndicator(double percent) {
  return CircularPercentIndicator(
    radius: 120.0,
    lineWidth: 30.0,
    percent: percent,
    center: Text(
      "${(percent * 100).toStringAsFixed(1)}%",
      style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(166, 93, 80, 1)),
    ),
    progressColor: const Color.fromRGBO(230, 109, 87, 1),
    backgroundColor: const Color.fromRGBO(22, 194, 213, 1),
  );
}

class PercentDiplay extends StatefulWidget {
  final List<Map<String, dynamic>>? data;
  PercentDiplay({super.key, required this.data});

  @override
  State<PercentDiplay> createState() => _PercentDiplayState();
}

class _PercentDiplayState extends State<PercentDiplay> {
  List<Map<String, dynamic>>? dataList1;
  double percent = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.data == null) {
      percent = 0;
    } else {
      percent = widget.data![widget.data!.length - 1]["value"] / 100;
    }

    return buildCircularPercentIndicator(percent);
  }
}
