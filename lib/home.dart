import 'package:flutter/material.dart';

enum widgetmaker { Graph, Status, Info }

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Widget Switch Demo"),
        centerTitle: true,
      ),
      body: BodyWidget(),
    );
  }
}

class BodyWidget extends StatefulWidget {
  @override
  _BodyWidgetState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  widgetmaker SelectwidgetMarker = widgetmaker.Graph;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                setState(() {
                  SelectwidgetMarker = widgetmaker.Graph;
                });
              },
              child: Text("Graph",style: TextStyle(color:(SelectwidgetMarker==widgetmaker.Graph) ?Colors.black : Colors.black12),),
            ),
            FlatButton(
              onPressed: () {
                setState(() {
                  SelectwidgetMarker = widgetmaker.Status;
                });
              },
              child: Text("Status",style: TextStyle(color: (SelectwidgetMarker==widgetmaker.Status) ?Colors.black :Colors.black12)),
            ),
            FlatButton(
              onPressed: () {
                setState(() {
                  SelectwidgetMarker = widgetmaker.Info;
                });
              },
              child: Text("Info",style: TextStyle(color:(SelectwidgetMarker==widgetmaker.Info) ?Colors.black : Colors.black12)),
            ),
          ],
        ),
        Container(
          child: getCustomContainer(),
        ),
      ],
    );
  }

  Widget getCustomContainer() {
    switch (SelectwidgetMarker) {
      case widgetmaker.Graph:
        return getwidgetgraph();

      case widgetmaker.Info:
        return getwidgetinfo();

      case widgetmaker.Status:
        return getwidgetStatus();
    }

    return getwidgetgraph();
  }

  Widget getwidgetgraph() {
    return Container(
      height: 200,
      color: Colors.blue,
    );
  }

  Widget getwidgetStatus() {
    return Container(
      height: 300,
      color: Colors.yellow,
    );
  }

  Widget getwidgetinfo() {
    return Container(
      height: 400,

      color: Colors.green,
    );
  }
}
