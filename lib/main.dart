import 'package:flutter/material.dart';
import 'package:flutterprovidertest/counter_store.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());
CounterStore counterStore = CounterStore();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (context) => CounterStore(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CounterStore>(builder: (context, counterStore, _) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Provider Test'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                color: Colors.green,
                child: Text('Press Me!'),
                onPressed: () {
                  counterStore.incrementCounter();
                },
              ),
              Text('${counterStore.count}'),
            ],
          ),
        ),
      );
    });
  }
}
