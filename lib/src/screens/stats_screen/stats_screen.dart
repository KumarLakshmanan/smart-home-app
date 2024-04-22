import 'package:domus/src/screens/stats_screen/components.dart';
import 'package:flutter/material.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({Key? key}) : super(key: key);

  static String routeName = '/stats-screen';

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Column(
          children: [
            TypeSelection(),
            SizedBox(height: 15),
            Expanded(
              child: StatsElectricityUsageChart(),
            ),
            SizedBox(height: 15),
            Expanded(
              child: StatsDeviceConsumptionChart(),
            ),
            SizedBox(height: 15),
          ],
        ),
      ],
    );
  }
}
