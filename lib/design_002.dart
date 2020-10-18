import 'package:flutter/material.dart';
import 'package:streamsstreamsbuilder/ticker_controller.dart';
class StreamExampleHome extends StatefulWidget {
  @override
  _StreamExampleHomeState createState() => _StreamExampleHomeState();
}

class _StreamExampleHomeState extends State<StreamExampleHome> {
  TickerController tickerController = TickerController();
  @override
  void dispose() {
    tickerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("STREAM"),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: tickerController.tickerStream,
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          if (snapshot.hasError) {
            return Text("error");
          } else if (!snapshot.hasData) {
            return Text("no data");
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  snapshot.data.toString(),
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(
                  height: 45,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    RaisedButton(
                        onPressed: () {
                          tickerController.incrementSink.add(snapshot.data);
                        },
                        child: Icon(Icons.add)),
                    RaisedButton(
                        onPressed: () {
                          tickerController.decrementSink.add(snapshot.data);
                        },
                        child: Icon(Icons.remove)),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
