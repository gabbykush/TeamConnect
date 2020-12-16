/// Example of a simple line chart.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class SimpleLineChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimpleLineChart(this.seriesList, {this.animate});

  /// Creates a [LineChart] with sample data and no transition.
  factory SimpleLineChart.withSampleData() {
    return new SimpleLineChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.TimeSeriesChart(
      seriesList,
      animate: animate,
      dateTimeFactory: const charts.LocalDateTimeFactory(),
      // defaultRenderer:
      //     new charts.LineRendererConfig(includeArea: true, stacked: true),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<FundsData, DateTime>> _createSampleData() {
    final data = [
      new FundsData(new DateTime(2017, 9, 19), 5),
      new FundsData(new DateTime(2017, 9, 26), 25),
      new FundsData(new DateTime(2017, 10, 3), 100),
      new FundsData(new DateTime(2017, 10, 10), 75),
    ];

    return [
      new charts.Series<FundsData, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (FundsData sales, _) => sales.time,
        measureFn: (FundsData sales, _) => sales.price,
        data: data,
      )
    ];
  }
}

/// Sample linear data type.
class FundsData {
  final DateTime time;
  final int price;

  FundsData(this.time, this.price);

  FundsData.fromMap(Map<String, dynamic> map)
      : assert(map['FundsDataVal'] != null),
        assert(map['FundsDataDate'] != null),
        time = map['FundsDataDate'],
        price = map['FundsDataVal'];

  @override
  String toString() => "Record<$time:$price>";
}
