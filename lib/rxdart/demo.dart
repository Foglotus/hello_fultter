import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class RxDartDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RxDart'),
      ),
      body: RxDartDemoHome(),
    );
  }
}

class RxDartDemoHome extends StatefulWidget {
  @override
  _RxDartDemoHomeState createState() => _RxDartDemoHomeState();
}

class _RxDartDemoHomeState extends State<RxDartDemoHome> {
  PublishSubject<String> _subject;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Observable<String> _observable = //Observable(Stream.fromIterable(['hello','nihao']));
    // //Observable.fromFuture(Future.value('hello ~'));
    // //Observable.fromIterable(['hello','nihao']);
    // Observable.periodic(Duration(seconds:3),(x)=>x.toString());
    // _observable.listen(print);
    // ReplaySubject<String> _subject = ReplaySubject<String>();
    // _subject.listen((data)=> print('listen 1: $data'));
    // _subject.add('hello');
    // _subject.listen((data)=> print('listen 2:${data.toUpperCase()}'));
    // _subject.add('hello');
    // _subject.close();
    _subject = PublishSubject<String>();
    _subject.debounce(Duration(milliseconds: 500)).listen(print);
  }

  @override
  void dispose() { 
    _subject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        onChanged: _subject.add,
        onSubmitted: (value) => {
          _subject.add('submitted :$value')
        },
        decoration: InputDecoration(
          labelText: 'Title',
          filled: true
        ),
      ),
    );
  }
}