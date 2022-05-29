import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_counter_change_notifier_provider/providers/counter_change_notifier.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyWidget(),
    );
  }
}

//HOW TO GET AN INSTANCE OF YOUR PROVIDER
final _counterProvider = ChangeNotifierProvider<CounterChangeNotifier>(
    (ref) => CounterChangeNotifier());

const int _valToSubtract = -3;

class MyWidget extends ConsumerWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Riverpod - ChangeNotifier")),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${ref.watch(_counterProvider).counter}', //<--- HOW TO READ THE VALUE OF AN ATTRIBUTE
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => ref
                .read(_counterProvider)
                .increment(), //<--- HOW TO CALL A METHOD
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 100 * 2,
          ),
          FloatingActionButton(
            onPressed: () => ref.read(_counterProvider).decrement(),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 100 * 2,
          ),
          FloatingActionButton(
              onPressed: () => ref.read(_counterProvider).modifyValueWithInput(
                  _valToSubtract), //<--- HOW TO CALL A METHOD WITH AN ARGUMENT
              tooltip: 'Decrement $_valToSubtract',
              child: const Text('$_valToSubtract')),
        ],
      ),
    );
  }
}
