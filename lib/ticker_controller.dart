import 'dart:async';

class TickerController {
  int _ticker;

  final StreamController<int> _tickerController = StreamController<int>();
  Stream<int> get tickerStream => _tickerController.stream;
  StreamSink<int> get tickerSink => _tickerController.sink;

  final StreamController<int> _incrementController = StreamController<int>();
  StreamSink<int> get incrementSink => _incrementController.sink;

  final StreamController<int> _decrementController = StreamController<int>();
  StreamSink<int> get decrementSink => _decrementController.sink;

  TickerController() {
    _ticker = 0;
    _tickerController.add(_ticker);
    _incrementController.stream.listen(_incrementTicker);
    _decrementController.stream.listen(_decrementTicker);
  }

  void _incrementTicker(int ticker) {
    ticker++;
    tickerSink.add(ticker);
  }

  void _decrementTicker(int ticker) {
    if (ticker > 0) {
      ticker--;
    }
    tickerSink.add(ticker);
  }

  void dispose() {
    _tickerController.close();
    _incrementController.close();
    _decrementController.close();
  }
}
