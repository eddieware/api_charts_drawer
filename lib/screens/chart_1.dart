import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../api/apiservice.dart';

class VerticalBarLabelChart extends StatefulWidget {
  List<charts.Series> seriesList;
  final bool animate;
  VerticalBarLabelChart(this.seriesList, {this.animate});

  factory VerticalBarLabelChart.withSampleData() {
    return new VerticalBarLabelChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  _VerticalBarLabelChartState createState() => _VerticalBarLabelChartState();

  /// Create one series with sample hard coded data.
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final data = [
      new OrdinalSales('Fernando', 55),
      new OrdinalSales('Jose', 95),
      new OrdinalSales('Edgar', 50),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
          id: 'Sales',
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: data,
          // Set a label accessor to control the text of the bar label.
          labelAccessorFn: (OrdinalSales sales, _) =>
              '${sales.sales.toString()}pts')
    ];
  }
}

class _VerticalBarLabelChartState extends State<VerticalBarLabelChart> {
  BuildContext context;
  ApiService apiService;

  @override
  void initState() {
    super.initState();
    apiService = ApiService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Widgets Chart1')),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 16,
            ),
            Container(
              // padding: EdgeInsets.all(16),
              //color: Colors.green,
              height: 500,
              width: 400,
              child: charts.BarChart(
                widget.seriesList,
                animate: widget.animate,
                // Set a bar label decorator.
                // Example configuring different styles for inside/outside:
                //       barRendererDecorator: new charts.BarLabelDecorator(
                //          insideLabelStyleSpec: new charts.TextStyleSpec(...),
                //          outsideLabelStyleSpec: new charts.TextStyleSpec(...)),
                barRendererDecorator: new charts.BarLabelDecorator<String>(),
                domainAxis: new charts.OrdinalAxisSpec(),
              ),
            ),
            Container(
              //color: Colors.amber,
              child: Text(
                'Android Class',
                style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
