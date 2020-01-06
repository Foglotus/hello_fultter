import 'package:flutter/material.dart';
import 'dart:async';
class StreamDemo extends StatefulWidget {
  @override
  _StreamDemoState createState() => _StreamDemoState();
}

class _StreamDemoState extends State<StreamDemo> {
  StreamSubscription _streamSubscription;
  StreamController<String> _streamController;
  StreamSink _streamSink;

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    //_streamController = StreamController<String>();
    _streamController = StreamController.broadcast();
    _streamSubscription = _streamController.stream
        .listen(onData, onDone: onDone, onError: onError);
    _streamSink = _streamController.sink;
  }

  void onDone() {
    print('Done');
  }

  void onError(error) {
    print(error);
  }

  void onData(String data) {
    print('data come:$data');
  }

  void _addDataToStream() async {
    print('add data to stream');
    String data = await futureData();
    //_streamController.add(data);
    _streamSink.add(data);
  }

  void _pauseStream() {
    print('Pause');
    _streamSubscription.pause();
  }

  void _resumeStream() {
    print('Resume');
    _streamSubscription.resume();
  }

  void _cancleStream() {
    print('Cancle');
    _streamSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamDemo'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          StreamBuilder<String>(
            initialData: '...',
            stream: _streamController.stream,
            builder: (context, snapshot) {
              return Text('${snapshot.data}');
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('Add'),
                onPressed: _addDataToStream,
              ),
              FlatButton(
                child: Text('Pause'),
                onPressed: _pauseStream,
              ),
              FlatButton(
                child: Text('Resume'),
                onPressed: _resumeStream,
              ),
              FlatButton(
                child: Text('Caccle'),
                onPressed: _cancleStream,
              )
            ],
          )
        ],
      )),
    );
  }

  Future<String> futureData() async {
    await Future.delayed(Duration(seconds: 3));
    return 'hello ~' + DateTime.now().toString();
  }
}