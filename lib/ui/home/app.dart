import 'package:consumir_web_api/screens/chart_1.dart';
import 'package:consumir_web_api/screens/chart_2.dart';
import 'package:consumir_web_api/screens/chart_3.dart';
import 'package:consumir_web_api/screens/chart_4.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'Ejemplo Navigation Drawer';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('EXAMPLE WITH DRAWER')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Pulsa el menu para ver las graficas'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text(
                'Charts (Pt1)',
                //style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
              ),
              onTap: () {
                //List seriesL = ['name1', 'name2', 'name3'];
                final route1 = MaterialPageRoute(
                    builder: (context) => VerticalBarLabelChart(
                        VerticalBarLabelChart.withSampleData().seriesList));

                Navigator.push(context, route1);
              },
            ),
            ListTile(
              title: Text(
                'Charts (Pt2)',
                //style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
              ),
              onTap: () {
                final route1 = MaterialPageRoute(
                    builder: (context) => HorizontalBarLabelChart(
                        HorizontalBarLabelChart.withSampleData().seriesList));

                Navigator.push(context, route1);
              },
            ),

            ListTile(
              title: Text(
                'Charts Pt3',
                //style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
              ),
              onTap: () {
                final route1 =
                    MaterialPageRoute(builder: (context) => Widgets_pt3());

                Navigator.push(context, route1);
              },
            ),

            ListTile(
              title: Text(
                'Charts Pt4',
                //style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
              ),
              onTap: () {
                final route1 =
                    MaterialPageRoute(builder: (context) => Charts_pt4());

                Navigator.push(context, route1);
              },
            ),

            //     Navigator.push(context, route2);
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
