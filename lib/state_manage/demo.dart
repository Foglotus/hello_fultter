
import 'package:flutter/material.dart';
class StateManagementDemo extends StatefulWidget {
  @override
  _StateManagement createState() =>_StateManagement();

}

class _StateManagement extends State<StateManagementDemo>{
  int _count = 0;
  void increaseCount(){
    setState(() {
      _count++;
    });
  }
  @override
  Widget build(BuildContext context) {   
    return CounterProvider(
      count: _count,
      increaseCount: increaseCount,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Inherite'),
        ),
        body: CounterWrapper(),
      ),
    );
  }

}

class CounterWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Counter(),
    );
  }
}

class Counter extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final int count = CounterProvider.of(context).count;
    return ActionChip(
      label: Text('$count'),
      onPressed: CounterProvider.of(context).increaseCount,
    );
  }
}

class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback increaseCount;
  final Widget child;

  CounterProvider({
    this.count,
    this.increaseCount,
    this.child,
  }) : super(child: child);

  static CounterProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType(aspect: CounterProvider);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}